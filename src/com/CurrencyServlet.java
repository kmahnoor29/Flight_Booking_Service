package com;

import Pojo.Flight;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by MAHNOOR on 8/30/2020.
 */
@WebServlet(name = "CurrencyServlet")
public class CurrencyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //getting values from Select & input
        String Convert_price = request.getParameter("Total_PRice");
        String Current_Unit = request.getParameter("Curr");
        String To_Unit = request.getParameter("To");




        if(Current_Unit.equals("AED")){
            Current_Unit = "0.168577";
        }
         else if(Current_Unit.equals("ARS")){
            Current_Unit = "0.168577";
        }  else if(Current_Unit.equals("AUD")){
            Current_Unit = "0.615118";
        }  else if(Current_Unit.equals("BGN")){
            Current_Unit = "0.437263";
        }  else if(Current_Unit.equals("BRL")){
            Current_Unit = "0.36452";
        }  else if(Current_Unit.equals("BWP")){
            Current_Unit = "0.0945012";
        }  else if(Current_Unit.equals("CAD")){
            Current_Unit = "0.612737";
        }  else if(Current_Unit.equals("CHF")){
            Current_Unit = "0.628501";
        }  else if(Current_Unit.equals("CLP")){
            Current_Unit = "0.00130255";
        }  else if(Current_Unit.equals("CNY")){
            Current_Unit = "0.0941966";
        }  else if(Current_Unit.equals("COP")){
            Current_Unit = "0.000333297";
        }  else if(Current_Unit.equals("DKK")){
            Current_Unit = "0.114709";
        }  else if(Current_Unit.equals("EEK")){
            Current_Unit = "0.0546572";
        }  else if(Current_Unit.equals("EGP")){
            Current_Unit = "0.107657";
        }  else if(Current_Unit.equals("EUR")){
            Current_Unit = "0.855201";
        }  else if(Current_Unit.equals("GBP")){
            Current_Unit = "1.0";
        }  else if(Current_Unit.equals("HKD")){
            Current_Unit = "0.0806557";
        }  else if(Current_Unit.equals("HRK")){
            Current_Unit = "0.115641";
        }  else if(Current_Unit.equals("HUF")){
            Current_Unit = "0.00311833";
        }  else if(Current_Unit.equals("ILS")){
            Current_Unit = "0.17155";
        }  else if(Current_Unit.equals("INR")){
            Current_Unit = "0.0137968";
        }  else if(Current_Unit.equals("ISK")){
            Current_Unit = "0.00554904";
        }  else if(Current_Unit.equals("JPY")){
            Current_Unit = "0.00749584";
        }  else if(Current_Unit.equals("KRW")){
            Current_Unit = "0.000552922";
        }  else if(Current_Unit.equals("KZT")){
            Current_Unit = "0.00424244";
        }  else if(Current_Unit.equals("LKR")){
            Current_Unit = "0.00559926";
        }  else if(Current_Unit.equals("LTL")){
            Current_Unit = "0.247684";
        }  else if(Current_Unit.equals("LVL")){
            Current_Unit = "1.2057";
        }  else if(Current_Unit.equals("LYD")){
            Current_Unit = "0.32365";
        }  else if(Current_Unit.equals("MXN")){
            Current_Unit = "0.0508402";
        }  else if(Current_Unit.equals("MYR")){
            Current_Unit = "0.200469";
        }  else if(Current_Unit.equals("NOK")){
            Current_Unit = "0.104293";
        }  else if(Current_Unit.equals("NPR")){
            Current_Unit = "0.0086265";
        }  else if(Current_Unit.equals("NZD")){
            Current_Unit = "0.485357";
        }  else if(Current_Unit.equals("OMR")){
            Current_Unit = "1.62658";
        }  else if(Current_Unit.equals("PKR")){
            Current_Unit = "0.00732149";
        }  else if(Current_Unit.equals("QAR")){
            Current_Unit = "0.171819";
        }  else if(Current_Unit.equals("RON")){
            Current_Unit = "0.198977";
        }  else if(Current_Unit.equals("RUB")){
            Current_Unit = "0.0201399";
        }  else if(Current_Unit.equals("SAR")){
            Current_Unit = "0.166779";
        }  else if(Current_Unit.equals("SDG")){
            Current_Unit = "0.260967";
        }  else if(Current_Unit.equals("SEK")){
            Current_Unit = "0.091032";
        }  else if(Current_Unit.equals("SGD")){
            Current_Unit = "0.481964";
        }  else if(Current_Unit.equals("THB")){
            Current_Unit = "0.0208891";
        }  else if(Current_Unit.equals("TRY")){
            Current_Unit = "0.432246";
        }  else if(Current_Unit.equals("TTD")){
            Current_Unit = "0.098396";
        }  else if(Current_Unit.equals("TWD")){
            Current_Unit = "0.0206288";
        }  else if(Current_Unit.equals("UAH")){
            Current_Unit = "0.077864";
        }  else if(Current_Unit.equals("USD")){
            Current_Unit = "0.625421";
        }  else if(Current_Unit.equals("VEB")){
            Current_Unit = "0.145633";
        }  else if(Current_Unit.equals("ZAR")){
            Current_Unit = "0.0893935";
        }


        if(To_Unit.equals("AED")){
            To_Unit = "0.168577";
        }
        else if(To_Unit.equals("ARS")){
            To_Unit = "0.168577";
        }  else if(To_Unit.equals("AUD")){
            To_Unit = "0.615118";
        }  else if(To_Unit.equals("BGN")){
            To_Unit = "0.437263";
        }  else if(To_Unit.equals("BRL")){
            To_Unit = "0.36452";
        }  else if(To_Unit.equals("BWP")){
            To_Unit = "0.0945012";
        }  else if(To_Unit.equals("CAD")){
            To_Unit = "0.612737";
        }  else if(To_Unit.equals("CHF")){
            To_Unit = "0.628501";
        }  else if(To_Unit.equals("CLP")){
            To_Unit = "0.00130255";
        }  else if(To_Unit.equals("CNY")){
            To_Unit = "0.0941966";
        }  else if(To_Unit.equals("COP")){
            To_Unit = "0.000333297";
        }  else if(To_Unit.equals("DKK")){
            To_Unit = "0.114709";
        }  else if(To_Unit.equals("EEK")){
            To_Unit = "0.0546572";
        }  else if(To_Unit.equals("EGP")){
            To_Unit = "0.107657";
        }  else if(To_Unit.equals("EUR")){
            To_Unit = "0.855201";
        }  else if(To_Unit.equals("GBP")){
            To_Unit = "1.0";
        }  else if(To_Unit.equals("HKD")){
            To_Unit = "0.0806557";
        }  else if(To_Unit.equals("HRK")){
            To_Unit = "0.115641";
        }  else if(To_Unit.equals("HUF")){
            To_Unit = "0.00311833";
        }  else if(To_Unit.equals("ILS")){
            To_Unit = "0.17155";
        }  else if(To_Unit.equals("INR")){
            To_Unit = "0.0137968";
        }  else if(To_Unit.equals("ISK")){
            To_Unit = "0.00554904";
        }  else if(To_Unit.equals("JPY")){
            To_Unit = "0.00749584";
        }  else if(To_Unit.equals("KRW")){
            To_Unit = "0.000552922";
        }  else if(To_Unit.equals("KZT")){
            To_Unit = "0.00424244";
        }  else if(To_Unit.equals("LKR")){
            To_Unit = "0.00559926";
        }  else if(To_Unit.equals("LTL")){
            To_Unit = "0.247684";
        }  else if(To_Unit.equals("LVL")){
            To_Unit = "1.2057";
        }  else if(To_Unit.equals("LYD")){
            To_Unit = "0.32365";
        }  else if(To_Unit.equals("MXN")){
            To_Unit = "0.0508402";
        }  else if(To_Unit.equals("MYR")){
            To_Unit = "0.200469";
        }  else if(To_Unit.equals("NOK")){
            To_Unit = "0.104293";
        }  else if(To_Unit.equals("NPR")){
            To_Unit = "0.0086265";
        }  else if(To_Unit.equals("NZD")){
            To_Unit = "0.485357";
        }  else if(To_Unit.equals("OMR")){
            To_Unit = "1.62658";
        }  else if(To_Unit.equals("PKR")){
            To_Unit = "0.00732149";
        }  else if(To_Unit.equals("QAR")){
            To_Unit = "0.171819";
        }  else if(To_Unit.equals("RON")){
            To_Unit = "0.198977";
        }  else if(To_Unit.equals("RUB")){
            To_Unit = "0.0201399";
        }  else if(To_Unit.equals("SAR")){
            To_Unit = "0.166779";
        }  else if(To_Unit.equals("SDG")){
            To_Unit = "0.260967";
        }  else if(To_Unit.equals("SEK")){
            To_Unit = "0.091032";
        }  else if(To_Unit.equals("SGD")){
            To_Unit = "0.481964";
        }  else if(To_Unit.equals("THB")){
            To_Unit = "0.0208891";
        }  else if(To_Unit.equals("TRY")){
            To_Unit = "0.432246";
        }  else if(To_Unit.equals("TTD")){
            To_Unit = "0.098396";
        }  else if(To_Unit.equals("TWD")){
            To_Unit = "0.0206288";
        }  else if(To_Unit.equals("UAH")){
            To_Unit = "0.077864";
        }  else if(To_Unit.equals("USD")){
            To_Unit = "0.625421";
        }  else if(To_Unit.equals("VEB")){
            To_Unit = "0.145633";
        }  else if(To_Unit.equals("ZAR")){
            To_Unit = "0.0893935";
        }




//finding Exchange rate


double current = Double.parseDouble(Current_Unit);
double to = Double.parseDouble(To_Unit);
int amount =Integer.parseInt(Convert_price);

        double getExchange = current/to;
        System.out.print("Exchange Rate"+"\n"+getExchange);


        double ExchangeRate = amount/getExchange;



        System.out.print("amount Rate"+"\n"+ExchangeRate);


        //Change Value in String

        String Converted = Double.toString(ExchangeRate);

//pass the Amount to Session
       HttpSession session = request.getSession(true);

      session.setAttribute("Converted",Converted);



        RequestDispatcher dispatcher = request.getRequestDispatcher("PaymentRecieptGenerate.jsp");
        dispatcher.forward(request, response);


    }


}
