package com.blog.controllers;

import com.blog.db.Blogs;
import com.blog.db.DBManager;
import com.blog.db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MainController", value = "/main")
public class MainController extends HttpServlet {

    private DBManager dbManager;

    public void init(){
        dbManager = new DBManager();
        dbManager.connect();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String act = request.getParameter("act");
        String uri = "";

        Users sessionUser = (Users) request.getSession().getAttribute("USER");

        if(act!=null){

            if(sessionUser!=null){

                if(act.equals("logout")){

                    request.getSession().removeAttribute("USER");
                    uri = "?page=login";

                }else if(act.equals("addblog")){

                    String title = request.getParameter("title");
                    String shortContent = request.getParameter("short_content");
                    String content = request.getParameter("content");

                    dbManager.addBlog(new Blogs(null, sessionUser, title, shortContent, content, null));
                    uri = "?page=home";

                }
                else if(act.equals("deleteblog")){

                }

            }else{

                if(act.equals("login")){

                    String login = request.getParameter("login");
                    String password = request.getParameter("password");

                    Users user = dbManager.getUser(login, password);

                    if(user!=null){

                        request.getSession().setAttribute("USER", user);

                    }else{

                        uri = "?page=login&error=1";

                    }

                }else if(act.equals("register")){

                    uri = "?page=register&error=1";

                    String login = request.getParameter("login");
                    String password = request.getParameter("password");
                    String rePassword = request.getParameter("re_password");
                    String fullName = request.getParameter("full_name");

                    if(login!=null&&password!=null&&rePassword!=null&&rePassword.equals(password)){

                        Users user = dbManager.getUser(login);

                        if(user==null){

                            dbManager.addUser(new Users(null, login, password, fullName));
                            uri = "?page=login";

                        }
                    }

                }
            }

        }

        response.sendRedirect("/"+uri);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = request.getParameter("page");
        String jspPage = "home";

        Users sessionUser = (Users) request.getSession().getAttribute("USER");

        if(page!=null){
            if(sessionUser!=null){

                if(page.equals("home")){
                    jspPage = "home";
                }else if(page.equals("readblog")){
                    jspPage = "readmore";
                }else if(page.equals("profile")){
                    jspPage = "home";
                }else if(page.equals("addblog")){
                    jspPage = "addblog";
                }

            }else{

                if(page.equals("home")){
                    jspPage = "home";
                }else if(page.equals("readblog")){
                    jspPage = "readmore";
                }else if(page.equals("login")){
                    jspPage = "login";
                }else if(page.equals("register")){
                    jspPage = "register";
                }

            }
        }

        if(jspPage.equals("home")){

            ArrayList<Blogs> allBlogs = dbManager.getAllBlogs();
            request.setAttribute("blogs", allBlogs);

        }else if(jspPage.equals("login")){

        }else if(jspPage.equals("register")){

        }else if(jspPage.equals("profile")){

        }else if(jspPage.equals("addblog")){

        }else if(jspPage.equals("readmore")){
            try{

                Long id = Long.parseLong(request.getParameter("id"));
                Blogs blog = dbManager.getBlog(id);
                request.setAttribute("blog", blog);

            }catch (Exception e){

            }
        }

        request.getRequestDispatcher("/views/"+jspPage+".jsp").forward(request, response);

    }
}
