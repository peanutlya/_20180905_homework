<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/25
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
	<script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
</head>

<body>

<div id="left">
	<ul class="nav nav-pills nav-stacked myul">
		<li><a href="${pageContext.request.contextPath}/admin/user/index.jsp">系统菜单</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/user/selfUser.jsp">查看个人信息</a></li>
		<li><a href="${pageContext.request.contextPath}/StudentServlet?op=showAllStudent">查看学生信息列表</a></li>
		<li><a href="${pageContext.request.contextPath}/StudentServlet?op=queryStudnetByPageHelper">分页插件查看</a></li>
		<li><a href="${pageContext.request.contextPath}/StudentServlet?op=test">测试</a></li>
		<li id="test"><a href="${pageContext.request.contextPath}/UserServlet?op=exit">安全退出</a></li>
	</ul>
</div>



</body>
</html>
