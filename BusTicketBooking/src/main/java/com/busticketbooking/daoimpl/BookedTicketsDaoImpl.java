package com.busticketbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.dao.BookedTicketsDAO;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.User;

public class BookedTicketsDaoImpl implements BookedTicketsDAO {
	
	BusDaoImpl busDao=new BusDaoImpl();
	UserDaoImpl userDao=new UserDaoImpl();
	SimpleDateFormat dateFormat=new SimpleDateFormat("dd-mm-yyyy");
	DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	
	
	public boolean insertBookedTickets(BookedTickets bookedTicketsModel) {
		String ticketsInsert = "insert into Booked_tickets (ticket_no,user_id,bus_id,departure_date,ticket_count,total_price,payment_status) values (?,?,?,?,?,?,?)"; 
		String updateWallet = "update user_details set user_wallet=? where user_id=?";

		Connection con;
		int result=0;
		
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(ticketsInsert);
			PreparedStatement pstatement1=con.prepareStatement(updateWallet);
			pstatement.setString(1, bookedTicketsModel.getTicketNo());
			pstatement.setInt(2, bookedTicketsModel.getUserModel().getUserId());
			pstatement.setInt(3, bookedTicketsModel.getBusModel().getBusId());
			Timestamp departureDateTime = Timestamp.valueOf(bookedTicketsModel.getBusModel().getDeparture());
			pstatement.setTimestamp(4, departureDateTime);
			pstatement.setInt(5, bookedTicketsModel.getTicketCount());
			//pstatement.setString(5, bookedTicketsModel.getSeatNo());
			pstatement.setInt(6, bookedTicketsModel.getTotalPrice());
			pstatement.setString(7, bookedTicketsModel.getPaymentStatus());
			
			pstatement1.setInt(1, bookedTicketsModel.getUserModel().getUserWallet());
			pstatement1.setInt(2, bookedTicketsModel.getUserModel().getUserId());
			
			result=pstatement.executeUpdate();
			result=pstatement1.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}
		return result>0;
	}
		
		
//
//	public List<BookedTickets> listBookingTickets(){
//		String bookingList="select "
//	}
//	
	
	
	public int findBookingId(BookedTickets bookedTicketsModel) {
		
		String bookingIdFinder="select booking_id from booked_tickets where user_id='"+bookedTicketsModel.getUserModel().getUserId()+"' and to_timestamp(departure_date,'YYYY-MM-DD HH24:MI')='"+bookedTicketsModel.getDepartureDate()+"' ";
		Connection con;
		PreparedStatement pstatement;
		int bookingId = 0;
		try {
			con=ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(bookingIdFinder);
			ResultSet rs=pstatement.executeQuery();
			if(rs.next()) {
				bookingId=rs.getInt(1);
			}
			
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}
		return bookingId;
		
	}

	
	//to show all booking for particular user
	public List<BookedTickets> getBookingDetailsForCurrentUser(User userModel) {
		String query="select * from booked_tickets where user_id='"+userModel.getUserId()+"'";
		
		Connection con;
		PreparedStatement pstatement;
		ResultSet rs;
		Bus busModel=null;
		User userModel1=null;
		List<BookedTickets> bookingList=new ArrayList<BookedTickets>();
		
		try {
			con=ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(query);
			rs=pstatement.executeQuery();
			
			while(rs.next()) {
				busModel=busDao.findBusDetailsUsingID(rs.getInt(3));
				userModel1=userDao.getUserDetailsById(userModel.getUserId());
				BookedTickets bookedTicketsModel=new BookedTickets(rs.getInt(1),rs.getString(2),userModel1,busModel,rs.getDate(5).toLocalDate(),rs.getTimestamp(6).toLocalDateTime(),rs.getInt(7),rs.getInt(8),rs.getString(9),rs.getString(10));
				bookingList.add(bookedTicketsModel);
				
			}	
				
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}
		
		return bookingList;
	}
	
	
	//user for invoice to collect booked tickets full details by using booking id or booking number
	public List<BookedTickets> findBookedTicketsDetails(String bookingId) {
		String findTicketDetails="select * from booked_tickets where ticket_no='"+bookingId+"'";
		
		Connection con;
		PreparedStatement pstatement;
		ResultSet rs = null;
		Bus busModel=null;
		User userModel=null;
		List<BookedTickets> bookTickets=new ArrayList<BookedTickets>();
		BookedTickets bookedTicketsModel=null;
		try {
			con=ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(findTicketDetails);
			rs=pstatement.executeQuery();
			
			while(rs.next()) {				
				
				busModel=busDao.findBusDetailsUsingID(rs.getInt(4));
				userModel=userDao.getUserDetailsById(rs.getInt(3));
				bookedTicketsModel=new BookedTickets(rs.getInt(1),rs.getString(2),userModel,busModel,rs.getDate(5).toLocalDate(),rs.getTimestamp(6).toLocalDateTime(),rs.getInt(7),rs.getInt(8),rs.getString(9),rs.getString(10));
				bookTickets.add(bookedTicketsModel);
			}	
			
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}
		return bookTickets;
	}
	
	
	
	
	
	
	public boolean cancelTicket(String ticketNo) {
		String ticketCancel="update booked_tickets set booking_status='Cancelled',payment_status='refunded' where ticket_no='"+ticketNo+"'";
		int result = 0;
		try {
			Connection con=ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(ticketCancel);
			result=pstatement.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
			System.out.println("invalid Ticket number");
		}
		return result>0;
		
	}
	
	
	public ResultSet showlistAdmin() {
		
        String showQuery="select * from booked_tickets";
		
		Connection con;
		PreparedStatement pstatement;
		ResultSet rs = null;
		Bus busModel=null;
		User userModel=null;
		List<BookedTickets> bookingListAdmin=new ArrayList<BookedTickets>();
		
		try {
			con=ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(showQuery);
			rs=pstatement.executeQuery();
			
//			while(rs.next()) { 
//				busModel=busDao.findBusDetailsUsingID(rs.getInt(3));
//				userModel=userDao.getUserDetailsById(rs.getInt(2));
//				BookedTickets bookedTicketsModel=new BookedTickets(rs.getInt(1),userModel,busModel,rs.getDate(4).toLocalDate(),rs.getTimestamp(6).toLocalDateTime(),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getInt(10),rs.getString(11));
//				bookingListAdmin.add(bookedTicketsModel);
//			
//			}	
			return rs;
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}
		
		return rs;
	}

	
	public BookedTickets findBookedTicketsObjectDetails(String bookingId) {
		String findTicketDetails="select * from booked_tickets where ticket_no='"+bookingId+"'";
		
		Connection con;
		PreparedStatement pstatement;
		ResultSet rs = null;
		Bus busModel=null;
		User userModel=null;
		BookedTickets bookedTicketsModel=null;
		try {
			con=ConnectionUtill.connectdb();
			pstatement=con.prepareStatement(findTicketDetails);
			rs=pstatement.executeQuery();
			
			while(rs.next()) {				
				
				busModel=busDao.findBusDetailsUsingID(rs.getInt(4));
				userModel=userDao.getUserDetailsById(rs.getInt(3));
				bookedTicketsModel=new BookedTickets(rs.getInt(1),rs.getString(2),userModel,busModel,rs.getDate(5).toLocalDate(),rs.getTimestamp(6).toLocalDateTime(),rs.getInt(7),rs.getInt(8),rs.getString(9),rs.getString(10));
			}	
			return bookedTicketsModel;
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}
		return bookedTicketsModel;
	}
	}
	
	
	

