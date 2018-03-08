<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<div class="container-fluid">
		<div>
			<div class="pull-left">
				&nbsp;&nbsp;<a href="<%=path%>/">主页</a> &nbsp; &nbsp;<a
				href="<%=path%>/BBS/index.jsp">论坛</a>&nbsp;标签
		</div>

		<div class="pull-right" style="padding-right: 75px;">
			<shiro:guest>你好，
<a href="<%=path%>/web_/normal/login.jsp">登录</a>
			</shiro:guest>
			<shiro:user>你好,<shiro:principal></shiro:principal>&nbsp;&nbsp;<a
					href="<%=path%>/login/logout.do">登出</a>
			</shiro:user>

			| <a href="<%=path%>" target="_blank">捐赠</a> | <a href="<%=path%>/"
				target="_blank">帮助</a>&nbsp;&nbsp;
		</div>
	</div>
	<div class="row headerBorder">
		<div class="col-md-12"></div>
	</div>
		  <form action="<%=path %>/BBS/getAllTopic.do" method="post" id="queryForm">
	
	<div class="row centerPanel">
		<div class="col-md-3"></div>
		<div class="col-md-6 border-md6">
			<div class="row bbs-top">
				<div class="col-md-12 background-title-color">

					<div class="btn-group">
						<label class="label-all"><a class="ahome"
							href="<%=path %>/BBS/getAllTopic.do" target="_self">全部</a></label> <label
							class="label-hot"><a class="ahot" href="<%=path %>/BBS/getAllTopic.do?type=hot">热门</a></label> <label
							class="label-label" data-toggle="dropdown"> <a
							class="alabel" href="#">标签</a><span class="caret"></span>
						</label>
						<ul class="dropdown-menu" role="menu">
					    <li>	menu
						</ul>
					</div>

					<div class="bbsNewTopic pull-right">
						<a href="<%=path %>/BBS" target="_blank" class="whitez"><span class="glyphicon glyphicon-file"></span>&nbsp;发帖</a>
					</div>
				</div>
			</div>
				<div class="row bbs-center-border">
					<div class="col-md-2 bbs-icons-spring">
					</div>
					<div class="col-md-10 bbs-text-center">
						<div><button class="btn btn-warning btn-sm">置顶</button>
						</div>
						<c:forEach items="${ page.list}" var="p" >
						 <hr/>
						<div>
							<a href="" target="_blank"><span class="bbstitle">标题：${p.title }</span></a>
						<hr/>
						<div class="divheight5">
						内容：${p.content }
						</div>
						<hr/>
						<div class="dateStyle">
							<span class="bbsCreateUser">
							发布者：${p.user.sno }
							</span>&nbsp;
							发布时间：${p.createDate }
							<span class="spansmail">|</span>&nbsp;
							评论数：${p.commentsCount }
						    <span class="spansmail">|</span>
						   <a href=""> &nbsp;回复 &nbsp;</a>
						
						</div>
						</div>
						</c:forEach>
						</div>
						
					</div>
				</div>
		</div>
		<div class="row headerBorder">
			<div class="col-md-12">
<!-- 分页标签 -->
	<div style="text-align: center; border: 0; padding: 4px 12px;"
		class="pageDiv mt20">
		<pg:pager url="#" items="${page.totalCount}"
			maxPageItems="${page.pageSize}" maxIndexPages="1000"
			isOffset="true">
   			总共：${page.totalCount}条,共:${page.totalPage}页	
		<pg:first>
				<a id="first" href="#" class="pageLink">首页</a>
			</pg:first>
			<c:if test="${page.currentPage != 1 && page.totalPage > 0 }">
				<a id="prev" href="#" class="pageLink">上一页</a>
			</c:if>
			<pg:pages>
				<c:choose>
					<c:when test="${page.currentPage==pageNumber}">
						<span class="selectPageLink">${pageNumber}</span>
					</c:when>
					<c:otherwise>
						<c:if
							test="${(pageNumber-page.currentPage lt 5) and (pageNumber-page.currentPage gt -5)}">
							<a href="javascript:pageAction('${pageNumber}')"
								class="pageLink">${pageNumber}</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</pg:pages>
			<c:if
				test="${page.currentPage != page.totalPage  && page.totalPage > 0 }">
				<a id="next" href="#" class="pageLink">下一页</a>
			</c:if>
			<pg:last>
				<a id="last" href="#" class="pageLink">尾页</a>
			</pg:last>
		</pg:pager>
		</div>
		<script type="text/javascript">
	$(function(){
		var currentPage = ${page.currentPage};
		var totalPage = ${page.totalPage };
		$("#first").bind("click",function(event){
			pageAction(1);
		});
		$("#prev").bind("click",function(event){
			if(currentPage>1){
				currentPage--;
			}else{
				currentPage = 1;
			}
			pageAction(currentPage);
		});
		$("#next").bind("click",function(event){
			if(totalPage>currentPage){
				currentPage++;
			}else{
				currentPage=totalPage;
			}
			pageAction(currentPage);
		});
		$("a[name='doNumberPage']").bind("click",function(event){
			pageAction(currentPage);
		});
		$("#last").bind("click",function(event){
			pageAction(totalPage);
		});
	});
	function pageAction(currentPage){
		$("#currentPage").val(currentPage);
    	$('#queryForm').submit();
	}
</script>

</div>
		</div>
	</form>
	</div>
	<div>
		<div class="pull-left">
			&nbsp;&nbsp;<a href="http://localhost:8080/MySpringSecuritySample">主页</a>
			&nbsp;约吗 &nbsp;<a href="http://localhost:8080/MySpringBBSSample">论坛</a>&nbsp;标签
		</div>
		<div class="pull-right" style="padding-right: 75px;">
			<a href="${ctx }/mypace/bbs/help!support.action" target="_blank">支持</a>
			| <a href="${ctx }/mypace/bbs/help!help.action" target="_blank">帮助</a>&nbsp;&nbsp;
		</div>
	</div>
</body>
</html>