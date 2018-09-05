<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>登陆|学生选课信息管理系统</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
</head>
<style>
	body{
		background:#ccc;
	}

	form{
		margin-top:15px;
	}
</style>
<body>
<div class="container">
	<form class="form-horizontal" id="myform" action="${pageContext.request.contextPath}/UserServlet?op=addUser" method="post">

		<div class="form-group">
			<label for="stuName" class="col-sm-2 col-sm-offset-3 control-label">用户名</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="name" name="username" required="">
			</div>
		</div>

		<div class="form-group">
			<label for="password" class="col-sm-2 col-sm-offset-3 control-label">密码</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="passowrd" name="password" required="" >
			</div>
		</div>

		<div class="form-group">
			<label for="age" class="col-sm-2 col-sm-offset-3 control-label">年龄</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="age" name="age" required="">
			</div>
		</div>

		<div class="form-group">
			<label for="address" class="col-sm-2 col-sm-offset-3 control-label">地址</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="address" name="address" required="">
			</div>
		</div>





		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 col-sm-offset-3 control-label"></label>
			<div class="col-sm-3">
				<button type="submit" class="btn btn-success" style="margin-right:30px">确定</button>
				<button type="reset" class="btn btn-primary" >重置</button>

			</div>
		</div>


	</form>

</div> <!-- /container -->
</body>
</html>