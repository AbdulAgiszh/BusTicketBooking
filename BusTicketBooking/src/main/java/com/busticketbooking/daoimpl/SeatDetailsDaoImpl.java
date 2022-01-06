package com.busticketbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.Bus;
import com.busticketbooking.model.SeatDetails;
import com.busticketbooking.model.User;

public class SeatDetailsDaoImpl {

	public boolean insertSeat(SeatDetails seatDetails) {
		String seatInsert = "insert into seat_details (booking_id,bus_id,user_id,seat_no,seat_status) values (?,?,?,?,?)"; 
		
		//,seat_no
		Connection con;
		int result=0;
		
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(seatInsert);
			
			pstatement.setInt(1, seatDetails.getBookedTickets().getBookingId());
			pstatement.setInt(2, seatDetails.getUser().getUserId());
			pstatement.setInt(3, seatDetails.getBus().getBusId());
			pstatement.setInt(4, seatDetails.getSeatNo());
			pstatement.setString(5, seatDetails.getStatus());
		
			result=pstatement.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} catch (SQLException e) {
			e.getMessage();
		}
		return result>0;
	}
	
	public boolean ticketexist(int ticketCountEntered,String ticketRandomNumber,Bus bus,User user) throws ClassNotFoundException, SQLException {
//		System.out.println(seat+busid+userid);
		
	Connection	con = ConnectionUtill.connectdb();
	String query = "select * from ticket_details where seat_no=?  and bus_id=? and status in 'yes'";
	String query1 = "insert into ticket_details(ticket_no,user_id,bus_id,seat_no) values(?,?,?,?)";
	PreparedStatement pstatement=con.prepareStatement(query);
	int busseat = bus.getTotalseat();
	int seatcount = 0;
	int seatno = 1;
	if(busseat >= 0) {
	while(seatcount < ticketCountEntered) {
	
		pstatement.setInt(1, seatno);
		pstatement.setInt(2, bus.getBusId());
		ResultSet rs = pstatement.executeQuery();
		if(rs.next()) {
			
		}
		else {
			
			PreparedStatement pstatement1=con.prepareStatement(query1);
			
			pstatement1.setString(1, ticketRandomNumber);
			pstatement1.setInt(2, user.getUserId());
			pstatement1.setInt(3, bus.getBusId());
			pstatement1.setInt(4, seatno);
			pstatement1.executeUpdate();
			pstatement1.executeUpdate("commit");
			seatcount++;
		}
		
		seatno++;
	}
	
	if(seatcount == ticketCountEntered) {
		return true;
	}}else {
		System.out.println("bus out of seat!!");
		return false;
	}
	
	return false;
	}
	
	
	public boolean cancelSeatDetails(String ticketNo) throws ClassNotFoundException, SQLException {
		String seatCancel="delete from ticket_details where ticket_no=?";
		
		Connection	con = ConnectionUtill.connectdb();
		int result=0;
		PreparedStatement pstatement=con.prepareStatement(seatCancel);
		
		pstatement.setString(1, ticketNo);
		result=pstatement.executeUpdate();
		
		return result>0;
		
	}
}
