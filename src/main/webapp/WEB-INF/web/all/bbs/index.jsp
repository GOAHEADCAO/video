<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %><html>
<head>
<title>EF 论坛系统</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css">
<script src="<%=path%>/js/jquery-3.1.0.min.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<link href="<%=path%>/css/index.css" rel="stylesheet">
<link href="<%=path%>/css/bbs.css" rel="stylesheet">
<script src="<%=path%>/js/plugins/js/bbs/index.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<shiro:hasRole name="admin">
   <jsp:include page="/web_/admin/navbar.jsp" ></jsp:include>
</shiro:hasRole>
<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
	<shiro:lacksRole name="admin">	
   <jsp:include page="/BBS/navbar.jsp" ></jsp:include>
	</shiro:lacksRole>
		  <form action="<%=path %>/BBS/getAllTopic.do?type=tongguo" method="post" id="queryForm">
	<div >
			<div class="row bbs-top">
				<div class="col-md-12 background-title-color">

					<div class="btn-group"><label class="label-all">
					<shiro:hasRole name="admin"><a class="ahome"href="<%=path %>/BBS/getAllTopic.do" target="_self">查看</a>
					</shiro:hasRole>
						<a class="ahome"href="<%=path %>/BBS/getAllTopic.do?type=tongguo" target="_self">全部</a></label>
						 <label class="label-hot"><a class="ahot" href="<%=path %>/BBS/getAllTopic.do?type=hot">热门</a></label>
					</div>

					<div class="bbsNewTopic pull-right">
					
						<a href="<%=path %>/BBS/addTopic.jsp" target="_blank" class="whitez"><span class="glyphicon glyphicon-file"></span>&nbsp;发帖</a>
					
					</div>
				</div>
			</div>
				<div class="row bbs-center-border">
					<div class="col-md-2 bbs-icons-spring">
					</div>
					<div class="col-md-10 bbs-text-center">
						<div><a class="btn btn-warning btn-sm" href="<%=path %>/BBS/getAllTopic.do?type=zhiding">置顶</a>
						<input placeholder="话题" type="text" name="title"  style="width:200px;height:28px">
						<input type="text" name="publisher" placeholder="发布人"  style="width:200px;height:28px">
						<button class="btn btn-warning btn-sm"> 查询</button>
						</div>
						<c:forEach items="${ page.list}" var="p" >
						 <hr/>
						<div>
							<a href="<%=path %>/BBS/getTopicDetail.do?id=${p.id}" target="_blank"><span class="bbstitle">标题：${p.title }</span></a>
						 <span class="spansmail" >|</span>
						   浏览量：${p.readers }
						  <c:if test="${user.sno eq p.publisher.sno ||user.role.name eq 'admin' }">
						   <span class="spansmail" >|</span>
						   <a href="<%=path%>/BBS/deleteTopic.do?id=${p.id}&userId=${p.publisher.id
}">删除</a>
						  </c:if>
						  <shiro:hasRole name="admin">
						  <c:if test="${p.isAudit == 0 }">
						  <a href="<%=path%>/BBS/${user.role.name }/topic/ajax/audit.do?id=${p.id}&auditFlag=1">审核通过</a>
						  </c:if>
						   <c:if test="${p.isTop == 0 }">
						  <a href="<%=path%>/BBS/${user.role.name }/topic/ajax/Top.do?id=${p.id}&auditFlag=1">置顶</a>
						  </c:if>
						  </shiro:hasRole>
						<hr/>
						<div  style="width:400px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" >
						内容：${p.content }
						</div>
						<hr/>
						<div class="dateStyle">
							<span class="bbsCreateUser">
							发布者：${p.publisher.sno }
							</span>&nbsp;
							发布时间：${p.createDate }
							<span class="spansmail">|</span>&nbsp;
							评论数：${p.commentsCount }
						    <span class="spansmail">|</span>
						 <!--   <a href=""> &nbsp;回复 &nbsp;</a> -->
						  
						</div>
						</div>
						</c:forEach>
						</div>
						
					</div>
				</div>
		
		<div class="row headerBorder">
			<div class="col-md-12">
			<!-- 分页标签 -->
			<%@ include file="/common/pager.jsp" %>
</div>
		</div>
	</form>
	</div>
</body>
</html>