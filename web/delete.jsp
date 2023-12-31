<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/12/1
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
    <div class="card container my-5" style="width: 50rem;">
        <div class="card-body">
            <h1 class="card-title">Delete</h1>
            </h5>
            <form action="delete" method="get" class="mb-3">
                <div class="mb-3">
                    <label for="exampleInputDelete" class="form-label">Id</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputDelete"
                            placeholder="请输入要删除的用户的Id"
                            name="delete"
                    >
                </div>
                <div class="d-grid gap-2 d-flex justify-content-evenly">
                    <a href="home" class="btn btn-dark" style="width: 6rem;">Back</a>
                    <button type="submit" class="btn btn-dark" style="width: 6rem;">Submit</button>
                    <button type="reset" class="btn btn-dark" style="width: 6rem;">Reset</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
