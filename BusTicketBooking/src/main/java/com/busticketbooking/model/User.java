package com.busticketbooking.model;

import java.time.LocalDate;
import java.util.Objects;

public class User {

	
	private int userId;
	private String userName;
	private LocalDate userDOB;
	private String userEmail;
	private long userContact;
	private String userGender;
	private String userPassword;
	private int userWallet;
	private String userStatus;
	
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(int userId, String userName,LocalDate userDOB, String userEmail, long userContact,String userGender, 
			String userPassword, int userWallet) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userDOB = userDOB;
		this.userEmail = userEmail;
		this.userContact = userContact;
		this.userGender = userGender;
		this.userPassword = userPassword;
		this.userWallet = userWallet;
	}



	public int getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public LocalDate getUserDOB() {
		return userDOB;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public long getUserContact() {
		return userContact;
	}

	public String getUserGender() {
		return userGender;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public int getUserWallet() {
		return userWallet;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserDOB(LocalDate userDOB) {
		this.userDOB = userDOB;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setUserContact(long userContact) {
		this.userContact = userContact;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public void setUserWallet(int userWallet) {
		this.userWallet = userWallet;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}




	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userDOB=" + userDOB + ", userEmail=" + userEmail
				+ ", userContact=" + userContact + ", userGender=" + userGender + ", userPassword=" + userPassword
				+ ", userWallet=" + userWallet + ", userStatus=" + userStatus + "]";
	}




	@Override
	public int hashCode() {
		return Objects.hash(userContact, userDOB, userEmail, userGender, userId, userName, userPassword, userStatus,
				userWallet);
	}




	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return userContact == other.userContact && Objects.equals(userDOB, other.userDOB)
				&& Objects.equals(userEmail, other.userEmail) && Objects.equals(userGender, other.userGender)
				&& userId == other.userId && Objects.equals(userName, other.userName)
				&& Objects.equals(userPassword, other.userPassword) && Objects.equals(userStatus, other.userStatus)
				&& userWallet == other.userWallet;
	
	
	
	}
	
	
}
