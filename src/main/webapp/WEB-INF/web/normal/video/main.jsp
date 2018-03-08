<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html>
  <head>
    <title>直播了</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="<%=path %>/public/stylesheets/styles.css">
    <link rel="stylesheet" href="<%=path %>/public/stylesheets/index.css">
    <script src="<%=path %>/public/javascripts/CommentCoreLibrary.js"></script>
  </head>
  <body>
    <div id="my-player" style="width:100%; height:500px; background:#000;" class="abp">
      <div id="my-comment-stage" style="width=100%;" class="container">
        <div id="player" style="width:100%;height:480px;">
          <script type="text/javascript" charset="utf-8" src="http://yuntv.letv.com/player/live/blive.js"></script>
          <script>
            var player = new CloudLivePlayer();
            player.init({activityId:"A20170912000008w"});
          </script>
        </div>
      </div>
    </div>
    <iframe src="http://www.lxwgsy.top:3000/emit" name="iframepage" frameborder="0" scrolling="no" width="100%" height="300" onload="IframeLoadEND();"></iframe>
    <script src="http://cdn.bootcss.com/socket.io/1.3.2/socket.io.js"></script>
    <script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.js"></script>
    <script src="public/javascripts/index.js"></script>
  </body>
</html>

