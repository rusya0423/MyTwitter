<%@ page import="java.util.ArrayList" %>
<%@ page import="com.blog.db.Blogs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container mt-5">

            <%

                ArrayList<Blogs> blogs = (ArrayList<Blogs>)request.getAttribute("blogs");
                if(blogs!=null){

                    for(Blogs b : blogs){
            %>
                <div class="jumbotron">
                    <h1 class="display-5"><%=b.getTitle()%></h1>
                    <p class="lead"><%=b.getShortContent()%></p>
                    <hr class="my-4">
                    <p>Posted at <%=b.getPostDate()%> by <%=b.getAuthor().getFullName()%></p>
                    <a class="btn btn-primary btn-sm" href="?page=readblog&id=<%=b.getId()%>" role="button">Read More</a>
                </div>
            <%
                    }

                }

            %>

        </div>
    </body>
</html>
