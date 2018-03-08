<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/dashboard.css">
</head>
<body>
<shiro:hasRole name="admin">
   <jsp:include page="/web_/admin/navbar.jsp" ></jsp:include>
</shiro:hasRole>
	<shiro:lacksRole name="admin">
   <jsp:include page="/BBS/navbar.jsp" ></jsp:include>
	</shiro:lacksRole>	

<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
<div>
<hr>
</div>
  <div id="login">
    <div class="wrapper">
      <div class="login">
        <form action="<%=path %>/upload/ajax/upload_file.do" enctype="multipart/form-data" method="post" class="container offset1 loginform">
		  <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>文件名</th>
                  <th>地址(请点击地址下载)</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${docs }" var="doc">
                <tr>
                  <td>${doc.name}</td>
                   <% %>
            	  <td><a href="http://www.lxwgsy.top:8080/video/uploads/attach/${doc.name }">下载</a></td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>

        </form>
        </div>
      </div>
    </div>
    <script src="<%=path %>/js/jquery-3.1.0.min.js"></script>
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
