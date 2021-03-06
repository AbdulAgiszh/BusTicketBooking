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
import com.busticketbooking.exception.BusDepartureDateEnded;
import com.busticketbooking.exception.TicketAlreadyCancel;
import com.busticketbooking.exception.WrongTicketNumber;
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

	public void service(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();

		// ticket number entered by user in cancel ticket jsp
		String ticketNo = req.getParameter("tickettext");

		// to find booked tickets pojo class by using ticket no entered by user in cancel ticket JSP
		bookedTicketsModel = bookTicketsDao.findBookedTicketsObjectDetails(ticketNo);

		try {
			// to check ticket number entered by user is correct or not
			if (bookedTicketsModel != null) {

				LocalDate date = bookedTicketsModel.getDepartureDate().toLocalDate();
				boolean resultCheck = bookTicketsDao.dateChecking(ticketNo, date);

				// to check whether departure date is finished or not
				if (resultCheck) {

					if (!(bookedTicketsModel.getBookingStatus().equals("Cancelled"))) {

						// to update seat by using bus object from bookedTickets model
						int totalSeatAlreadyAvailable = bookedTicketsModel.getBusModel().getTotalseat();
						int seatToUpdate = totalSeatAlreadyAvailable + bookedTicketsModel.getTicketCount();

						// update seat to bus constructor
						Bus bus = new Bus(bookedTicketsModel.getBusModel().getBusId(),
								bookedTicketsModel.getBusModel().getBusNo(),
								bookedTicketsModel.getBusModel().getOperatorId(),
								bookedTicketsModel.getBusModel().getBusCategory(),
								bookedTicketsModel.getBusModel().getFromCity(),
								bookedTicketsModel.getBusModel().getToCity(),
								bookedTicketsModel.getBusModel().getDeparture(),
								bookedTicketsModel.getBusModel().getArrival(),
								bookedTicketsModel.getBusModel().getSeaterFare(), seatToUpdate,
								bookedTicketsModel.getBusModel().getSeatStatus());
						boolean busSeatUpdateFlag = busDao.updateSeatCount(bus);

						// checking seat count updated
						if (busSeatUpdateFlag) {

							// to reduce fine amount in 15% in userObject using updateDao
							double fineFare = (bookedTicketsModel.getTotalPrice() / 100) * 15;
							double refundFare = bookedTicketsModel.getTotalPrice() - fineFare;
							double refundPrice = bookedTicketsModel.getUserModel().getUserWallet() + refundFare;
							boolean userUpdateWalletFlag = userDao.updateWallet(refundPrice,
									bookedTicketsModel.getUserModel().getUserContact());

							if (userUpdateWalletFlag) {

								// to cancel the ticket(changing status) in bookedTicket class using cancelTicketdao
								boolean ticketCancelFlag = bookTicketsDao.cancelTicket(ticketNo);

								// to delete the ticketSeats from ticket details table using ticket no and seat
								try {
									seatDetails.cancelSeatDetails(ticketNo);
								} catch (ClassNotFoundException e1) {
									System.out.println(e1.getMessage());
								} catch (SQLException e1) {
									System.out.println(e1.getMessage());
								}

								if (ticketCancelFlag) {
									try {
										session.setAttribute("userHome", "cancelSuccess");
										res.sendRedirect("CancelTicket.jsp");
									} catch (IOException e) {
										e.printStackTrace();
									}
								}
							}
						}
					}
					// already cancel
					else {
						throw new TicketAlreadyCancel();
					}
				} else {
					throw new BusDepartureDateEnded();
				}
			}

			// if ticketNumber entered by user is wrong
			else {
				throw new WrongTicketNumber();
			}
		} catch (WrongTicketNumber t) {
			session.setAttribute("WrongNumber", t.getWrongNumber());
			try {
				res.sendRedirect("CancelTicket.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (TicketAlreadyCancel t1) {
			session.setAttribute("AlreadyCancel", t1.getAlreadyCancelMessage());
			try {
				res.sendRedirect("CancelTicket.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (BusDepartureDateEnded b) {
			session.setAttribute("DateEnded", b.getDepartureMessage());
			try {
				res.sendRedirect("CancelTicket.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
