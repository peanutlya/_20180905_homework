<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
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
        var t=$("input[name='keywords']").val();
        $("input[name='keywords']").val("").focus().val(t);
        $('li:eq(4)').addClass("active");
    })
    function findPage(pageNum) {
        if(pageNum!=0){
            window.location.href="${pageContext.request.contextPath}/StudentServlet?op=queryStudnetByPageHelper&pageNum="+pageNum+"&keywords=${keywords}";
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
                    <li class="active">所有学生信息查看</li>

                </ol>
            </div>
            <div id="content">
                <form action="${pageContext.request.contextPath}/StudentServlet?op=queryStudnetByPageHelper" method="post">
                    <div class="row">
                        <div class="col-md-2">
                            <a class="btn btn-success" href="${pageContext.request.contextPath}/admin/student/addStudent.jsp">添加</a>
                        </div>
                        <div class="col-md-6"></div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="姓名" name="keywords" autofocus="" value="${keywords}">
                                <span class="input-group-btn">
             				        <button class="btn btn-default" type="submit">搜索</button>
             				      </span>
                            </div><!-- /input-group -->
                        </div>

                    </div>
                </form>
                <table class="table table-bordered table-striped table-hover">
                    <tr>
                        <th>姓名</th>
                        <th>学号</th>
                        <th>年龄</th>
                        <th>籍贯</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${pageInfo.list}" var="stu">
                        <tr>
                            <td>${stu.username}</td>
                            <td>${stu.password}</td>
                            <td>${stu.age}</td>
                            <td>${stu.address}</td>
                            <td>
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/StudentServlet?op=edit&id=${stu.id}">编辑</a>
                                <a class="btn btn-danger btn-xs" href="${pageContext.request.contextPath}/StudentServlet?op=delete&id=${stu.id}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <h5>当前是第${pageInfo.pages==0?0:pageInfo.pageNum}页,共${pageInfo.pages}页，总记录数为${pageInfo.total}条。</h5>
                <nav style="text-align: center">
                    <ul class="pagination">
                        <li><a href="javascript:findPage(1)"><span>首页</span></a></li>
                        <c:if test="${pageInfo.pageNum==1}">
                            <li class="disabled"><a href="javascript:void(0)"><span>上一页</span></a></li>
                        </c:if>

                        <c:if test="${pageInfo.pageNum!=1}">
                            <li><a href="javascript:findPage(${pageInfo.pageNum-1})"><span>上一页</span></a></li>
                        </c:if>

                        <c:forEach begin="1" end="${pageInfo.pages}" var="page">
                            <c:if test="${pageInfo.pageNum==page}">
                                <li class="active"><a href="javascript:void(0)">${page}</a></li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum!=page}">
                                <li style="margin-right:5px"><a href="javascript:findPage(${page})">${page}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.pageNum==pageInfo.pages||pageInfo.pages==0}">
                            <li class="disabled"><a href="javascript:void(0)"> <span>下一页</span>
                            </a></li>

                        </c:if>

                        <c:if test="${pageInfo.pageNum!=pageInfo.pages&&pageInfo.pages!=0}">
                            <li><a href="javascript:findPage(${pageInfo.pageNum+1})"> <span>下一页</span>
                            </a></li>
                        </c:if>
                        <li><a href="javascript:findPage(${pageInfo.pages})"><span>尾页</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>


</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>

