<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/dashboard.css">
</head>
<body>
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
<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
	<h2 class="sub-header">Users</h2>
	<div class="t_label ml10" style="margin-left:20px;">
						记录数：<font color="red" id="totalRecode">${count}</font>
					</div>
	<div class="table-responsive">
		<form action="<%=path %>/user/addRole.do" method="post">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>用户名</th>
						<th>角色</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users }" var="user">
						<tr>
							<td>${user.sno}</td>
							<td><input type="hidden" name="userId" value="${user.id }">${user.role.name }</td>
							<td><a href="<%=path%>/user/detele.do?id=${user.id}">删除</a>
								<a href="<%=path%>/user/addRole.do?userId=${user.id}">更改角色</a></td>
							
						</tr>
					</c:forEach>
					<c:forEach items="${ roles}" var="r">
						<tr>
							<td><c:if test="${role.id eq r.id}">
									<span class="input-group-addon"> ${role.name } <input
										type="radio" name="role" value="${ r.id}"></span>
								</c:if> <c:if test="${role.id ne r.id }">
									<span class="input-group-addon"> ${r.name } <input
										type="radio" name="role" value="${ r.id}"></span>
								</c:if></td>
						</tr>
					</c:forEach>
					<tr>
						<td><c:if test="${not empty role }">
								<input type="submit" value="更改" />
							</c:if></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	</div>
	<script type="text/javascript" src="<%=path %>/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
</body>
</html>

