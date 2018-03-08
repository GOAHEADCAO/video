<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${menu_name} - ${title }</title>
</head>
<body >
    <div class="J_content">
		<div class="mt20 plr20">
			<form action="<%=path %>/user/modify.do" method="post" id="myForm">
			<div class="J_formTable l_form_table">
				<table width="800px" class="not_hightlight">
					<tbody>
					<tr>
						<td class="l_title "><b class="cRed">*</b>用户</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
									<input type="text" name="sno"  value="${user.sno }"/>
                                 </div>
                             </div>
                         </td>
                     </tr>
					<tr>
						<td class="l_title w200"><b class="cRed">*</b> 邮箱</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
									<input type="text" name="email"  value=""/>
                                 </div>
                             </div>
                         </td>
                     </tr>
					<tr>
						<td class="l_title w200"><b class="cRed">*</b> 原始密码</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
									<input type="text" name="oldPwd"  value=""/>
                                 </div>
                             </div>
                         </td>
                     </tr>
					 <tr>
						<td class="l_title "><b class="cRed">*</b> 密码</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <input type="text" name="pwd"  value=""/>
                                 </div>
                             </div>
                         </td>
                     </tr>
					 <tr>
						<td class="l_title "><b class="cRed">*</b> 确认密码</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <input type="text" name="pwd2"  value=""/>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     </tbody>
                     <tfoot>
                     	<tr>
	                     	<th colspan="2">
	                     		<div class="l_p_btn pd50">
									<div class="J_toolsBar">
										<div class="t_buttonGroup">
					                    	<a class="abtn red" href="javascript:mySubmit();">修改</a>
					                    </div>
									</div>
								</div>
	                     	</th>
	                     </tr>
                     </tfoot>
				</table>
			</div>
			</form>
		</div>
    </div>
    <script src="<%=path%>/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#myForm').validator({
				fields : {
					oldPwd : '原始密码:required;',
					sno:'用户:required',
					email:'邮箱：required;',
					pwd : '密码:required;password',
					pwd2: '确认密码 :required;password;match[pwd]'
				},
				valid : function(form){
					var loadIdx = layer.load();
					$('#myForm').ajaxSubmit({
						success : function(result){
							layer.close(loadIdx);
							if(result.success){
								layer.alert('修改成功，请重新登录', function(){
									window.location.href = '<%=path%>/login/login_out.do';
								});
							}else{
								layer.alert(result.msg);
							}
						}
					});
				}
			});
			
		});
		
		function mySubmit(){
			$('#myForm').submit();
		}
	</script>
</body>
</html>