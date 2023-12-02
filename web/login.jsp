<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/11/29
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/login.css" type="text/css">
    <link rel="icon" href="./images/Apple.png">
</head>
<body>
    <div class="card container my-5" style="width: 50rem;">
        <div class="card-body">
            <h1 class="card-title">Login</h1>
            <h5 class="alert alert-danger" role="alert">
                <%=(session.getAttribute("Error") == null ? "Please First Login" : session.getAttribute("Error"))%>
            </h5>
            <form action="login" method="get" class="mb-3">
                <div class="mb-3">
                    <label for="exampleInputUserName" class="form-label">UserName</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputUserName"
                            name="username"
                    >
                    <div id="nameHelp" class="form-text">We'll never share your username with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword" class="form-label">Password</label>
                    <input
                            type="password"
                            class="form-control"
                            id="exampleInputPassword"
                            name="password"
                    >
                </div>
                <div>
                    <label class="form-label">Role</label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="role"
                            id="flexRadioDefault1"
                            checked
                            value="1"
                    >
                    <label class="form-check-label" for="flexRadioDefault1">
                        Admin
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="role"
                            id="flexRadioDefault2"
                            value="0"
                    >
                    <label class="form-check-label" for="flexRadioDefault2">
                        User
                    </label>
                </div>
                <div class="d-grid gap-2 d-flex justify-content-evenly">
                    <button type="submit" class="btn btn-dark" style="width: 6rem;">Submit</button>
                    <a href="register.jsp" class="btn btn-dark" style="width: 6rem;">Register</a>
                    <button type="reset" class="btn btn-dark" style="width: 6rem;">Reset</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
