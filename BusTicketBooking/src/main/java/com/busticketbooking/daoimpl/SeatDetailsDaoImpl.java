package com.busticketbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.model.BookedTickets;
import com.busticketbooking.model.SeatDetails;

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
}
