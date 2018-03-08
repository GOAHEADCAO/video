<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<head>
    <meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/dashboard.css"> 
</head>
<body>
 <script src="<%=path%>/js/jquery-3.1.0.min.js"></script>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">EF直播后台管理系统</a>
    </div>
    <div> 
        <p class="navbar-text navbar-right"><a href="javascript:"class="btn navbar-link" onclick="history.back(); ">返回上一页</a>
        <a href="<%=path %>/web/all/forget.jsp" class="btn  navbar-link ">忘记密码?</a>
        <shiro:user><a href="#"  class="btn pull-left navbar-link">欢迎【<shiro:principal/>】登陆</a><a href="<%=path%>/login/logout.do" class="btn pull-left navbar-link">退出登录</a></shiro:user></p>
    </div>
    </div>
</nav>
<div class="container-fluid">
	<div class="col-sm-2 col-md-2 col-lg-2 sidebar">
		 <ul class="nav nav-sidebar">
            <li>权限演示 </li>
            <li><a href="<%=path%>/cmsController/admin/article/list.do">新闻发布   </a></li>
            <li><a href="<%=path%>/download/showfile.do">文件下载</a></li>
            <li><a href="<%=path%>/uploads/index.jsp">上传文件</a></li>
            <li><a href="<%=path%>/BBS/getAllTopic.do">论坛管理</a></li>
            <li>系统设置</li>
             <li><a href="<%=path%>/user/query.do">用户管理</a></li>
            <li><a href="<%=path%>/role/query.do">角色管理</a></li>
            <li><a href="<%=path%>/resource/query.do">权限管理</a></li>
          </ul>
	</div>
</div>
		<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
</body>


