package DAO;

import Pojo.Login;
import Pojo.Registration;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;
import util.HibernateUtil;

import javax.crypto.Cipher;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Key;
import java.sql.*;

/**
 * Created by MAHNOOR on 8/27/2020.
 */
public class RegistrationDAO {


    public static String algorithm = "DESede";
    public static Key key = null;
    public static Cipher cipher = null;
    Session session = HibernateUtil.getSessionFactory().openSession();
    Transaction transaction = session.beginTransaction();
    public void SaveCustomerRegister(Registration registration){

        session.persist(registration);
        transaction.commit();
        session.close();

    }



    private String hashPassword(String plainTextPassword){
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
    }



    public static byte[] encrypt(String input)throws Exception {
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] inputBytes = input.getBytes();
        return cipher.doFinal(inputBytes);
    }

    public static String decrypt(byte[] encryptionBytes)throws Exception {
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] recoveredBytes =  cipher.doFinal(encryptionBytes);
        String recovered =  new String(recoveredBytes);
        return recovered;
    }

}
