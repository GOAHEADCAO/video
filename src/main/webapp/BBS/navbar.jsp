<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<head>
    <meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/dashboard.css"> 
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
  <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="<%=path %>/assets/css/admin.css">
</head>
<body>
 <script src="<%=path%>/js/jquery-3.1.0.min.js"></script>

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>EF</strong> <small>论坛</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 帮助？<span class="am-badge am-badge-warning">5</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> ${user.role.name }<span class="am-icon-caret-down"></span>
        </a>
          <li><a href="<%=path%>/user/userDetails.do"><span class="am-icon-user"></span>资料</a></li>
          <li><a href="javascript:"class="btn navbar-link" onclick="history.back(); "><span class="am-icon-envelope-o"></span>返回上一页</a> </li>
          <li><a href="<%=path%>/login/logout.do"><span class="am-icon-power-off"></span>退出</a></li>
    </ul>
  </div>
</header>
		<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
</body>


