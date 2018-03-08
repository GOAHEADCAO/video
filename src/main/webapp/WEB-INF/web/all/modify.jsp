<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>修改密码</title>
  <link rel="shortcut icon" href="<%=path %>/img/favicon.ico">
  <link rel="stylesheet" href="<%=path %>/assets/css/styles.css" />
  <!--[if lt IE 9]>
          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
</head>
<body>
  <div id="main">
    <h1>EF修改密码${msg} ${user.sno }</h1>
    <form class="" method="post" action="<%=path %>/user/update.do?serial=${serial}">
      <div class="row pass">
        <input type="text" id="user" name="sno" value="${msg }"/>
      </div>
      <div class="row email">
        <input type="text" id="email" name="email"  value="${user.sno }"/>
      </div>
      <div class="row pass">
        <input type="password" id="password1" name="password" placeholder="请输入密码" />
      </div>
      <div class="row pass">
        <input type="password" id="password2" name="password2" placeholder="请再次输入您的密码" disabled="true" />
      </div>

      <div class="arrowCap"></div>
      <div class="arrow"></div>
      <p class="meterText">密码强度</p>
      <input type="submit" value="修改" />
    </form>
  </div>
  <script src="<%=path %>/js/jquery-3.1.0.min.js"></script>
  <script src="<%=path %>/assets/js/jquery.complexify.js"></script>
  <script src="<%=path %>/assets/js/script.js"></script>
</body>
</html>

