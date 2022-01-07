package com.busticketbooking.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BookedTicketsDaoImpl;
import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.daoimpl.SeatDetailsDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.User;

@WebServlet("/cancelticketservlet")
public class CancelTicketController extends HttpServlet {

	DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("dd-mm-yyyy");
	BookedTicketsDaoImpl bookTicketsDao = new BookedTicketsDaoImpl();
	BusDaoImpl busDao = new BusDaoImpl();
	UserDaoImpl userDao = new UserDaoImpl();
	SeatDetailsDaoImpl seatDetails = new SeatDetailsDaoImpl();
	BookedTickets bookedTicketsModel = new BookedTickets();

	// to get current date
	private static Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}

	public void service(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		// this is user session created when user logged in
		User userModel = (User) session.getAttribute("userModel");
		User userModel1 = userDao.getUserDetailsById(userModel.getUserId());

		// ticket number entered by user in cancel ticket jsp
		String ticketNo = req.getParameter("tickettext");

		// to find booked tickets pojo class by using ticket no entered by user in
		// cancel ticket jsp
		bookedTicketsModel = bookTicketsDao.findBookedTicketsObjectDetails(ticketNo);
		if (bookedTicketsModel != null) {

			// to update seat by using bus object from bookedtickets model
			int totalSeatAlreadyAvailable = bookedTicketsModel.getBusModel().getTotalseat();
			int seatToUpdate = totalSeatAlreadyAvailable + bookedTicketsModel.getTicketCount();

			// update seat to bus constructor
			Bus bus = new Bus(bookedTicketsModel.getBusModel().getBusId(), bookedTicketsModel.getBusModel().getBusNo(),
					bookedTicketsModel.getBusModel().getOperatorId(), bookedTicketsModel.getBusModel().getBusCategory(),
					bookedTicketsModel.getBusModel().getFromCity(), bookedTicketsModel.getBusModel().getToCity(),
					bookedTicketsModel.getBusModel().getDeparture(), bookedTicketsModel.getBusModel().getArrival(),
					bookedTicketsModel.getBusModel().getSeaterFare(), seatToUpdate,
					bookedTicketsModel.getBusModel().getSeatStatus());
			boolean busSeatUpdateFlag = busDao.updateSeatCount(bus);

			// to convert local date to date format
			LocalDate date = bookedTicketsModel.getDepartureDate().toLocalDate();
			Date localDepartureDate = java.sql.Date.valueOf(date);

			// checking seat count updated
			if (busSeatUpdateFlag) {

				if (localDepartureDate.after(getCurrentDate())) {

					if (!(bookedTicketsModel.getBookingStatus().equals("Cancelled"))) {

						// to reduce fine amount in 15% in userobject using updatedao
						int fineFare = (bookedTicketsModel.getTotalPrice() / 100) * 15;
						int refundFare = bookedTicketsModel.getTotalPrice() - fineFare;
						int refundPrice = bookedTicketsModel.getUserModel().getUserWallet() + refundFare;
						boolean userUpdateWalletFlag = userDao.updateWallet(refundPrice,
								bookedTicketsModel.getUserModel().getUserContact());

						if (userUpdateWalletFlag) {
							// to cancel the ticket(changing status) in bookedticket class using
							// cancelticketdao
							boolean ticketCancelFlag = bookTicketsDao.cancelTicket(ticketNo);

							// to delete the ticketseats from ticket details table using ticket no and seat
							try {
								seatDetails.cancelSeatDetails(ticketNo);
							} catch (ClassNotFoundException e1) {
								System.out.println(e1.getMessage());
							} catch (SQLException e1) {
								System.out.println(e1.getMessage());
							}

							if (ticketCancelFlag) {
								// session.setAttribute("ticketdetailsresult", bookTicketsList);
								try {
									session.setAttribute("userHome", "cancelSuccess");
									res.sendRedirect("CancelTicket.jsp");
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							}
						}
					}

					else {
						session.setAttribute("userHome", "TicketAlreadyCancel");
						try {
							res.sendRedirect("CancelTicket.jsp");
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

				} else {
					session.setAttribute("userHome", "BusAlreadyDeparture");
					try {
						res.sendRedirect("CancelTicket.jsp");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

		}
		// if ticketnumber entered by user is wrong
		else {
			session.setAttribute("userHome", "wrongTicketNumber");
			try {
				res.sendRedirect("CancelTicket.jsp");
				System.out.println("wrongsession");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

//
//if (local.after(getcurrentdate())){
//