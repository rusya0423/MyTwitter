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
                            Incorrect login or password!
                        </div>
                    <%
                        }
                    %>
                    <form action="/" method="post">
                        <input type="hidden" name="act" value="login">
                        <div class="form-group">
                            <label>Login</label>
                            <input type="text" class="form-control" placeholder="Login" name="login">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" placeholder="Password" name="password">
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input">
                            <label class="form-check-label">Remember me</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div>
            </div>

        </div>
    </body>
</html>
