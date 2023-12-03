<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/12/1
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
    <script>
        const role = <%=request.getSession().getAttribute("role")%>;
        const gender = "<%=request.getSession().getAttribute("gender")%>";

        function setRadioButtons() {
            console.log(role);
            console.log(Number(role) === 1);
            console.log(Number(role) === 0);
            console.log(gender === "男");
            console.log(gender === "女");
            console.log("<%=request.getSession().getAttribute("gender")%>");
            if(gender === "男") {
                document.getElementById('flexRadioDefault1').checked = true;
            } else if (gender === "女") {
                document.getElementById('flexRadioDefault2').checked = true;
            }
            if (Number(role) === 1) {
                document.getElementById('flexRadioDefault1').checked = false;
                document.getElementById('flexRadioDefault2').checked = false;
                document.getElementById('flexRadioDefault3').checked = false;
                document.getElementById('flexRadioDefault4').checked = false;
                document.getElementById('exampleInputId').disabled = false;
                document.getElementById('exampleInputId').value = null;
            } else if (Number(role) === 0) {
                document.getElementById('flexRadioDefault4').checked = true;
                document.getElementById('flexRadioDefault3').disabled = true;
                document.getElementById('exampleInputId').disabled = true;
                document.getElementById('exampleInputId').value = "<%=request.getSession().getAttribute("id")%>";
            }

        }

        window.onload = function () {
            setRadioButtons();
        };
    </script>
    <div class="card container my-5" style="width: 50rem;">
        <div class="card-body">
            <h1 class="card-title">Update</h1>
            <form action="update" method="get" class="mb-3">
                <div class="mb-3">
                    <label for="exampleInputId" class="form-label">Id</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputId"
                            name="id"
                    >
                </div>
                <div class="mb-3">
                    <label for="exampleInputUserName" class="form-label">UserName</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputUserName"
                            name="username"
                    >
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
                <div class="mb-3">
                    <label for="exampleInputAge" class="form-label">Age</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputAge"
                            name="age"
                    >
                </div>
                <div class="mb-3">
                    <label for="exampleInputFavorites" class="form-label">Favorites</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputFavorites"
                            name="favorites"
                    >
                </div>
                <div class="mb-3">
                    <label for="exampleInputPhone" class="form-label">Phone</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputPhone"
                            name="phone"
                    >
                </div>
                <div>
                    <label class="form-label">Gender</label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="gender"
                            id="flexRadioDefault1"
                            value="男"
                    >
                    <label class="form-check-label" for="flexRadioDefault1">
                        Male
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="gender"
                            id="flexRadioDefault2"
                            value="女"
                    >
                    <label class="form-check-label" for="flexRadioDefault2">
                        Female
                    </label>
                </div>
                <div>
                    <label class="form-label">Role</label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="role"
                            id="flexRadioDefault3"
                            value="1"
                    >
                    <label class="form-check-label" for="flexRadioDefault3">
                        Admin
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="role"
                            id="flexRadioDefault4"
                            value="0"
                    >
                    <label class="form-check-label" for="flexRadioDefault4">
                        User
                    </label>
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
