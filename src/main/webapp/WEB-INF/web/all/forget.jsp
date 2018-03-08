<%@ page language="java" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%@ include file="/common/dtd.jsp" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>忘记密码</title>
  <link rel="shortcut icon" href="<%=path %>/img/favicon.ico">
  <link rel="stylesheet" href="<%=path %>/css/login.css">
</head>

<body>
  <div id="login">
    <div class="wrapper">
      <div class="login">
        <form action="<%=path %>/user/modify.do" method="post" class="container offset1 loginform">
          <div id="owl-login">
            <div class="hand"></div>
            <div class="hand hand-r"></div>
            <div class="arms">
              <div class="arm"></div>
              <div class="arm arm-r"></div>
            </div>
          </div>
          <div class="pad">
            <input type="hidden" name="_csrf" value="hiden">
            <div class="control-group">
              <div class="controls">
                <label for="user" class="control-label fa fa-user"></label>
                <input id="user" type="user" name="sno" placeholder="学号" tabindex="1" autofocus="autofocus" class="form-control input-medium">
                <div class="user">请输入四川农业大学标准学号</div>
              </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <label for="password" class="control-label fa fa-asterisk"></label>
                <input id="email" type="email" name="email" placeholder="请输入邮箱地址" tabindex="2" class="form-control input-medium">
              </div>
            </div>
          </div>
          <div class="form-actions">
            <button type="submit" tabindex="4" class="btn btn-primary">确认</button>
          </div>
        </form>
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

