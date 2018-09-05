<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/25
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>xyxy</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
  </head>

  <style>
	  body{
		  background-color: #ddd;
	  }
	  .container.mycontent{
		  max-width:330px;
		  margin-top:180px;
		  background:#fff;
	  }

	  .form-control{
		  height:45px;

	  }
	  form{
		  margin-top:30px;
	  }


  </style>

  <body>
  <div class="container mycontent">
	  <h2 align="center">学生管理信息系统登陆</h2>

	  <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
		  <div class="form-group">
			  <input type="text" class="form-control" placeholder="请输入用户名" autofocus="" name="username" required="" >
		  </div>
		  <div class="form-group">
			  <input type="password" class="form-control" placeholder="请输入密码" name="password" required="">
		  </div>

		  <div class="checkbox">
			  <label>
				  <input type="checkbox" name="remember">记住我
			  </label>
		  </div>


		  <div class="row">
			  <div class="col-xs-6 ">
				  <button  class="btn btn-success btn-block" type="submit">登录</button>
			  </div>
			  <div class="col-xs-6">
				  <a href="register.jsp" class="btn btn-primary btn-block">注册</a>
			  </div>
		  </div>
		  <h5 align="center" style="padding-top:15px;">  <a href="test.jsp">版权所有 2018</a></h5>

	  </form>
  </div>

  </body>
</html>
