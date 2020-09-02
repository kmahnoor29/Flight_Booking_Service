package Pojo;

import javax.xml.bind.annotation.*;
import java.util.List;

/**
 * Created by MAHNOOR on 8/28/2020.
 */
@XmlRootElement(name = "flight")
@XmlAccessorType(XmlAccessType.FIELD)
public class Flight  {
    public  int id;
    public String Flight_no;
    public  String Flight_name;
    public  String Dep_from;
    public  String Arr_at;
    public  String Dep_time;
    public  String Arr_time;
    public  String date;
    public  int Total_seats;
    public  int Ticket_price;
    public  String Booking_status;
    public  String Flight_type;
    public  String Airport_name;
    public  String Airport_email;
    public  String Airport_no;

    @XmlElementWrapper(name = "bookList")

    @XmlElement(name = "book")
    private List<Booking> bookings;



    public Flight(){}

    public Flight(int id, int total_seats, int ticket_price, String booking_status,  List<Booking> bookings) {
        this.id = id;

        Total_seats = total_seats;
        Ticket_price = ticket_price;
        Booking_status = booking_status;

        this.bookings = bookings;
    }


    public int getId() {
        return id;
    }


    public int getTotal_seats() {
        return Total_seats;
    }



         public int getTicket_price() {
        return Ticket_price;
    }



      public String getBooking_status() {
        return Booking_status;
    }




    public void setId(int id) {
        this.id = id;
    }


    public String getFlight_no() {
        return Flight_no;
    }

    public void setFlight_no(String flight_no) {
        Flight_no = flight_no;
    }



    public String getFlight_name() {
        return Flight_name;
    }

    public void setFlight_name(String flight_name) {
        Flight_name = flight_name;
    }



    public String getDep_from() {
        return Dep_from;
    }

    public void setDep_from(String dep_from) {
        Dep_from = dep_from;
    }



    public String getArr_at() {
        return Arr_at;
    }

    public void setArr_at(String arr_at) {
        Arr_at = arr_at;
    }



    public String getDep_time() {
        return Dep_time;
    }

    public void setDep_time(String dep_time) {
        Dep_time = dep_time;
    }



    public String getArr_time() {
        return Arr_time;
    }

    public void setArr_time(String arr_time) {
        Arr_time = arr_time;
    }



    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }



    public void setTotal_seats(int total_seats) {
        Total_seats = total_seats;
    }



    public void setTicket_price(int ticket_price) {
        Ticket_price = ticket_price;
    }



    public void setBooking_status(String booking_status) {
        Booking_status = booking_status;
    }


    public String getFlight_type() {
        return Flight_type;
    }

    public void setFlight_type(String flight_type) {
        Flight_type = flight_type;
    }



    public String getAirport_name() {
        return Airport_name;
    }

    public void setAirport_name(String airport_name) {
        Airport_name = airport_name;
    }



    public String getAirport_email() {
        return Airport_email;
    }

    public void setAirport_email(String airport_email) {
        Airport_email = airport_email;
    }



    public String getAirport_no() {
        return Airport_no;
    }

    public void setAirport_no(String airport_no) {
        Airport_no = airport_no;
    }



}
