<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Amaze UI Admin form Examples</title>
  <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/dashboard.css"> 
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
  <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="<%=path %>/assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
 <shiro:hasRole name="admin">
   <jsp:include page="/web_/admin/navbar.jsp" ></jsp:include>
</shiro:hasRole>

	<shiro:lacksRole name="admin">
   <jsp:include page="/BBS/navbar.jsp" ></jsp:include>
	</shiro:lacksRole> 
	
<div class="am-cf admin-main">

<!-- content start -->
<div class="admin-content">
  <div class="admin-content-body">
  	<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
  
<form action="<%=path%>/BBS/addTopic.do" method="post">
    <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active">基本信息</li>
      </ul>

      <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active">
          <div class="am-g am-margin-top">
          <input type="hidden" name="userId" value="${user.id }"/>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">所属类别</div>
            <div class="am-u-sm-8 am-u-md-10">
              <select data-am-selected="{btnSize: 'sm'}" name="type">
                <option value="0">学习</option>
                <option value="1">娱乐</option>
                <option value="2">创新创业</option>
                <option value="3">其他</option>
              </select>
            </div>
          </div>
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              发布日期
            </div>
            <div class="am-u-sm-8 am-u-md-10">
                <div class="am-form-group am-form-icon">
                  <i class="am-icon-calendar"></i>
                  <input type="date" name="updateDate"class="am-form-field am-input-sm" placeholder="日期">
                </div>
            </div>
          </div>

          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              发布时间
            </div>
            <div class="am-u-sm-8 am-u-md-10">
                <div class="am-form-group am-form-icon">
                  <i class="am-icon-calendar"></i>
                  <input type="datetime-local"  name="createDate"class="am-form-field am-input-sm" placeholder="时间">
                </div>
            </div>
          </div>

        </div>
            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                文章标题
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" name="title" class="am-input-sm">
              </div>
              <div class="am-hide-sm-only am-u-md-6">*必填，不可重复</div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                文章作者
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" name="publisher" value="${user.sno }" class="am-input-sm">
              </div>
            </div>
            <div class="am-g am-margin-top-sm">
              <div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">
                内容描述
              </div>
              <div class="am-u-sm-12 am-u-md-10">
                <textarea rows="10" name="content"></textarea>
              </div>
            </div>
             <div class="am-u-sm-12 am-u-md-10">
      <input type="submit"  class="am-btn am-btn-primary am-btn-xs" value="提交保存"/>
    </div>
    </div>
</div>
    </form>
    </div>
 </div>
 </div>
 </div>
<!-- content end -->

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>

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

