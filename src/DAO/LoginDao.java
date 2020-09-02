package DAO;

import Pojo.Login;
import Pojo.Registration;

import java.sql.*;

/**
 * Created by MAHNOOR on 8/27/2020.
 */
public class LoginDao {



    public Login checkLogin(String email, String password) throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/flight_booking_service";
        String dbUser = "root";
        String dbPassword = "";

        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "SELECT email,password FROM registration WHERE email = ? and password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery();

        Login user = null;

        if (result.next()) {
            user = new Login();
            user.setEmail(email);
        }

        connection.close();

        return user;
    }


    public String checkHash(String hashValue) throws SQLException,
            ClassNotFoundException {

        String jdbcURL = "jdbc:mysql://localhost:3306/flight_booking_service";
        String dbUser = "root";
        String dbPassword = "";

        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "SELECT password FROM registration WHERE email = ? ";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, hashValue);


        ResultSet result = statement.executeQuery();


        if (result.next()) {
         result.getString(hashValue);
        }

        connection.close();

        return hashValue;
    }

}
