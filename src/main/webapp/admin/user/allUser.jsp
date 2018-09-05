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
        $('li:eq(2)').addClass("active");

        var t=$("#keyword").val();
        $("#keyword").val("").focus().val(t);
    })
    function jump(){
        var pageIndex = $('#toPage').val();
        if(pageIndex < 1){
            pageIndex=1;
        }else if(pageIndex > ${pageBean.totalPage}){
           pageIndex=${pageBean.totalPage};
        }
       findPage(pageIndex);
    }
    function findPage(currentPage) {
        var name=$('#keyword').val();
        if(currentPage!=0){
            window.location.href="${pageContext.request.contextPath}/UserServlet?op=showUsersByPage&currentPage="+currentPage+"&name="+name;
        }
    }
    //删除用户
    function deleteUser(id,userName){
        if(confirm('确定要删除' + userName + '用户吗?')){
            window.location.href="${pageContext.request.contextPath}/UserServlet?op=delete&id="+id;
        }
    }

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
					<li class="active">所有用户信息查看</li>

				</ol>
			</div>
			<div id="content">
				<form method="post" action="/UserServlet?op=queryUser">
					<div class="row">
						<div class="col-md-2">
							<a class="btn btn-success" href="/admin/user/add.jsp">添加</a>
						</div>
						<div class="col-md-6"></div>
						<div class="col-md-4">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="用户名" name="name" autofocus="" id="keyword" value="${name}">
								<span class="input-group-btn">
             				        <button class="btn btn-default" type="submit">搜索</button>
             				      </span>
							</div><!-- /input-group -->
						</div>

					</div>
				</form>
				<table class="table table-bordered table-striped table-hover">
					<tr>
						<th>序号</th>
						<th>用户名</th>
						<th>密码</th>
						<th>年龄</th>
						<th>地址</th>
						<th>操作</th>
					</tr>

					<c:forEach items="${pageBean.pageList}" var="user" varStatus="vs">
						<tr>
							<td>${(pageBean.currentPage-1)*5+vs.count}</td>
							<td>${user.username}</td>
							<td>${user.password}</td>
							<td>${user.age}</td>
							<td>${user.address}</td>
							<td>
								<a class="btn btn-info btn-xs" href="/UserServlet?op=edit&id=${user.id}">编辑</a>
								<a class="btn btn-danger btn-xs" href="javascript:deleteUser(${user.id},'${user.username}')">删除</a>
							</td>
						</tr>
					</c:forEach>

				</table>
				<h5>当前是第${pageBean.currentPage}页,共${pageBean.totalPage}页，总记录数为${pageBean.totalCount}条。</h5>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<nav style="text-align: center">

							<ul class="pagination">
								<li><a href="javascript:findPage(1)" aria-label="Previous"><span>首页</span></a></li>
								<c:if test="${pageBean.currentPage==1}">

									<li class="disabled"><a href="javascript:void(0)" aria-label="Previous"><span
											aria-hidden="true">上一页</span></a></li>

								</c:if>

								<c:if test="${pageBean.currentPage!=1}">

									<li><a href="javascript:findPage(${pageBean.currentPage-1})" aria-label="Previous"><span
											aria-hidden="true">上一页</span></a></li>
								</c:if>

								<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
									<c:if test="${pageBean.currentPage==page}">
										<li class="active"><a href="javascript:void(0)">${page}</a></li>
									</c:if>
									<c:if test="${pageBean.currentPage!=page}">
										<li style="margin-right:5px"><a href="javascript:findPage(${page})">${page}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${pageBean.currentPage==pageBean.totalPage||pageBean.totalPage==0}">
									<li class="disabled"><a href="javascript:void(0)" aria-label="Next"> <span aria-hidden="true">下一页</span>
									</a></li>

								</c:if>

								<c:if test="${pageBean.currentPage!=pageBean.totalPage&&pageBean.totalPage!=0}">
									<li><a href="javascript:findPage(${pageBean.currentPage+1})" aria-label="Next"> <span aria-hidden="true">下一页</span>
									</a></li>
								</c:if>
								<li><a href="javascript:findPage(${pageBean.totalPage})" aria-label="Previous"><span>尾页</span></a></li>

								<div class="input-group">
									<input type="text" class="form-control" id="toPage" placeholder="页码">
									<span class="input-group-btn">
									<button onclick="jump()" class="btn btn-default">跳转</button>
					</span>
								</div><!-- /input-group -->




							</ul>
						</nav>
					</div>
					<div class="col-md-1"></div>
				</div>

			</div>



			</div>
		</div>
	</div>


</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>

