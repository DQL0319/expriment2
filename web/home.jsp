<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/12/1
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="example.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
    <div class="my-3 container">
        <form class="row g-3" action="home" style="float: left">
            <div class="col-auto">
                <input type="text" class="form-control" id="inputUsername" name="userSearch">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">Search</button>
            </div>
        </form>

        <%
            if (request.getSession().getAttribute("user") != null && request.getSession().getAttribute("role").equals("1")) {
        %>
        <div class="col-auto">
            <a href="update.jsp" class="btn btn-primary mb-3" style="float: left; margin-left: 100px">Update</a>
        </div>

        <div class="col-auto">
            <a href="delete.jsp" class="btn btn-primary mb-3 btn-danger" style="float: left; margin-left: 20px">Delete</a>
        </div>

        <%
            }
        %>

    </div>

    <table class="table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>年龄</th>
                <th>爱好</th>
                <th>电话</th>
                <th>性别</th>
                <th>角色</th>
            </tr>
        </thead>

        <%
            List<User> list = (List<User>) request.getAttribute("list");
            if (list != null && list.size() != 0) {
                for (User user : list) {
        %>

        <tbody>
            <tr>
                <td>
                    <%=user.getId()%>
                </td>
                <td>
                    <%=user.getName()%>
                </td>
                <td>
                    <%=user.getPassword()%>
                </td>
                <td>
                    <%=user.getAge()%>
                </td>
                <td>
                    <%=user.getFavorites()%>
                </td>
                <td>
                    <%=user.getPhone()%>
                </td>
                <td>
                    <%=user.getGender()%>
                </td>
                <td>
                    <%= (user.getRole().equals("1") ? "管理员" : "普通用户") %>
                </td>
            </tr>
        <%
                 }
             }
        %>
        </tbody>
    </table>

    <form action="logout" method="get" class="mb-3">
        <div class="d-grid gap-2 col-6 mx-auto">
            <button type="submit" class="btn btn-dark">Logout</button>
        </div>
    </form>
</body>
</html>
