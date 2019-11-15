<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container mt-5">

            <div class="row">
                <div class="col-10 offset-1">
                    <form action="/" method="post">
                        <input type="hidden" name="act" value="addblog">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Title</label>
                            <div class="col-sm-9">
                                <input type="text" name="title" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Short Content</label>
                            <div class="col-sm-9">
                                <textarea name="short_content" rows="5" style="width: 100%;" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Content</label>
                            <div class="col-sm-9">
                                <textarea name="content" rows="5" style="width: 100%;" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">

                            <div class="col-sm-12">
                                <button class="btn btn-success float-right">ADD BLOG</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </body>
</html>
