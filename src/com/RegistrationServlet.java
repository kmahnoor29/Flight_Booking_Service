package com;

import DAO.RegistrationDAO;
import Pojo.Registration;
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
import javax.servlet.http.HttpSession;
import java.io.*;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

/**
 * Created by MAHNOOR on 8/27/2020.
 */
@WebServlet(name = "RegistrationServlet")
public class RegistrationServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //pojo and dao class object

        Registration registration = new Registration();
        RegistrationDAO registrationDAO = new RegistrationDAO();

        //get values from Form

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("password_again");

        HttpSession session = request.getSession(true);

        //set values in POJO Class

        //testing

       /* StringBuffer buffer=new StringBuffer();
        try {
            key = KeyGenerator.getInstance(algorithm).generateKey();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        try {
            cipher = Cipher.getInstance(algorithm);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        }
        String input = password;
        System.out.println("Entered: " + input);
        byte[] encryptionBytes = new byte[0];
        try {
            encryptionBytes = encrypt(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String passw=new String(encryptionBytes);

     /*   String strPath = "D:\\Job\\Project\\Flight Booking in Java\\untitled\\web\\Secured\\Credential.txt";
        File strFile = new File(strPath);
        if(!strFile.canRead())
            strFile.setReadable(true);
        boolean fileCreated = strFile.createNewFile();
*/

        //File appending
       /* Writer objWriter = new BufferedWriter(new FileWriter(strFile));
        objWriter.write(passw);
        objWriter.flush();
        objWriter.close(); */

        String Password = hashPassword(password);

    registration.setFirstname(firstname);
        registration.setLastname(lastname);
        registration.setEmail(email);
        registration.setPassword(Password);





        //set Email in Session
        session.setAttribute("firstname", firstname);
        session.setAttribute("email", email);




        //saving User Data into Database
        if (password.equals(confirmpassword)) {
            registrationDAO.SaveCustomerRegister(registration);


            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }



    private String hashPassword(String plainTextPassword){
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
    }
}
