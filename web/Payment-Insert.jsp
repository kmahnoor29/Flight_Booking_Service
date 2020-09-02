<%--
  Created by IntelliJ IDEA.
  User: MAHNOOR
  Date: 8/29/2020
  Time: 7:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.util.List" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="DAO.FlightDAO" %>
<%! String driverName ="com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/flight_booking_service";%>
<%!String user = "root";%>
<%!String psw = "";%>

<%
  FlightDAO flightDAO=new FlightDAO();

  String cvv, accountno;

  String id = request.getParameter("id");
  int ID = Integer.parseInt(id);

  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;



  String Cardno = request.getParameter("Cardno");
  String ExpiryDate = request.getParameter("ExpiryDate");
  String ExpiryMonth = request.getParameter("ExpiryMonth");
  String CVV = request.getParameter("CVV");
  String curr_price = request.getParameter("curr-price");


  session.setAttribute("curr_price",curr_price);
  session.setAttribute("Cardno",Cardno);
  session.setAttribute("ExpiryDate",ExpiryDate);
  session.setAttribute("ExpiryMonth",ExpiryMonth);

  System.out.print("Check"+ curr_price);

  PreparedStatement ps = null;

  try{

    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    connection = DriverManager.getConnection(url, user, psw);


    accountno = flightDAO.hashPassword(Cardno);
    cvv = flightDAO.hashPassword(CVV);

    ps = connection.prepareStatement("insert into booking_payment (flight_booking_id,Cardno,ExpiryDate,ExpiryMonth,CVV) " + "values (?,?,?,?,?)");

    ps.setInt(1, ID);
    ps.setString(2, accountno);
    ps.setString(3, ExpiryDate);
    ps.setString(4, ExpiryMonth);
    ps.setString(5, cvv);



    int count = ps.executeUpdate();
    if(count>0)
    {
      out.println("insert successfully");
    }
    else
    {

      out.println("not successfully");
    }


  }
  catch(Exception ex)
  {
    RequestDispatcher dispatcher = request.getRequestDispatcher("BookingError.jsp");
    dispatcher.forward(request, response);
    ex.printStackTrace();
  }
  finally {
    try {
      if (resultSet != null) {
        resultSet.close();
        resultSet = null;
      }
      if (ps != null) {
        ps.close();
        ps = null;
      }
      if (connection != null) {
        connection.close();
        connection = null;
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

  }


  RequestDispatcher dispatcher = request.getRequestDispatcher("/BookingPaymentReciept.jsp");
  dispatcher.forward(request, response);


%>