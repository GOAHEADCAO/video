<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Landing Page | EF 直播</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="alternate icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
  <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css"/>
  <style>
    .get {
      background: #1E5B94;
      color: #fff;
      text-align: center;
      padding: 100px 0;
    }

    .get-title {
      font-size: 200%;
      border: 2px solid #fff;
      padding: 20px;
      display: inline-block;
    }

    .get-btn {
      background: #fff;
    }

    .detail {
      background: #fff;
    }

    .detail-h2 {
      text-align: center;
      font-size: 150%;
      margin: 40px 0;
    }

    .detail-h3 {
      color: #1f8dd6;
    }

    .detail-p {
      color: #7f8c8d;
    }

    .detail-mb {
      margin-bottom: 30px;
    }

    .hope {
      background: #0bb59b;
      padding: 50px 0;
    }

    .hope-img {
      text-align: center;
    }

    .hope-hr {
      border-color: #149C88;
    }

    .hope-title {
      font-size: 140%;
    }

    .about {
      background: #fff;
      padding: 40px 0;
      color: #7f8c8d;
    }

    .about-color {
      color: #34495e;
    }

    .about-title {
      font-size: 180%;
      padding: 30px 0 50px 0;
      text-align: center;
    }

    .footer p {
      color: #7f8c8d;
      margin: 0;
      padding: 15px 0;
      text-align: center;
      background: #2d3e50;
    }
  </style>
</head>
<header class="am-topbar am-topbar-fixed-top">
  <div class="am-container">
    <h1 class="am-topbar-brand">
      <a href="<%=path%>/">EF </a>
    </h1>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-secondary am-show-sm-only"
            data-am-collapse="{target: '#collapse-head'}"><span class="am-sr-only">导航切换</span> <span
        class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="collapse-head">
      <ul class="am-nav am-nav-pills am-topbar-nav">
        <li class="am-active"><a href="#">首页</a></li>
        <li><a href="<%=path%>/cmsController/normal/article/list.do?type=tongguo">新闻中心</a></li>
        <li class="am-dropdown" data-am-dropdown>
          <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
            项目 <span class="am-icon-caret-down"></span>
          </a>
          <ul class="am-dropdown-content">
            <li class="am-dropdown-header">项目</li>
            <li><a href="<%=path%>/user/userDetails.do">1. 个人中心</a></li>
            <li><a href="<%=path%>/uploads/index.jsp">2. 文件上传</a></li>
            <li><a href="<%=path%>/download/showfile.do">3. 文件下载</a></li>
            <li><a href="#">4. 充值</a></li>
            <li><a href="<%=path %>/BBS/getAllTopic.do?type=tongguo">4. 论坛系统</a></li>
          </ul>
        </li>
      </ul>
           <shiro:notAuthenticated>
      <div class="am-topbar-right">
        <a href="<%=path %>/web_/all/register.jsp" class="am-btn am-btn-secondary am-topbar-btn am-btn-sm"><span class="am-icon-pencil"></span> 注册</a>
      </div>
      <div class="am-topbar-right">
        <a href="<%=path %>/web_/normal/login.jsp" class="am-btn am-btn-primary am-topbar-btn am-btn-sm"><span class="am-icon-user"></span>登录</a>
      </div>
        <div class="am-topbar-right">
        <a href="<%=path %>/web_/admin/login.jsp" class="am-btn am-btn-primary am-topbar-btn am-btn-sm"><span class="am-icon-user"></span>管理员登录</a>
      </div>
      </shiro:notAuthenticated>
      <div class="am-topbar-right">
      <shiro:user>已登录，欢迎 <shiro:principal></shiro:principal>观看 </shiro:user>
      <div class="m_item">
      <div class="p_list">
          <div class="p_list"><shiro:user>
                <div class="l_item border">
                  <a href="<%=path %>/login/logout.do"><i class="icon"></i><span>退出</span></a>
                </div></shiro:user>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</header>

<div class="get">
  <div class="am-g">
    <div class="am-u-lg-12">
      <h1 class="get-title">EF 团队  携手共进</h1>
      <p>
        <a href="<%=path %>/normal/user/main.do?sno=${user.sno}" class="am-btn am-btn-sm get-btn">获取新get技能√看直播</a>
      </p>
    </div>
  </div>
</div>

<div class="detail">
  <div class="am-g am-container">
    <div class="am-u-lg-12">
      <h2 class="detail-h2">梦想，期待和你一起去实现!</h2>

      <div class="am-g">
        <div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">

          <h3 class="detail-h3">
            <i class="am-icon-mobile am-icon-sm"></i>
            ef简介
          </h3>

          <p class="detail-p">
          这是一个神奇的地方
           </p>
        </div>
        <div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
          <h3 class="detail-h3">
            <i class="am-icon-cogs am-icon-sm"></i>
            项目简介
          </h3>

          <p class="detail-p">
          项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介项目简介
         项目简介
          </p>
        </div>
        <div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
          <h3 class="detail-h3">
            <i class="am-icon-check-square-o am-icon-sm"></i>
            说明
          </h3>

          <p class="detail-p">
            暂时没有
             </p>
        </div>
        <div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
          <h3 class="detail-h3">
            <i class="am-icon-send-o am-icon-sm"></i>
            关注的群体
          </h3>

          <p class="detail-p">
          有梦想的少年
          </p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="hope">
  <div class="am-g am-container">
    <div class="am-u-lg-4 am-u-md-6 am-u-sm-12 hope-img">
      <img src="assets/i/examples/landing.png" alt="" data-am-scrollspy="{animation:'slide-left', repeat: false}">
      <hr class="am-article-divider am-show-sm-only hope-hr">
    </div>
    <div class="am-u-lg-8 am-u-md-6 am-u-sm-12">
      <h2 class="hope-title">同我们一起打造你的大学生涯</h2>

      <p>
        在知识爆炸的年代，我们不愿成为知识的过客，拥抱开源文化，发挥社区的力量，参与到EF直播中能获得自我提升。
      </p>
    </div>
  </div>
</div>

<div class="about">
  <div class="am-g am-container">
    <div class="am-u-lg-12">
      <h2 class="about-title about-color">EF 崇尚开放、自由，非常欢迎大家的参与</h2>

      <div class="am-g">
        <div class="am-u-lg-6 am-u-md-4 am-u-sm-12">
          <form class="am-form" action="#">
            <label for="name" class="about-color">你的姓名</label>
            <input id="name" type="text">
            <br/>
            <label for="email" class="about-color">你的邮箱</label>
            <input id="email" type="email">
            <br/>
            <label for="message" class="about-color">你的留言</label>
            <textarea id="message"></textarea>
            <br/>
            <button type="submit" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-check"></i> 提 交</button>
          </form>
          <hr class="am-article-divider am-show-sm-only">
        </div>

        <div class="am-u-lg-6 am-u-md-8 am-u-sm-12">
          <h4 class="about-color">关于我们</h4>

          <p>ef----------------- <h4 class="about-color">团队介绍</h4>

          <p>······························</p>
        </div>
      </div>
    </div>
  </div>
</div>

<footer class="footer">
  <p>当前在线人数：${userNumber }   &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;     访问总人次：${allNumber }</p>
  <p>© 2017 <a href="http://www.yunshipei.com" target="_blank">AllMobilize, Inc.</a> Licensed under <a
      href="http://opensource.org/licenses/MIT" target="_blank">MIT license</a>. by the AmazeUI Team.</p>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<!--<![endif]-->
<script src="<%=path %>/assets/js/amazeui.min.js"></script>
</body>
</html>

