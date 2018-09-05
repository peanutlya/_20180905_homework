<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/29
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
</head>
<script>
    function fn1() {
        $.get(
            "/AjaxServlet?op=test",
            {"name":"张三","age":25},
            function (data) {
                alert(data.name);
            },
            "json"

        );
    }
    function fn2() {
        $.post(
            "/AjaxServlet?op=test",
            {"name":"张三","age":25},
            function (data) {
                alert(data.name);
            },
            "json"
        );
    }

    function fn3() {
        $.ajax({
            url:"/AjaxServlet?op=test",
            data:{"name":"书记","age":25},
            success:function (data) {
                alert(data);
            },
            dataType:"json"

        });

    }
</script>
<body>
<button onclick="fn1()">get方式提交</button>
<button onclick="fn2()">post方式提交</button>
<button onclick="fn3()">测试ajax</button>

</body>
</html>
