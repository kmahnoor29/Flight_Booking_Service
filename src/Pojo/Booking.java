package Pojo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by MAHNOOR on 9/1/2020.
 */

@XmlRootElement(name = "booking")
@XmlAccessorType(XmlAccessType.FIELD)
public class Booking {
    public String booking_id;
    public  String flight_details_id;
    public String fullname;
    public  String lastname;
    public String bphone;
    public String bmobile;
    public String  bookseats;

    public Booking(){}

    public Booking(String flight_details_id, String fullname, String lastname, String bphone, String bmobile, String bookseats) {
        this.flight_details_id = flight_details_id;
        this.fullname = fullname;
        this.lastname = lastname;
        this.bphone = bphone;
        this.bmobile = bmobile;
        this.bookseats = bookseats;
    }

    public String getFlight_details_id() {
        return flight_details_id;
    }


    public void setFlight_details_id(String flight_details_id) {
        this.flight_details_id = flight_details_id;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getBphone() {
        return bphone;
    }

    public void setBphone(String bphone) {
        this.bphone = bphone;
    }

    public String getBmobile() {
        return bmobile;
    }

    public void setBmobile(String bmobile) {
        this.bmobile = bmobile;
    }

    public String getBookseats() {
        return bookseats;
    }

    public void setBookseats(String bookseats) {
        this.bookseats = bookseats;
    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Book{");
        sb.append("id='").append(booking_id).append('\'');
        sb.append(", flightid='").append(flight_details_id).append('\'');
        sb.append(", fullname='").append(fullname).append('\'');
        sb.append(", phone='").append(bphone).append('\'');
        sb.append(", mobile='").append(bmobile).append('\'');
        sb.append(", seatsbook='").append(bookseats).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
