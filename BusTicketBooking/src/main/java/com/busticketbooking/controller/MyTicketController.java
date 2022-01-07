package com.busticketbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BookedTicketsDaoImpl;
import com.busticketbooking.daoimpl.SeatDetailsDaoImpl;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.SeatDetails;

@WebServlet("/myticketservlet")
public class MyTicketController extends HttpServlet  {

	BookedTicketsDaoImpl bookTicketsDao=new BookedTicketsDaoImpl();
	SeatDetailsDaoImpl seatDetailsDao=new SeatDetailsDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		List<BookedTickets> bookTicketsList=new ArrayList<BookedTickets>();
		List<SeatDetails> seatDetailsList=new ArrayList<SeatDetails>();
	     List<SeatDetails> seatNoList=new ArrayList<SeatDetails>();
	    		 
		String ticketNo=req.getParameter("tickettext");
		bookTicketsList=bookTicketsDao.findBookedTicketsDetails(ticketNo);
		seatNoList=seatDetailsDao.getSeatDetailsUsingTicketNo(ticketNo);
		
		String bookSeatNum = "";
		for (int i = 0; i < seatNoList.size(); i++) {
			/* bookSeatNo += seatNoList.[i] + " "; */
			SeatDetails agis= seatNoList.get(i); 
			bookSeatNum += agis.getSeatNo() + "  ";
			
		}
		
//		System.out.println(bookSeatNum);
		
		
    	if(bookTicketsList!=null) {
    		session.setAttribute("ticketdetailsresult", bookTicketsList);
    		session.setAttribute("seatnumberdetailsresult", bookSeatNum);
    		try {
				res.sendRedirect("MyTicket.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	
		
	}
}
