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
  <title>EF注册</title>
  <link rel="shortcut icon" href="<%=path %>/img/favicon.ico">
  <link rel="stylesheet" href="<%=path %>/assets/css/styles.css" />
  <!--[if lt IE 9]>
          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
</head>
<body>
  <div id="main">
    <h1>EF直播平台注册</h1>
    <form class="" method="post" action="<%=path %>/user/save.do">
      <div class="row pass">
        <input type="text" id="user" name="sno" placeholder="学号" />
      </div>
      <div class="row email">
        <input type="text" id="email" name="email" placeholder="Email" />
      </div>
      <div class="sex">
        <label for="">性别：男</label>
        <input type="radio" name="gender" id="" value="男">
        <label for="">女</label>
        <input type="radio" name="gender" class="radio" value="女">
      </div>
      <div class="row pass">
        <input type="password" id="password1" name="password" placeholder="请输入密码" />
      </div>
      <div class="row pass">
        <input type="password" id="password2" name="password" placeholder="请再次输入您的密码" disabled="true" />
      </div>

      <div class="arrowCap"></div>
      <div class="arrow"></div>
      <p class="meterText">密码强度</p>
      <input type="submit" value="注册" />
    </form>
  </div>
  <script src="<%=path %>/js/jquery-3.1.0.min.js"></script>
  <script src="<%=path %>/assets/js/jquery.complexify.js"></script>
  <script src="<%=path %>/assets/js/script.js"></script>
</body>
</html>

