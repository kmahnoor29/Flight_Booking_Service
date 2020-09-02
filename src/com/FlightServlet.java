package com;

import DAO.FlightDAO;
import Pojo.Booking;
import Pojo.Flight;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.PropertyException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by MAHNOOR on 8/28/2020.
 */
@WebServlet(name = "FlightServlet")
public class FlightServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //Class Objects POJO & DAO

        Flight flight = new Flight();
        FlightDAO flightDAO = new FlightDAO();

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

        //set values in POJO Class


        flight.setFlight_no(flightNo);
        flight.setFlight_name(flightName);
        flight.setDep_from(depFrom);
        flight.setArr_at(arrAt);
        flight.setDep_time(depTime);
        flight.setArr_time(arrTime);
        flight.setDate(Date);
        flight.setTotal_seats(seats);
        flight.setTicket_price(price);
        flight.setBooking_status(bookingStatus);
        flight.setFlight_type(flightType);
        flight.setAirport_name(airportName);
        flight.setAirport_email(airportEmail);
        flight.setAirport_no(airportNo);


        //CREATING XML

        ArrayList<Flight> list=new ArrayList<Flight>();

        list.add(flight);
        try {

            JAXBContext context = JAXBContext.newInstance(Flight.class);
            Marshaller m = context.createMarshaller();
            m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

            // Write to System.out
            m.marshal(flight, System.out);

            // Write to File
            m.marshal(flight, new File("D:\\Job\\Project\\Flight Booking in Java\\Flight_Booking_Service\\web\\JaxbXmls\\Flight.xml"));


        } catch (JAXBException e) {
            e.printStackTrace();
        }



        //saving values in DB using Hibernate


        flightDAO.SaveFlight(flight);

        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
        dispatcher.forward(request, response);


    }


}
