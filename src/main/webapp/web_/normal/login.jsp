<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>用户登录</title>
  <link rel="shortcut icon" href="<%=path %>/img/favicon.ico">
  <link rel="stylesheet" href="<%=path %>/css/login.css">
</head>

<body>
  <div id="login">
    <div class="wrapper">
      <div class="login">
        <form action="<%=path %>/login/login.do" method="post" class="container offset1 loginform">
          <div id="owl-login">
            <div class="hand"></div>
            <div class="hand hand-r"></div>
            <div class="arms">
              <div class="arm"></div>
              <div class="arm arm-r"></div>
            </div>
          </div>
          <div class="pad">
            <input type="hidden" name="_csrf" value="hiden">
            <div class="control-group">
              <div class="controls">
                <label for="user" class="control-label fa fa-user"></label>
                <input id="user" type="user" name="sno" placeholder="学号" tabindex="1" autofocus="autofocus" class="form-control input-medium">
              </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <label for="password" class="control-label fa fa-asterisk"></label>
                <input id="password" type="password" name="password" placeholder="Password" tabindex="2" class="form-control input-medium">
              </div>
            </div>
          </div>
          <div class="form-actions">
            <input  type="checkbox" name="rememberMe"/>记住密码
            <a href="<%=path %>/web_/all/forget.jsp" tabindex="5" class="btn pull-left btn-link text-muted">忘记密码?</a>
            <a href="<%=path %>/web_/all/register.jsp" tabindex="6" class="btn btn-link text-muted">注册</a>
            <button type="submit" tabindex="4" class="btn btn-primary">登录</button>
          </div>
        </form>
      </div>
    </div>
    <script src="<%=path %>/js/jquery-3.1.0.min.js"></script>
    <script>
      $(function() {
        $('#login #password').focus(function() {
          $('#owl-login').addClass('password');
        }).blur(function() {
          $('#owl-login').removeClass('password');
        });
      });
    </script>
  </div>
  <!-- end -->
</body>

</html>

