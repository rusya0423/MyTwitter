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

                Blogs blog = (Blogs)request.getAttribute("blog");
                if(blog!=null){
            %>
                <div class="jumbotron">
                    <h1 class="display-5"><%=blog.getTitle()%></h1>
                    <p class="lead"><%=blog.getShortContent()%></p>
                    <p class="lead"><%=blog.getContent()%></p>
                    <hr class="my-4">
                    <p>Posted at <%=blog.getPostDate()%> by <%=blog.getAuthor().getFullName()%></p>
                </div>
            <%

                }else{
            %>
                <h1>
                    PAGE NOT FOUND 404
                </h1>
            <%
                }

            %>

        </div>
    </body>
</html>
