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
 <div class="container">

      <div class="starter-template">
        <h1>${msg }</h1>
        <a class="abtn gray" href="javascript:myBack();">
				 <i class="icon"></i>首页	</a>
      </div>
    <span class="am-icon-envelope-o"></span><a href="javascript:"class="btn navbar-link" onclick="history.back(); ">返回上一页</a> 
    </div>
	<script type="text/javascript" src="<%=path %>/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
		      <script type="text/javascript"> 
		      function myBack(){
		    	   window.location.href="<%=path%>/";
		       }
		      </script>
</body>
</html>

