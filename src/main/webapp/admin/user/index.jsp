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
<script>
    $(function () {
        $('li:eq(0)').addClass("active");
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
					<li class="active">系统菜单</li>
				</ol>
			</div>
			<div id="content">
				<div class="jumbotron">
					<h1>Welcome!</h1>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</div>

</body>
</html>
