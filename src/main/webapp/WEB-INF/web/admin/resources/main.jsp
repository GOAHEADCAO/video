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
   <jsp:include page="/web_/admin/navbar.jsp" ></jsp:include>
   <div>
   <hr/>
   </div>
<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">

<div class="input-group input-group-lg">
   <a href="<%=path %>/web_/admin/addResources.jsp" class="navbar-link">添加权限</a>
</div>
   <h2 class="sub-header">Resource</h2>
   <div class="t_label ml10" style="margin-left:20px;">
						记录数：<font color="red" id="totalRecode">${count}</font>
					</div>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>权限名</th>
                  <th>URL</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${resources }" var="resource">
                <tr>
                  <td>${resource.name}${user.role.id }</td>
                  <td><a href="<%=path%>/resource/detele.do?resourceId=${resource.id}">${resource.url }</a></td>
                  <td><a href="<%=path%>/resource/detele.do?resourceId=${resource.id}">删除</a></td>         
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          </div>
	<script type="text/javascript" src="<%=path %>/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
</body>
</html>

