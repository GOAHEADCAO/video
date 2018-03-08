<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${menu_name}</title>
<link href="<%=path %>/css/base.css" rel="stylesheet" />
<link href="<%=path %>/css/desktop.css" rel="stylesheet" />
<link href="<%=path %>/plugins/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" />
<link href="<%=path %>/css/jquery.validator.css" rel="stylesheet" />
</head>
<body>
 <shiro:hasRole name="admin">
   <jsp:include page="/web_/admin/navbar.jsp" ></jsp:include>
</shiro:hasRole>
	<shiro:lacksRole name="admin">
   <jsp:include page="/BBS/navbar.jsp" ></jsp:include>
	</shiro:lacksRole> 
  	<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">

	<div data-ui="header" class="J_header">
		<div class="h_left">
			<div class="l_txt">
				<c:choose>
					<c:when test="${not empty head_name }">${head_name }</c:when>
					<c:otherwise>${menu_name }</c:otherwise>
				</c:choose>
			</div>
			<div class="l_nav">
				<c:forEach items="${childMenu }" var="m">
					<div class="n_item ${m.current }">
						<div class="i_default">
							111<a href="${ctx }${m.url}"><span>${m.name }</span><b></b></a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="h_right">
			<div class="r_menu">
				<div class="m_item">
					<div class="i_default">
						<a href="javascript:;"><i class="icon user"></i><span>${sessionScope.session_login_user.sno }</span><i
							class="icon down"></i></a>
					</div>
					<div class="i_menu">
						<div data-ui="profile" class="J_profile">
							<div class="p_user">
								<div class="u_face">
									<a href="javascript:;"><img
										src="<%=path %>/static/images/default_face.jpg"></a>
								</div>
								<div class="u_name">
									<span>${sessionScope.user.sno }</span>
								</div>
							</div>
							<div class="p_list">
								<div class="l_item">
									<a href="<%=path %>/user/update_pwd"><i class="icon"></i><span>修改密码</span></a>
								</div>
								<div class="l_item border">
									<a href="<%=path %>/login/loginout.do"><i class="icon"></i><span>退出</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div data-ui="header" class="J_header">
		<div class="h_left">
			<div class="l_nav">
				<div
					class="n_item
                    <c:if test="${articleQueryDTO.type == null || articleQueryDTO.type == '' }">current</c:if>
                ">
					<div class="i_default">
						<a href="<%=path %>/cmsController/article/list.do"><span>全部文章</span><b></b></a>
					</div>
				</div>
				<div
					class="n_item
                    <c:if test="${articleQueryDTO.type == 'zhiding' }">current</c:if>
                ">
					<div class="i_default">
						<a
							href="<%=path %>/cmsController/article/list.do?type=zhiding"><span>置顶文章</span><b></b></a>
					</div>
				</div>
				<div
					class="n_item
                    <c:if test="${articleQueryDTO.type == 'shenhe' }">current</c:if>
                ">
					<div class="i_default">
						<a
							href="<%=path %>/cmsController/article/list.do?type=shenhe"><span>审核列表</span><b></b></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="J_content">

		<div class="mt20 plr20">
			<form action="<%=path %>/cmsController/article/list.do" id="queryForm" method="POST">
				<div class="J_toolsBar clearfix">
					<div class="t_text ml10">
						<input placeholder="标题" type="text" style="width: 200px"
							id="title" name="title" value="${articleQueryDTO.title }">
					</div>
					<div class="t_text ml10">
						<input placeholder="发布人" type="text" style="width: 200px"
							id="publisher" name="publisher"
							value="${articleQueryDTO.publisher }">
					</div>
					<div class="t_text ml10">
						<input placeholder="开始时间" type="text" id="startDate"
							name="startDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value="${articleQueryDTO.startDate }">
					</div>
					<div class="t_text ml10">
						<input placeholder="结束时间" type="text" id="endDate" name="endDate"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
							value="${articleQueryDTO.endDate }">
					</div>
					<div class="t_button ml10">

						<a class="abtn red" href="javascript:myQuery();"> <i
							class="icon"></i>查询
						</a>
					</div>
					<shiro:user>
					<div class="t_button ml10">
						<a class="abtn blue" href="javascript:myEdit();"> <i
							class="icon"></i>新增
						</a>
					</div></shiro:user>
					<div class="t_label ml10" style="margin-left:20px;">
						记录数：<font color="red" id="totalRecode">${page.totalCount}</font>
					</div>
				</div>
				<input type="hidden" id="isCreateDateSort" name="isCreateDateSort"
					value="${articleQueryDTO.createDateSortCss }" />
				<div class="J_column">

					<div class="c_right">
						<div class="J_table mt20">
							<div class="t_table">
								<table>
									<thead>
										<tr>
											<td><input type="checkbox" name="selectAll"
												id="selectAll" onclick="selectAllIds();" /></td>
											<td><span>标题</span></td>
											<td><span>发布者</span></td>
											<td><span>阅读数</span></td>
											<td id="createDateTd"
												<c:choose>
                                    <c:when test = "${articleQueryDTO.createDateSortCss != null && articleQueryDTO.createDateSortCss != ''  }">
                                       class = "${articleQueryDTO.createDateSortCss}"
                                    </c:when>
                                    <c:otherwise>
                                      class="down"
                                    </c:otherwise>
                                  </c:choose>
												data-type="sort"><span>发布日期</span><i></i></td>
											<td><span>是否审核</span></td>
											<td><span>是否置顶</span></td>
											<td><span>状态</span></td>
								            <td><span><a href="<%=path%>/cmsController/article/content.do">内容</a></span></td>
											
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${page.list }" var="p">
											<tr>
												<td>
													<div class="t_text tc">
														<input type="checkBox" name="selecteId" value="${p.id }" />
													</div>
												</td>
												<td>
													<div class="t_text tc">${p.title }</div>
												</td>
												<td>
													<div class="t_text tc">${p.publisher }</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${p.viewCount != null }">
	                                               ${p.viewCount }
	                                            </c:when>
															<c:otherwise>
	                                               0
	                                            </c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">
														<fmt:formatDate value="${p.createDate }"
															pattern="yyyy-MM-dd HH:mm:ss" />
													</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${p.isAudit eq 'true' }">
	                                         		是
	                                         	</c:when>
															<c:otherwise>
																<font color="red">否</font>
															</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${p.isTop eq 'true' }">
	                                         	           是
	                                         	</c:when>
															<c:otherwise>
																<font color="red">否</font>
															</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">
														<font color="red">删除</font>
													</div>
												</td>
												<td><div class="t_text tc" style="width:300px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">11${p.content }</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<input type="hidden" name="currentPage" id="currentPage">
							<!-- 分页标签 -->
							 <script src="<%=path%>/js/jquery-3.1.0.min.js"></script>
							<%@ include file="/common/pager.jsp" %>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
	<script type="text/javascript">
	function myAduit(id, auditFlag){
			var ids;
			if(id){
				ids = new Array();
				ids.push(id);
			}else{
				ids = getSelectIds();
			}
			
			var msg = auditFlag == 1 ? '审核' : '取消审核';
			
			if(!ids || ids.length == 0){
				layer.alert('请选择要'+msg+'记录');
				return;
			}
			
			layer.confirm('确定要' + msg + '记录吗？', function(index){
				layer.close(index);
				
				var loadIdx = layer.load();
				$.ajax({
					url : '<%=path%>/cmsController/article/ajax/audit.do',
					type : 'post',
					data : {
						'ids' : ids,
						'auditFlag' : auditFlag
					},
					traditional : true,
					success : function(result){
						layer.close(loadIdx);
						if(result.success){
							layer.alert('操作成功', function(){
								window.location.reload();
							});
						}else{
							layer.alert('操作失败');
						}
					}
				});
			});
		}
		
        function myTop(id, topFlag){
        	var ids;
			if(id){
				ids = new Array();
				ids.push(id);
			}else{
				ids = getSelectIds();
			}
			
			var msg = topFlag == 1 ? '置顶' : '取消置顶';
			
			if(!ids || ids.length == 0){
				layer.alert('请选择要'+msg+'记录');
				return;
			}
			
			layer.confirm('确定要' + msg + '记录吗？', function(index){
				layer.close(index);
				
				var loadIdx = layer.load();
				$.ajax({
					url : '<%=path%>/cmsController/article/ajax/top.do',
					type : 'post',
					data : {
						'ids' : ids,
						'topFlag' : topFlag
					},
					traditional : true,
					success : function(result){
						layer.close(loadIdx);
						if(result.success){
							layer.alert('操作成功', function(){
								window.location.reload();
							});
						}else{
							layer.alert('操作失败');
						}
					}
				});
			});
		}
		
		function getSelectIds(){
			var ids = new Array();
			$('input[name="selecteId"]:checked').each(function(idx, obj){
				ids.push($(obj).attr('value'));
			});
			return ids;
		}
		
		 //全选
	    function selectAllIds(){
	  	  var selAll = document.getElementById("selectAll");
	  	  var selectIdArr = $(":input[name='selecteId']");
	  	  if(selAll.checked){
	  		  if(selectIdArr.length > 0){
	  			  for(var i=0;i<selectIdArr.length;i++){
	  				  selectIdArr[i].checked = true;
	  			  }
	  		  }
	  	  }else{
	  		  if(selectIdArr.length > 0){
	  			  for(var i=0;i<selectIdArr.length;i++){
	  				  selectIdArr[i].checked = false;
	  			  }
	  		  }
	  	  }
	    }
		 
	    function myQuery(){
	    	$('#queryForm').submit();
	    }
	    
	    //点击标题预览
		function view(id){
			
		}
	    
	    //编辑
		function myEdit(id){
			if(!id){
				id = '';
			}
	    	window.location.href='<%=path%>/cmsController/article/edit.do?id='+id;
		}
		
		function doCreateDateSort(){
			var createDateClass = $('#createDateTd').attr("class");
			var isCreateDateSort = '';
			if(createDateClass == 'down'){
				$('#createDateTd').removeClass('down');
				$('#createDateTd').addClass('up');
				isCreateDateSort = "up";
			}else{
				$('#createDateTd').removeClass('up');
				$('#createDateTd').addClass('down');
				isCreateDateSort = "down";
			}
			$("#isCreateDateSort").val(isCreateDateSort);
		}
		
		function exportData(){
			   var type = '${type}';
			   var title = $("#title").val();
			   var startDate = $("#startDate").val();
			   var endDate = $("#endDate").val();
			   var isReadSort = $("#isReadSort").val();
			   var viewSort = $("#viewSort").val();
			   var isCreateDateSort = $("#isCreateDateSort").val();
			   window.location.href = "<%=path%>/tie/export?title="+title+"&type="+type+"&startDate="+startDate+"&endDate="+endDate+"&isReadSort="+isReadSort+"&viewSort="+viewSort+"&isCreateDateSort="+isCreateDateSort;
		}
</script>


</body>
</html>
