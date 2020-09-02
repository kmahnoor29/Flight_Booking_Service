<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! String driverName ="com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/flight_booking_service";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
  String id = request.getParameter("id");
  //get Values from Form


  String flightNo = request.getParameter("flightno");
  String flightName = request.getParameter("flightname");
  String depFrom = request.getParameter("depFrom");
  String arrAt = request.getParameter("arrAt");
  String depTime = request.getParameter("depTime");
  String arrTime = request.getParameter("arrTime");
  String Date = request.getParameter("Date");
  String totalSeats = request.getParameter("Customseats");
  String ticketPrice = request.getParameter("Ticketprice");
  String bookingStatus = request.getParameter("BookingStatus");
  String flightType = request.getParameter("Flighttype");
  String airportName = request.getParameter("AirportName");
  String airportEmail = request.getParameter("AirportEmail");
  String airportNo = request.getParameter("AirportNo");


  //converting String Parameter to INT type
  int seats = Integer.parseInt(totalSeats);
  int price = Integer.parseInt(ticketPrice);

  //changing booking status

  if(bookingStatus == null){
    bookingStatus="CLOSED";
  }else{
    bookingStatus="ONGOING";
  }


  if(id != null)
  {
    Connection con = null;
    PreparedStatement ps = null;
    try
    {
      Class.forName(driverName);
      con = DriverManager.getConnection(url,user,psw);
      String sql="Update flight_details set id=?, flight_no=?,flight_name=?,dep_from=?,arr_at=?,dep_time=?,arr_time=?,date = ?,total_seats=?,ticket_price=?,booking_status=?,flight_type=?,airport_name=?,airport_email=?,airport_no=? where id="+id ;
      ps = con.prepareStatement(sql);
      ps.setString(1,id);
      ps.setString(2,flightNo);
      ps.setString(3, flightName);
      ps.setString(4, depFrom);
      ps.setString(5, arrAt);
      ps.setString(6, depTime);
      ps.setString(7, arrTime);
      ps.setString(8, Date);
      ps.setInt(9, seats);
      ps.setInt(10, price);
      ps.setString(11, bookingStatus);
      ps.setString(12, flightType);
      ps.setString(13, airportName);
      ps.setString(14, airportEmail);
      ps.setString(15, airportNo);
      int i = ps.executeUpdate();
      if(i > 0)
      {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewFlights.jsp");
        dispatcher.forward(request, response);
      }
      else
      {
        out.print("There is a problem in updating Record.");
      }
    }
    catch(SQLException sql)
    {
      request.setAttribute("error", sql);
      out.println(sql);
    }



  }
%>