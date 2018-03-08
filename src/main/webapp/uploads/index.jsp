<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>上传文件</title>
  <link rel="shortcut icon" href="img/favicon.ico">
  <link rel="stylesheet" href="css/login.css">
</head>
<body>
<shiro:hasRole name="admin">
   <jsp:include page="/web_/admin/navbar.jsp" ></jsp:include>
</shiro:hasRole>
	<shiro:lacksRole name="admin">
   <jsp:include page="/BBS/navbar.jsp" ></jsp:include>
	</shiro:lacksRole>
 <div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
  <div >
  <hr/>
  </div>
  
  <div id="login">
    <div class="wrapper">
      <div class="login">
      <form action="<%=path %>/upload/ajax/upload_file.do" method="post" enctype="multipart/form-data">
       <div >
       <ul>
       <li>请选择要上传的附件(只能上传txt、ppt、ptx、doc、docx、xls、xlsx、pdf、png、jpg、jpeg、gif、bmp格式)：</li>
       <li> <input type="file" name="file"></li>
       <li><input type="submit" value="上传"></li>
       </ul>
      
       </div>
        </form>
      </div>
    </div>
    </div>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript">
      $(function(){
        var email=$("#email"),
        user=$("#user");
        $(".user").hide();
        $("button[type='submit']").attr("disabled",true);
        user.bind('input propertychange',function(){
          if(user.val().length<8){
            $(".user").fadeIn();
            $("button[type='submit']").attr("disabled","true");
          }
          else{
            $(".user").fadeOut();
          }
        });
        email.bind('input propertychange',function(){
      		if (!/^\S+@\S+\.\S+$/.test(email.val())){
      			email.parent().addClass('error').removeClass('success');
      			$("button[type='submit']").attr("disabled","true");
      		}
      		else{
      			$("button[type='submit']").removeAttr("disabled","true");
      		}
      	});
      })
    </script>
  </div>
  <!-- end -->
</body>

</html>
