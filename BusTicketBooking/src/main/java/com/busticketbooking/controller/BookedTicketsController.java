package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BookedTicketsDaoImpl;
import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.User;

@WebServlet("/confirmBooking")
public class BookedTicketsController extends HttpServlet {

	
	BusDaoImpl busDao=new BusDaoImpl();
	UserDaoImpl userDao=new UserDaoImpl();
	BookedTicketsDaoImpl bookTicketsDao=new BookedTicketsDaoImpl();
	
public void service(HttpServletRequest req,HttpServletResponse res) {
		
	    HttpSession session=req.getSession();
		User user1=(User)session.getAttribute("userModel");
		User user=userDao.getUserDetailsById(user1.getUserId());
		
		int currentBusId2=(int) session.getAttribute("currentBusId");
	    Bus busModel=busDao.findBusDetailsUsingID(currentBusId2);

	    
	    String randomNo=req.getParameter("randomnumber");
	    System.out.println(randomNo);
		int ticketCount=Integer.parseInt(req.getParameter("noofseats"));
		int totalPrice=Integer.parseInt(req.getParameter("totalFair"));
		
		if(user.getUserWallet()>=totalPrice) {
		
		int updateAmountInWallet=user.getUserWallet()-totalPrice;
		int updateBusSeat=busModel.getTotalseat()-ticketCount;
		
		Bus busModel2=new Bus(busModel.getBusId(),busModel.getBusNo(),busModel.getOperatorId(),busModel.getBusCategory(),busModel.getFromCity(),
				busModel.getToCity(),busModel.getDeparture(),busModel.getArrival(),busModel.getSeaterFare(),updateBusSeat,busModel.getSeatStatus());
		boolean updateSeatFlag= busDao.updateSeatCount(busModel2);
		User userModel2=new User(user.getUserId(),user.getUserName(),user.getUserDOB(),user.getUserEmail(),user.getUserContact(),
				user.getUserGender(),user.getUserPassword(),updateAmountInWallet);
		
		
		BookedTickets bookTickets=new BookedTickets(0,randomNo,userModel2,busModel,0,busModel.getDeparture(),"",ticketCount,totalPrice,"Success");
		System.out.println("datetime " +busModel.getDeparture());
		
		boolean ticketInsertFlag=bookTicketsDao.insertBookedTickets(bookTickets);
		session.setAttribute("FinalBookTicketsModel", bookTickets);
		session.setAttribute("FinalBusModel", busModel2);  
	    session.setAttribute("FinalUserModel", userModel2);
		
		if(ticketInsertFlag) {
			try {
				res.sendRedirect("BookSuccess.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		
		}
		else {
			try {
				session.setAttribute("userWallet", "insufficient");
				res.sendRedirect("UpdateWallet.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		
		
		
		
	}
}
