<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<%--
  Created by IntelliJ IDEA.
  User: MAHNOOR
  Date: 8/28/2020
  Time: 6:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id=request.getParameter("id");
  try
  {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_booking_service", "root", "");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("DELETE FROM flight_details WHERE id="+id);
    RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewFlights.jsp");
    dispatcher.forward(request, response);
  }
  catch(Exception e)
  {
    System.out.print(e);
    e.printStackTrace();
  }
%>