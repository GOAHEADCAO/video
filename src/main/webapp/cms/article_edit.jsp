<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加文章 - ${title }</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/uploadify/uploadify.css"> 
<link href="<%=path %>/css/base.css" rel="stylesheet" />
<link href="<%=path %>/css/desktop.css" rel="stylesheet" />
<link href="<%=path %>/plugins/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" />
<link href="<%=path %>/css/jquery.validator.css" rel="stylesheet" />
</head>
<body>

<body>

  <div class="J_content">
	<div class="mt20 plr20">
	     <div class="J_filter">
	             <table class="not_hightlight" style="width: 100%;">
	                 <tbody>
	                     <tr>
	                         <td class="t_right">
	                         	<div class="fl">
	                         	    <c:choose>
	                         	      <c:when test="${article != null }">
	                         	         <a class="current" href="javascript:;">编辑文章</a>
	                         	      </c:when>
	                         	      <c:otherwise>
	                         	         <a class="current" href="javascript:;">添加文章</a>
	                         	      </c:otherwise>
	                         	    </c:choose>
	                         	</div>
	               				
	               				<div class="fr">
	                           		<a href="javascript:myBack()">
				                    	<i class="icon"></i><span>返回上一页</span>
				                    </a>
	                           	</div>
	                         </td>
	                     </tr>
	                 </tbody>
	             </table>
	      </div>
	    <div class="J_formTable l_form_table mgt40">
		<form action="<%=path %>/cmsController/article/ajax/save.do" id="editForm" method="post">
		<input type="hidden" name="id" value="${article.id }"/>
		<input type="hidden" name="coverImageUrl" id="coverImageUrl" value="${article.coverImageUrl }"/>
		<table>
			<tr>
				<td class="l_title w200">文章类型：</td>
				<td>
					<div class="J_toolsBar fl">
					  <div class="t_check ml10">
					     <label><input name="articleType" type="radio" value="contentType" <c:if test="${article.type == null || article.type == 0 }">checked="checked"</c:if> />内容文章</label> 
						 <label><input name="articleType" type="radio" value="hrefType" <c:if test="${article.type == 1 }">checked="checked"</c:if>/>外链文章</label> 
						 <label><input name="articleType" type="radio" value="adType" <c:if test="${article.type == 2 }">checked="checked"</c:if>/>广告位</label> 
		              </div>
					</div>
				</td>
			</tr>
		    <tr>
				<td class="l_title w200">标题：<font color="red">*</font></td>
				<td>
					<div class="J_toolsBar fl">
					    <div class="t_text w600 ml10">
							<label> 
								<input type="text" name="title" value="${article.title }" >
							</label>
						</div>
					</div>
				</td>
			</tr>
									
			<tr id="contentTr">
			    <td class="l_title w200">内容：</td>
				<td>
					<div class="J_toolsBar">
						
							    <input type="text"  name="content" value="${article.content}"></input>
							
					</div>
				</td>
			</tr>
			
			<tr id="hrefTr" style="display:none">
				<td class="l_title w200">外链：</td>
				<td>
					<div class="J_toolsBar fl">
					    <div class="t_text w600 ml10">
							<label> 
								<input type="text" name="href" value="${article.href }" >
							</label>
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<td class="l_title w200">发布人：</td>
				<td>
					<div class="J_toolsBar fl">
					    <div class="t_text w200 ml10">
							<label> 
								<input type="text" name="publisher" value="${article.publisher }">
							</label>
						</div>
					</div>
				</td>
			</tr>
			
			<tr id="orderNoTr" style="display:none">
				<td class="l_title w200">排序：</td>
				<td>
					<div class="J_toolsBar fl">
					    <div class="t_text w200 ml10">
							<label> 
								<input type="text" name="orderNo" value="${article.orderNo }" >
							</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
							<div class="J_toolsBar mgt40">
								<div class="t_buttonGroup">
				                  <input value ="保存" type="submit">
				                   	<a class="abtn gray" href="javascript:myBack();">
				                   		<i class="icon"></i>返回
				                   	</a>
				                </div>
							</div>
				</td>
			</tr>
		</table>
		
		</form>
	</div>
  </div>
 </div>
 	<script src="<%=path%>/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/editor_config.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/editor_all.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/uploadify/jquery.uploadify.js"></script>
	<script type="text/javascript">
		//表单验证
		$(function(){
			$('#editForm').validator({
				fields : {
					rootColumnId:'一级栏目:required',
					leafColumnId:'二级栏目:required',
					title : '标题:required'
				},
				valid : function(form){
					$('#editForm').ajaxSubmit({
						success : function(result){
							if(result.success){
								layer.alert('保存成功');
								window.location.href="<%=path%>/cmsController/article/list.do"
							}
						}
					});
				}
			});	
		});
            
       function myBack(){
    	   window.location.href="<%=path%>/cmsController/article/list.do";
       }
       
       function mySubmit(){
   		   $('#editForm').submit();
   	   }
	   
	   $('input[name="articleType"]').on('click', function(){
			var val = $('input[name="articleType"]:checked').val();
			if(val == 'contentType'){
				$('#contentTr').show();
				$("#hrefTr").hide();
				$("#orderNoTr").hide();
			}else if(val == 'hrefType'){
				$('#contentTr').hide();
				$("#orderNoTr").hide();
				$("#hrefTr").show();
			}else if(val == 'adType'){
				$('#contentTr').hide();
				$("#orderNoTr").show();
				$("#hrefTr").show();
			}
	   });
   </script>

</body>
</html>