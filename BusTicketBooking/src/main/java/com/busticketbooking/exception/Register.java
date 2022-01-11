package com.busticketbooking.exception;

public class Register extends Exception{


	public String getEmailRegisterMessage() {
		return "this account already register";
	}
	

	public String getPhoneRegisterMessage() {
		return "this account already register";
	}
	
}
