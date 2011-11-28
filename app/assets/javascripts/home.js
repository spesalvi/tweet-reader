document.onready = function() {
  var iframeHeight = window.screen.availHeight,
      iframe = document.getElementsByTagName('iframe')[0];
  iframe.height = iframeHeight;
}
