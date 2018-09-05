<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/25
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
	<script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
</head>
<script>
    $(function () {
        $('li:eq(1)').addClass("active");
    })
</script>
<body>
<jsp:include page="top.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<jsp:include page="left.jsp"></jsp:include>
		</div>
		<div class="col-md-8">
			<div id="route">
				<ol class="breadcrumb">
					<li><a href="#">系统菜单</a></li>
					<li class="active">个人信息查看</li>

				</ol>
			</div>
			<div id="content">
				<table class="table table-bordered table-striped table-hover">

					<tr>
						<th>用户名</th>
						<th>密码</th>
						<th>年龄</th>
						<th>地址</th>
					</tr>


					<tr>
						<td>${user.username}</td>
						<td>${user.password}</td>
						<td>${user.age}</td>
						<td>${user.address}</td>
					</tr>

				</table>
			</div>
		</div>
	</div>

	<div id="copy_right">
		<p>Copyright © 2018 xyxy.lya. All rights reserved.</p>
	</div>
</div>

</body>
</html>

