<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>帖子详情-${topic.title }</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
  <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css"/>
  <style>
    @media only screen and (min-width: 641px) {
      .am-offcanvas {
        display: block;
        position: static;
        background: none;
      }

      .am-offcanvas-bar {
        position: static;
        width: auto;
        background: none;
        -webkit-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
      }
      .am-offcanvas-bar:after {
        content: none;
      }

    }

    @media only screen and (max-width: 640px) {
      .am-offcanvas-bar .am-nav>li>a {
        color:#ccc;
        border-radius: 0;
        border-top: 1px solid rgba(0,0,0,.3);
        box-shadow: inset 0 1px 0 rgba(255,255,255,.05)
      }

      .am-offcanvas-bar .am-nav>li>a:hover {
        background: #404040;
        color: #fff
      }

      .am-offcanvas-bar .am-nav>li.am-nav-header {
        color: #777;
        background: #404040;
        box-shadow: inset 0 1px 0 rgba(255,255,255,.05);
        text-shadow: 0 1px 0 rgba(0,0,0,.5);
        border-top: 1px solid rgba(0,0,0,.3);
        font-weight: 400;
        font-size: 75%
      }

      .am-offcanvas-bar .am-nav>li.am-active>a {
        background: #1a1a1a;
        color: #fff;
        box-shadow: inset 0 1px 3px rgba(0,0,0,.3)
      }

      .am-offcanvas-bar .am-nav>li+li {
        margin-top: 0;
      }
    }

    .my-head {
      margin-top: 40px;
      text-align: center;
    }

    .my-button {
      position: fixed;
      top: 0;
      right: 0;
      border-radius: 0;
    }
    .my-sidebar {
      padding-right: 0;
      border-right: 1px solid #eeeeee;
    }

    .my-footer {
      border-top: 1px solid #eeeeee;
      padding: 10px 0;
      margin-top: 10px;
      text-align: center;
    }
  </style>
</head>
<body>

<shiro:hasRole name="admin">
   <jsp:include page="/web_/admin/navbar.jsp" ></jsp:include>
</shiro:hasRole>
<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
	<shiro:lacksRole name="admin">
   <jsp:include page="/BBS/navbar.jsp" ></jsp:include>
	</shiro:lacksRole>
<header class="am-g my-head">
  <div class="am-u-sm-12 am-article">
    <h1 class="am-article-title">${topic.title }</h1>
    <p class="am-article-meta">作者：${topic.publisher.sno }</p>
  </div>
</header>
<hr class="am-article-divider"/>
          <p class="am-article" style="margin-right:30px;margin-left:30px;" >内容：${topic.content }</p>
          <div style="margin-right:30px;margin-left:30px;"><a href="<%=path%>/BBS/addComment.do?id=${topic.id}">留言</a> </div>
<hr class="am-article-divider"/>
          <c:forEach items="${topic.comments }" var="t">
          <hr/>
          <div style="margin-right:30px;margin-left:30px;"  >
          <span>发言时间：${t.createDate }</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><span>${t.publisher.sno}</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
          <span>
          <c:if test="${t.publisher.sno eq user.sno }">
          <a href="<%=path%>/BBS/deleteComment.do?id=${t.id}&topicId=${topic.id}&userId=${user.id}"> 删除</a>
          </c:if>
          </span>
          <p  style="width:300px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${t.content }</p>
          </div>
          </c:forEach>

  <a href="#sidebar" class="am-btn am-btn-sm am-btn-success am-icon-bars am-show-sm-only my-button" data-am-offcanvas><span class="am-sr-only">侧栏导航</span></a>


<footer class="my-footer">
  <p>sidebar template<br><small>© Copyright XXX. by the AmazeUI Team.</small></p>
</footer>
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
</body>
</html>
