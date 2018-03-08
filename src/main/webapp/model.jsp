
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
	<title></title>

	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist\css\bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css\dashboard.css"> 
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">菜鸟教程</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">首页</a></li>
        </ul>
        <p class="navbar-text navbar-right">Signed in as <a href="#" class="navbar-link">Mark Otto</a></p>
    </div>
    </div>
</nav>
<div class="container-fluid">
	<div class="col-sm-2 col-md-2 col-lg-2 sidebar">
		 <ul class="nav nav-sidebar">
            <li>权限演示</li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
            <li>系统设置</li>
             <li><a href="#">用户管理</a></li>
            <li><a href="#">角色管理</a></li>
            <li><a href="#">权限管理</a></li>
          </ul>
	</div>
<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
		内容区域
		<hr/>
		<footer>
			<p class="pull-left">en 很好</p>
            <p class="pull-right">Power By </p>
		</footer>
	</div>
</div>
	<script type="text/javascript" src="js\jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.3.7-dist\js\bootstrap.min.js"></script>
</body>
</html>

