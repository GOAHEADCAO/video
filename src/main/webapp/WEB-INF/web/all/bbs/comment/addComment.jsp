<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Amaze UI Admin form Examples</title>
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
<shiro:hasRole name="admin">
   <jsp:include page="/web_/admin/navbar.jsp" ></jsp:include>
</shiro:hasRole>
<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
	<shiro:lacksRole name="admin">
   <jsp:include page="/BBS/navbar.jsp" ></jsp:include>
	</shiro:lacksRole>
<div class="am-cf admin-main">
<!-- content start -->
<div class="admin-content">
  <div class="admin-content-body">
<form action="<%=path%>/BBS/addComment.do" method="post">
    <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active">基本信息</li>
        <li class="am-active">${user.sno }</li>
      </ul>
        <input type="hidden" name="id" value="${id }" class="am-input-sm">
        <input type="hidden" name="publisher" value="${user.sno }" class="am-input-sm">
            内容描述  : <textarea rows="10" column="20" name="content"></textarea><label>${comment } </label>
</div>
    <div class="am-margin">
      <input type="submit"  class="am-btn am-btn-primary am-btn-xs" value="提交保存"/>
    </div>
</form>
    </div>
 </div>
 </div>
    <hr>
    <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>

<!-- content end -->
<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

</div>
<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=path %>/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="<%=path %>/assets/js/amazeui.min.js"></script>
<script src="<%=path %>/assets/js/app.js"></script>
</body>
</html>

