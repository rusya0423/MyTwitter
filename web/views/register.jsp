<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container mt-5">

            <div class="row">
                <div class="col-6 offset-3">
                    <%
                        String error = request.getParameter("error");
                        if(error!=null&&error.equals("1")){
                    %>
                    <div class="alert alert-danger" role="alert">
                        User exists or password mismatch
                    </div>
                    <%
                        }
                    %>
                    <form action="/" method="post">
                        <input type="hidden" name="act" value="register">
                        <div class="form-group">
                            <label>Login</label>
                            <input type="text" class="form-control" placeholder="Enter login" name="login">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" placeholder="Enter password" name="password">
                        </div>
                        <div class="form-group">
                            <label>Re-Password</label>
                            <input type="password" class="form-control" placeholder="Repeat password" name="re_password">
                        </div>
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" class="form-control" placeholder="Enter full name" name="full_name">
                        </div>
                        <button type="submit" class="btn btn-primary">Register</button>
                    </form>
                </div>
            </div>

        </div>
    </body>
</html>
