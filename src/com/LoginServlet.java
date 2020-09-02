package com;

import DAO.LoginDao;
import Pojo.Login;
import org.mindrot.jbcrypt.BCrypt;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 * Created by MAHNOOR on 8/27/2020.
 */
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    String Password,Email;
    String hashPassword;

    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "flight_booking_service";
    String userId = "root";
    String password = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get values from form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //get inherit register values in Login

        Login login = new Login();
        LoginDao loginDao = new LoginDao();

        login.setEmail(email);
        login.setPassword(password);

Email = login.getEmail().toString();
Password = login.getPassword().toString();


        System.out.print(Email);
      System.out.print(Password);
        HttpSession session = request.getSession(true);



        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try{
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement=connection.createStatement();
            String sql ="SELECT * FROM registration WHERE email= '"+Email+"' ";
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){

       hashPassword =  resultSet.getString("password");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }






      checkPass(Password,hashPassword);

        //  login = loginDao.checkLogin(Email,Password);


        if(Email.equals("admin@admin.com") && Password.equals("Password123")){


            session.setAttribute("user", login);
            session.setAttribute("email",email);
            session.setMaxInactiveInterval(10*60);

            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
            dispatcher.forward(request, response);
        }
        else if(checkPass(Password,hashPassword) ){

            session.setAttribute("user", login);
            session.setAttribute("email",email);
            session.setMaxInactiveInterval(10*60);
            RequestDispatcher dispatcher = request.getRequestDispatcher("UserDashboard.jsp");
            dispatcher.forward(request, response);
        }
        else {

            session.setAttribute("user", login);
            session.setAttribute("email",email);
            session.setMaxInactiveInterval(10*60);
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
        request.getSession(false);


    }


    private boolean checkPass(String plainPassword, String hashedPassword) {
        if (BCrypt.checkpw(plainPassword, hashedPassword)){
            System.out.println("The password matches.");
        return  true;}
        else {
            System.out.println("The password does not match.");
            return false;
        } }


}
