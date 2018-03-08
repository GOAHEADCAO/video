<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html>
<head>
    <meta charset="utf-8">
	<title>个人信息</title>
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="这是一个 user 页面">
  <meta name="keywords" content="user">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="<%=path %>/assets/css/admin.css">
</head>
<body>
 <shiro:hasRole name="admin">
   <jsp:include page="/web_/admin/navbar.jsp" ></jsp:include>
</shiro:hasRole>
	<shiro:lacksRole name="admin">
   <jsp:include page="/BBS/navbar.jsp" ></jsp:include>
	</shiro:lacksRole> 
  	<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">

 <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small>
            <a href="javascript:"class="btn navbar-link" onclick="history.back(); ">返回上一页</a></div>
        
      </div>

      <hr/>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"></div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <form class="am-form am-form-horizontal" action="<%=path%>/web/all/modifyUserDetails.jsp">
           <div class="am-form-group">
              <label for="user-QQ" class="am-u-sm-3 am-form-label">学号</label>
              <div class="am-u-sm-9">
                <input type="text" pattern="[0-9]*" id="user-QQ" value="${user.sno }">
              </div>
            </div>
          
            <div class="am-form-group">
              <label for="user-name" class="am-u-sm-3 am-form-label">姓名 / Name</label>
              <div class="am-u-sm-9">
                <input type="text" id="user-name" value="${user.username }">
                              </div>
            </div>

            <div class="am-form-group">
              <label for="user-intro" class="am-u-sm-3 am-form-label">性别</label>
              <div class="am-u-sm-9">
             <c:choose>
             <c:when test="${user.gender } eq '女'">  女   
               <input type="radio" checked="checked" class="" rows="5" id="user-intro" value="${user.gender }">
             </c:when>
             <c:otherwise>男
               <input type="radio" checked="checked" class="" rows="5" id="user-intro" value="${user.gender }">
             
             </c:otherwise>
             </c:choose>
              </div>
            </div>
            <div class="am-form-group">
              <label for="user-email" class="am-u-sm-3 am-form-label">电子邮件 / Email</label>
              <div class="am-u-sm-9">
                <input type="email" id="user-email" value="${user.email }">
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-intro" class="am-u-sm-3 am-form-label">学院</label>
              <div class="am-u-sm-9">
                <input type="text" class="" rows="5" id="user-intro" value="${user.profession.academy.name }">
              </div>
            </div>
            
            <div class="am-form-group">
              <label for="user-intro" class="am-u-sm-3 am-form-label">专业</label>
              <div class="am-u-sm-9">
                <input type="text" class="" rows="5" id="user-intro" value="${user.profession.name }">
              </div>
            </div>
            <div class="am-form-group">
              <label for="user-intro" class="am-u-sm-3 am-form-label">积分</label>
              <div class="am-u-sm-9">
                <input type="text" class="" rows="5" id="user-intro" value="${user.score }">
              </div>
            </div>
            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <input type="submit" class="am-btn am-btn-primary" value="修改个人信息">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
</div>
  </div>
  <!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=path %>/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="<%=path %>/assets/js/amazeui.min.js"></script>

<script src="<%=path %>/assets/js/app.js"></script>
</body>
</html>

