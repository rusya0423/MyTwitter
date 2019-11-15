<%@ page import="com.blog.db.Users" %><%

    Users sessionUser = (Users) request.getSession().getAttribute("USER");

    if(sessionUser!=null){

%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/"><%=sessionUser.getFullName()%></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/?page=profile">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/?page=addblog">Add Blog</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="logout()">Logout</a>
            </li>
        </ul>
        <script type="text/javascript">
            function logout() {
                document.getElementById("logout_form").submit();
            }
        </script>
        <form action="/" method="post" id = "logout_form">
            <input type="hidden" name="act" value="logout">
        </form>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<%
    }else{
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Twitter</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/?page=login">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/?page=register">Register</a>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<%
    }
%>