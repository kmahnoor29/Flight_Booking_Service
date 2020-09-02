
<%@ page import="java.sql.*" %>

<%@ page import="java.util.List" %>
<%@ page import="Pojo.Booking" %>
<%@ page import="Pojo.Flight" %>
<%@ page import="javax.xml.bind.JAXBContext" %>

<%@ page import="javax.xml.bind.Marshaller" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.File" %>
<%! String driverName ="com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/flight_booking_service";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%--
  Created by IntelliJ IDEA.
  User: MAHNOOR
  Date: 8/29/2020
  Time: 7:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
// Booking object

  Booking booking = new Booking();

  String id = request.getParameter("id");
  session.setAttribute("Book_id",id);

  String driverName = "com.mysql.jdbc.Driver";
  String connectionUrl = "jdbc:mysql://localhost:3306/";
  String dbName = "flight_booking_service";
  String userId = "root";
  String password = "";

  try {
    Class.forName(driverName);
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;



  //get value from Form

  String fullname = request.getParameter("Bname");
  String bemail = request.getParameter("Bemail");
  String bphone = request.getParameter("Bphone");
  String bmobile = request.getParameter("Bmobile");
  String bookseats = request.getParameter("Bseats");

booking.setFlight_details_id(id);
  booking.setFullname(fullname);
  booking.setBphone(bphone);
  booking.setBmobile(bmobile);
  booking.setBookseats(bookseats);









  session.setAttribute("fullname",fullname);
  session.setAttribute("bemail",bemail);
  session.setAttribute("bphone",bphone);
  session.setAttribute("bmobile",bmobile);
session.setAttribute("My_seat",bookseats);




  //check Total Seats and Booking Status


  String Total_Seats=request.getParameter("seat");
  String Booking_Status=request.getParameter("bookingStatus");
  String price = request.getParameter("price");

  int Price = Integer.parseInt(price);



  if(Booking_Status.equals("CLOSED") && Total_Seats.equals("0") ){
    RequestDispatcher dispatcher = request.getRequestDispatcher("BookingError.jsp");
    dispatcher.forward(request, response);
  }
  else{

    session.setAttribute("Price",price);
    //converting String Parameter to INT type
    int seats = Integer.parseInt(bookseats);

    int ID = Integer.parseInt(id);

    //convert Seats & price
    int Tseats = Integer.parseInt(Total_Seats);

    PreparedStatement ps = null;

    //Value of Left Seats
   int leftSeats =  Tseats - seats;



    //CREATING XML

    ArrayList<Booking> list=new ArrayList<Booking>();

    list.add(booking);
    JAXBContext context = JAXBContext.newInstance(Booking.class);
    Marshaller m = context.createMarshaller();
    m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
    Flight flight = new Flight(ID,Tseats,Price,Booking_Status,list);




    // Write to System.out
    m.marshal(booking, System.out);


    // Write to File
    m.marshal(booking, new File("D:\\Job\\Project\\Flight Booking in Java\\Flight_Booking_Service\\web\\JaxbXmls\\Booking.xml"));





//saving Booking Data in Database

    try{

      DriverManager.registerDriver(new com.mysql.jdbc.Driver());
      connection = DriverManager.getConnection(url, user, psw);

      ps = connection.prepareStatement("insert into flight_booking (flight_details_id,Fullname,Bemail,Bphone,Bmobile,Bookseats) " + "values (?,?,?,?,?,?)");



      ps.setInt(1,ID );
      ps.setString(2, fullname);
      ps.setString(3, bemail);
      ps.setString(4, bphone);
      ps.setString(5, bmobile);
      ps.setString(6, bookseats);


      int count = ps.executeUpdate();
      if(count>0)
      {
        out.println("insert successfully");
      }
      else
      {
        out.println("not successfully");

      }



      try
      {
        Class.forName(driverName);
        connection = DriverManager.getConnection(url, user, psw);
        String sql="Update flight_details set total_seats=? where id="+id ;
        ps = connection.prepareStatement(sql);

        ps.setInt(1, leftSeats);

        int i = ps.executeUpdate();
        if(i > 0)
        {
          System.out.print("Sucess");
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
      //update Database To Set Status of Seats Left



      RequestDispatcher dispatcher = request.getRequestDispatcher("BookingPayment.jsp");
    dispatcher.forward(request, response);


  }


%>

