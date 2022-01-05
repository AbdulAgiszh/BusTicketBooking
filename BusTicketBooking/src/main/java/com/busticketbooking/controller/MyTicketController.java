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
import com.busticketbooking.model.BookedTickets;

@WebServlet("/myticketservlet")
public class MyTicketController extends HttpServlet  {

	BookedTicketsDaoImpl bookTicketsDao=new BookedTicketsDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		List<BookedTickets> bookTicketsList=new ArrayList<BookedTickets>();
		
		String ticketNo=req.getParameter("tickettext");
		bookTicketsList=bookTicketsDao.findBookedTicketsDetails(ticketNo);
    	if(bookTicketsList!=null) {
    		session.setAttribute("ticketdetailsresult", bookTicketsList);
    		try {
				res.sendRedirect("MyTicket.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	
		
	}
}
