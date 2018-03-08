window.addEventListener('load', function() {
  // 在窗体载入完毕后再绑定
  var CM = new CommentManager($('#my-comment-stage'));
  CM.init();
  // 先启用弹幕播放（之后可以停止）
  CM.start();

  //    =_=|||||
  window.CM = CM;

  var socket = io();
  socket.on('danmaku show', function(msg) {
    $('#messages').append($('<li>').text(msg));
    var danmaku = JSON.parse(msg);
    CM.send(danmaku);
  });

});
function reinitIframe(){
var iframe = document.getElementById("iframepage");
try{
    var bHeight = iframe.contentWindow.document.body.scrollHeight;
    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
    var height = Math.max(bHeight, dHeight);
    iframe.height = height;
}catch (ex){}
}

var timer1 = window.setInterval("reinitIframe()", 500); //定时调用开始

//完毕后干掉定时器
function IframeLoadEND(){
var iframe = document.getElementById("iframepage");
try{
    window.clearInterval(timer1);
    var bHeight = iframe.contentWindow.document.body.scrollHeight;
    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
    var height = Math.max(bHeight, dHeight);
    iframe.height = height;
}catch (ex){}
    // 停止定时
    window.clearInterval(timer1);

}
