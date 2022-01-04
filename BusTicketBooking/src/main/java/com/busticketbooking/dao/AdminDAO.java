package com.busticketbooking.dao;

import java.util.List;

import com.busticketbooking.model.Admin;

public interface AdminDAO {

	public Admin adminLogin(String contact) ;
	
	public boolean checkadmin(String contact);
	
	public void updateAdmin (Admin AdminModel);
	
	public List<Admin> viewAdmin();
	
	
}
