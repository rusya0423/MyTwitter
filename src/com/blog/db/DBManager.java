package com.blog.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBManager {

    private Connection connection;

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public void connect(){
        try{

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/group20db?useUnicode=true&serverTimezone=UTC", "root","");

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public Users getUser(String login, String password){

        Users user = null;

        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM users " +
                    "WHERE login = ? AND password = ? ");

            statement.setString(1, login);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()){

                user = new Users(
                        resultSet.getLong("id"),
                        resultSet.getString("login"),
                        resultSet.getString("password"),
                        resultSet.getString("full_name")
                );

            }

            resultSet.close();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return user;

    }

    public Users getUser(String login){

        Users user = null;

        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM users " +
                    "WHERE login = ?");

            statement.setString(1, login);

            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()){

                user = new Users(
                        resultSet.getLong("id"),
                        resultSet.getString("login"),
                        resultSet.getString("password"),
                        resultSet.getString("full_name")
                );

            }

            resultSet.close();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return user;

    }

    public void addUser(Users user){

        try{

            PreparedStatement preparedStatement = connection.prepareStatement("" +
                    " INSERT INTO users (id, login, password, full_name) " +
                    " VALUES (NULL, ?, ?, ?)");

            preparedStatement.setString(1, user.getLogin());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFullName());

            int res = preparedStatement.executeUpdate();

            preparedStatement.close();

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public void addBlog(Blogs blog){

        try{

            PreparedStatement preparedStatement = connection.prepareStatement("" +
                    " INSERT INTO blogs (id, user_id, title, short_content, content, post_date) " +
                    " VALUES (NULL, ?, ?, ?, ?, NOW())");

            preparedStatement.setLong(1, blog.getAuthor().getId());
            preparedStatement.setString(2, blog.getTitle());
            preparedStatement.setString(3, blog.getShortContent());
            preparedStatement.setString(4, blog.getContent());

            int res = preparedStatement.executeUpdate();

            preparedStatement.close();

        }catch (Exception e){
            e.printStackTrace();
        }

    }


    public void delete(Long id){
        Blogs blogs = this.getBlog(id);
        if(blogs!=null){
        try{
            PreparedStatement preparedStatement = connection.prepareStatement("delete from blogs where id = ?");
            preparedStatement.setLong(1, blogs.getId());
            int res = preparedStatement.executeUpdate();
            preparedStatement.close();

        }catch (Exception e){
            e.printStackTrace();
         }
        }
    }

    public ArrayList<Blogs> getAllBlogs(){

        ArrayList<Blogs> blogs = new ArrayList<>();

        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    " SELECT b.id, b.user_id, b.title, b.short_content, b.post_date, u.full_name " +
                    " FROM blogs b " +
                    " LEFT OUTER JOIN users u ON b.user_id = u.id " +
                    " ORDER BY b.post_date DESC ");

            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()){

                blogs.add(new Blogs(
                        resultSet.getLong("id"),
                        new Users(
                                resultSet.getLong("user_id"),
                                null, null,
                                resultSet.getString("full_name")
                        ),
                        resultSet.getString("title"),
                        resultSet.getString("short_content"),
                        null,
                        resultSet.getDate("post_date")
                ));

            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return blogs;

    }

    public Blogs getBlog(Long id){

        Blogs blog = null;

        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    " SELECT b.id, b.user_id, b.title, b.content, b.short_content, b.post_date, u.full_name " +
                    " FROM blogs b " +
                    " LEFT OUTER JOIN users u ON b.user_id = u.id " +
                    " WHERE b.id = ? ");

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()){

                blog = new Blogs(
                        resultSet.getLong("id"),
                        new Users(
                                resultSet.getLong("user_id"),
                                null, null,
                                resultSet.getString("full_name")
                        ),
                        resultSet.getString("title"),
                        resultSet.getString("short_content"),
                        resultSet.getString("content"),
                        resultSet.getDate("post_date")
                );

            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return blog;

    }

}
