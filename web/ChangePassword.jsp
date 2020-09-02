<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
  }



%>
<%

  String Oldpassword = request.getParameter("Oldpassword");
  String Newpassword = request.getParameter("Newpassword");
  String Cpassword = request.getParameter("Cpassword");
  String destpage ="login.jsp";

  Connection con = null;
  Statement st = null;
  String pass = "";
  int id = 0;
  try {
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/flight_booking_service";
    con = DriverManager.getConnection(url, "root", "");
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from registration where password= '"+ Oldpassword + "'");
    if (rs.next()) {
      pass = rs.getString("password");
    }
    if(Newpassword.equals(Cpassword))
    {
      if (pass.equals(Oldpassword)) {
        st = con.createStatement();
        int i = st.executeUpdate("update registration set password='"+ Newpassword + "'");

        st.close();
        con.close();
        destpage="login.jsp";
      } else {

        destpage="error.jsp";

      }
/*}else{
out.println("new password and confirm new password is not matching");

}*/
      RequestDispatcher dispatcher = request.getRequestDispatcher(destpage);
      dispatcher.forward(request, response);

    }
  } catch (Exception e) {
    out.println(e);
  }
%>