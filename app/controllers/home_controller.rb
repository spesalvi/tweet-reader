class HomeController < ApplicationController
  def index
    configure
    @news = get_latest_news
    @news = @news[0]
  end

  private

  def configure
    Twitter.configure do |config|
      config.consumer_key = 'SMDBMhkytZHlgyIDa5OivA'
      config.consumer_secret = 'FOKArGwrPG5TSxB39a0amUS8Qo7ua2GWLktyK11tMF4'
      config.oauth_token = '208360590-9Q5M268iPghx1G07iwjEu0tKk4fhl9BUHtRIuCqY'
      config.oauth_token_secret = '1qH2l6PzBNKYxsLsilr8OjnDC0xDHNtcNZ8UpPbxA'
    end
  end

  def get_latest_news
    news = []
    timeline = Twitter.home_timeline(:include_entities => true)
    timeline.each do |time_line|
      next if time_line.entities.urls.empty?
      a_news = { :screen_name => time_line.user.screen_name,
        :user_profile_image_url => time_line.user.profile_image_url,
        :tweet_text => time_line.text,
        :url => []}
      time_line.entities.urls.each do |url|
        a_news[:url].push (! url.expanded_url.nil? ? url.expanded_url : url.url)
      end
      news.push a_news
    end 
    news
  end

end
