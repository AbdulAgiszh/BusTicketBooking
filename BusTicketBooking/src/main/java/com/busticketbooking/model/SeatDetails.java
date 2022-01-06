package com.busticketbooking.model;

import java.util.Objects;

public class SeatDetails {

	private BookedTickets bookedTickets;
	private Bus bus;
	private User user;
	private int seatNo;
	private String status;
	
	public SeatDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SeatDetails(BookedTickets bookedTickets, Bus bus, User user, int seatNo, String status) {
		super();
		this.bookedTickets = bookedTickets;
		this.bus = bus;
		this.user = user;
		this.seatNo = seatNo;
		this.status = status;
	}

	public BookedTickets getBookedTickets() {
		return bookedTickets;
	}

	public void setBookedTickets(BookedTickets bookedTickets) {
		this.bookedTickets = bookedTickets;
	}

	public Bus getBus() {
		return bus;
	}

	public void setBus(Bus bus) {
		this.bus = bus;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Ticket_Details [bookedTickets=" + bookedTickets + ", bus=" + bus + ", user=" + user + ", seatNo="
				+ seatNo + ", status=" + status + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(bookedTickets, bus, seatNo, status, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SeatDetails other = (SeatDetails) obj;
		return Objects.equals(bookedTickets, other.bookedTickets) && Objects.equals(bus, other.bus)
				&& seatNo == other.seatNo && Objects.equals(status, other.status) && Objects.equals(user, other.user);
	}
	
	
}
