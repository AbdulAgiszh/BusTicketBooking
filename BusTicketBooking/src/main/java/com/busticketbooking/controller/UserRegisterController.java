package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.User;



@WebServlet("/registerpage")
public class UserRegisterController extends HttpServlet{

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
	
		String name=req.getParameter("name");
		System.out.println(name);
		String email=req.getParameter("emailId");
		System.out.println(email);
		long mobile=Long.parseLong(req.getParameter("mobile"));
		System.out.println(mobile);
		String password=req.getParameter("password");
		System.out.println(password);
		LocalDate dob=LocalDate.parse(req.getParameter("dob"));
		System.out.println(dob);
		String gender=req.getParameter("gender");
		System.out.println(gender);
		User userModel=new User(0,name,dob,email,mobile,gender,password,0);
		UserDaoImpl userDao=new UserDaoImpl();
		
		boolean registerFlag=userDao.registrationUser(userModel);
		if(registerFlag) {
			try {
				res.sendRedirect("Login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			System.out.println("not register");
		}
	}
	
}
