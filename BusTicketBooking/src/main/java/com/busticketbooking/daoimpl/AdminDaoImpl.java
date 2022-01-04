package com.busticketbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.busticketbooking.connection.ConnectionUtill;
import com.busticketbooking.dao.AdminDAO;
import com.busticketbooking.model.Admin;
import com.busticketbooking.model.User;

public class AdminDaoImpl implements AdminDAO {

	public Admin adminLogin(String contact)  {
		
		String loginadmin="select * from admin_details where admin_email='"+contact+"'";
		Connection con;
		Admin adminmodule=null;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(loginadmin);
			ResultSet rs=pstatement.executeQuery();
			
			rs.next() ;
				adminmodule=new Admin(rs.getString(2),rs.getLong(3),rs.getString(4),rs.getString(5));
			
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return adminmodule;
	}
	
	public boolean checkadmin(String contact)  {
		 
		String loginadmin="select * from admin_details where admin_email='"+contact+"'";
		Connection con;
		boolean checkAdminFlag=true;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement ps=con.prepareStatement(loginadmin);
			int i=ps.executeUpdate();
			
			if(i>0) {
				checkAdminFlag= true;
			}
			else {
				checkAdminFlag= false;	
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return checkAdminFlag;
	}
	
	
public void updateAdmin (Admin AdminModel) {
    	
    	String adminUpdate="update admin_details set admin_name=?,admin_contact=?, admin_password=? where admin_email='"+AdminModel.getAdminEmail()+"'";
    	
    	Connection con;
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(adminUpdate);
			
			pstatement.setString(1, AdminModel.getAdminName());
			pstatement.setLong(2, AdminModel.getAdmincontact());
			pstatement.setString(3, AdminModel.getAdminPassword());
			
			pstatement.executeUpdate();
			System.out.println("for "+AdminModel.getAdminEmail()+ "profile is updated !!");
			pstatement.close();
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
    }
	

public List<Admin> viewAdmin(){
    	
    	String adminView="select * from admin_details";
    	
    	Connection con;
    	List<Admin> adminList=new ArrayList<Admin>();
		try {
			con = ConnectionUtill.connectdb();
			PreparedStatement pstatement=con.prepareStatement(adminView);
			
			ResultSet rs=pstatement.executeQuery();
			
			while(rs.next()) {
				Admin adminModel=new Admin(rs.getString(2),rs.getLong(3),rs.getString(4),rs.getString(5));
				adminList.add(adminModel);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return adminList;
		
    }
	



	    
}
