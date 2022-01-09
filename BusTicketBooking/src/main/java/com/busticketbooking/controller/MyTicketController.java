package com.busticketbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
public class MyTicketController extends HttpServlet {

	BookedTickets bookTickets = new BookedTickets();
	BookedTicketsDaoImpl bookTicketsDao = new BookedTicketsDaoImpl();
	SeatDetailsDaoImpl seatDetailsDao = new SeatDetailsDaoImpl();
	BookedTickets bookedTicketsModel = new BookedTickets();
	List<SeatDetails> seatNoList=new ArrayList<SeatDetails>();

	// to get current date
	private static Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}

	public void service(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();

		String ticketNo=req.getParameter("tickettext");
		bookTickets = bookTicketsDao.findBookedTicketsObjectDetails(ticketNo);
		
		seatNoList=seatDetailsDao.getSeatDetailsUsingTicketNo(ticketNo);
		String bookSeatNum = "";
		for (int i = 0; i < seatNoList.size(); i++) {
			/* bookSeatNo += seatNoList.[i] + " "; */
			SeatDetails agis= seatNoList.get(i); 
			bookSeatNum += agis.getSeatNo() + "  ";
			
		}
		if (bookTickets != null) {

			// to convert local date to date format
			LocalDate date = bookTickets.getBusModel().getDeparture().toLocalDate();
			Date localDepartureDate = java.sql.Date.valueOf(date);

			if (localDepartureDate.after(getCurrentDate())) {
				session.setAttribute("ticketdetailsresult", bookTickets);
				session.setAttribute("seatnumberdetailsresult", bookSeatNum);
				try {
					res.sendRedirect("TicketInvoice.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				session.setAttribute("userHome", "cancelSuccess");
				try {
					res.sendRedirect("TicketInvoice.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		// if ticketnumber entered by user is wrong
		else {
			session.setAttribute("userHome", "cancelSuccess");
			try {
				res.sendRedirect("MyTicket.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
