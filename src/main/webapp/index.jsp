<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>SVG clip-path Hover Effect</title>
<link rel="stylesheet" href="${path }/css/style.css">
</head>

<body>

<div class='container'>
  <header>
    <h1>GIT工作室</h1>
    <p>GIT工作室创办于2016年，经过两届院学生会主席团共同管理维护才有了现在。</p>
    <p class='small'> <b>Note:</b> 工作室主要进行课程复习、学生活动的直播工作<br/>
      还有一些创新创业科研项目的研究 </p>
  </header>
  <main>
    <div class='items'>
      <div class='item'>
        <svg preserveAspectRatio='xMidYMid slice' viewBox='0 0 300 200'>
          <defs>
            <clipPath id='clip-0'>
              <circle cx='0' cy='0' fill='#000' r='150px'></circle>
            </clipPath>
          </defs>
          <text class='svg-text' dy='.3em' x='50%' y='50%'> 负责人介绍 </text>
          <g clip-path='url(#clip-0)'>
            <image height='100%' preserveAspectRatio='xMinYMin slice' width='100%' xlink:href='${path }/img/i-xrays.png'></image>
            <text class='svg-masked-text' dy='.3em' x='50%' y='50%'><a href="">负责人介绍</a> </text>
          </g>
        </svg>
      </div>
      <div class='item'>
        <svg preserveAspectRatio='xMidYMid slice' viewBox='0 0 300 200'>
          <defs>
            <clipPath id='clip-1'>
              <circle cx='0' cy='0' fill='#000' r='150px'></circle>
            </clipPath>
          </defs>
          <text class='svg-text' dy='.3em' x='50%' y='50%'> 成员简介 </text>
          <g clip-path='url(#clip-1)'>
            <image height='100%' preserveAspectRatio='xMinYMin slice' width='100%' xlink:href='${path }/img/i-worms.png'></image>
            <text class='svg-masked-text' dy='.3em' x='50%' y='50%'> <a href="">成员简介</a> </text>
          </g>
        </svg>
      </div>
      <div class='item'>
        <svg preserveAspectRatio='xMidYMid slice' viewBox='0 0 300 200'>
          <defs>
            <clipPath id='clip-2'>
              <circle cx='0' cy='0' fill='#000' r='150px'></circle>
            </clipPath>
          </defs>
          <text class='svg-text' dy='.3em' x='50%' y='50%'> 荣誉榜 </text>
          <g clip-path='url(#clip-2)'>
            <image height='100%' preserveAspectRatio='xMinYMin slice' width='100%' xlink:href='${path }/img/i-aurora.png'></image>
            <text class='svg-masked-text' dy='.3em' x='50%' y='50%'> <a href="">荣誉榜</a> </text>
          </g>
        </svg>
      </div>
      <div class='item'>
        <svg preserveAspectRatio='xMidYMid slice' viewBox='0 0 300 200'>
          <defs>
            <clipPath id='clip-3'>
              <circle cx='0' cy='0' fill='#000' r='150px'></circle>
            </clipPath>
          </defs>
          <text class='svg-text' dy='.3em' x='50%' y='50%'> 活动栏 </text>
          <g clip-path='url(#clip-3)'>
            <image height='100%' preserveAspectRatio='xMinYMin slice' width='100%' xlink:href='${path }/img/i-angus.png'></image>
            <text class='svg-masked-text' dy='.3em' x='50%' y='50%'><a href=""> 活动栏  </a></text>
          </g>
        </svg>
      </div>
      <div class='item'>
        <svg preserveAspectRatio='xMidYMid slice' viewBox='0 0 300 200'>
          <defs>
            <clipPath id='clip-4'>
              <circle cx='0' cy='0' fill='#000' r='150px'></circle>
            </clipPath>
          </defs>
          <text class='svg-text' dy='.3em' x='50%' y='50%'> 直播间 </text>
          <g clip-path='url(#clip-4)'>
            <image height='100%' preserveAspectRatio='xMinYMin slice' width='100%' xlink:href='${path }/img/i-huitzi.png'></image>
            <text class='svg-masked-text' dy='.3em' x='50%' y='50%'> <a href="">直播间 </a></text>
          </g>
        </svg>
      </div>
      <div class='item'>
        <svg preserveAspectRatio='xMidYMid slice' viewBox='0 0 300 200'>
          <defs>
            <clipPath id='clip-5'>
              <circle cx='0' cy='0' fill='#000' r='150px'></circle>
            </clipPath>
          </defs>
          <text class='svg-text' dy='.3em' x='50%' y='50%'> 登录注册 </text>
          <g clip-path='url(#clip-5)'>
            <image height='100%' preserveAspectRatio='xMinYMin slice' width='100%' xlink:href='img/i-dali.png'></image>
            <text class='svg-masked-text' dy='.3em' x='50%' y='50%'><a href="<%=path %>/web_/normal/login.jsp"> 登录注册</a> </text>
          </g>
        </svg>
      </div>
    </div>
  </main>
</div>

<div class='options'>
  <button class='dark'></button>
  <button class='light'></button>
</div>

<script src="${path }/js/index.js"></script>

</body>
</html>

