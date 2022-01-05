package com.busticketbooking.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.AdminDaoImpl;
import com.busticketbooking.daoimpl.UserDaoImpl;
import com.busticketbooking.model.Admin;
import com.busticketbooking.model.User;


@WebServlet("/loginWay")
public class LoginController extends HttpServlet{

	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		HttpSession session=req.getSession();
		
		String loginId=req.getParameter("name");
		String password=req.getParameter("password");
		
//		System.out.println(loginId);
//		System.out.println(password);
		AdminDaoImpl adminDao=new AdminDaoImpl();
		UserDaoImpl userDao=new UserDaoImpl();
		Admin adminModel;
		User userModel=new User();
		
		//admin Login
		if(loginId.endsWith("admin@gmail.com")) {
			boolean adminCheckFlag;
			adminCheckFlag=adminDao.checkadmin(loginId);
			if(adminCheckFlag) {
				adminModel=adminDao.adminLogin(loginId);
				if(adminModel.getAdminPassword().equals(password)) {
					try {
						res.sendRedirect("AdminHome.jsp");
						session.setAttribute("AdminHome", "HomeSession");
					} catch (IOException e) {
						System.out.println(e.getMessage());
					}
				}
				else
					{
						session.setAttribute("erroruserid", "password is incorrect");
						try {
							req.getRequestDispatcher("Login.jsp").forward(req,res);
						} catch (ServletException e) {
							System.out.println(e.getMessage());
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					}
			}
			else {
				session.setAttribute("erroruserid", "user name mismatch");
				try {
					req.getRequestDispatcher("Login.jsp").forward(req,res);
				} catch (ServletException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
			}
		else if (loginId.endsWith("admin@gmail.com") == false && loginId.matches("[0-9]+") == false) {
			session.setAttribute("erroruserid", "user name mismatch");
			try {
				req.getRequestDispatcher("Login.jsp").forward(req,res);
			} catch (ServletException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		
		//userLogin
		else {
			boolean userCheckFlag;
			long userId=Long.parseLong(loginId);
			userCheckFlag=userDao.checkUser(userId);
			if(userCheckFlag) {
				userModel=userDao.loginUser(userId);
				System.out.println(userModel.getUserPassword());
				
				if(userModel.getUserPassword().equals(password)) {
					try {
						session.setAttribute("userModel", userModel);
						session.setAttribute("userHome", "homeSession");
						res.sendRedirect("SearchBus.jsp");
					} catch (IOException e) {
						System.out.println(e.getMessage());
					}
				}
				else
				{
					session.setAttribute("erroruserid", "password is incorrect");
					try {
						req.getRequestDispatcher("Login.jsp").forward(req,res);
					} catch (ServletException e) {
						System.out.println(e.getMessage());
					} catch (IOException e) {
						System.out.println(e.getMessage());
					}
				}
			}
			else {
				session.setAttribute("erroruserid", "user name mismatch");
				try {
					req.getRequestDispatcher("Login.jsp").forward(req,res);
				} catch (ServletException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
					

	}
	}
}
	



//HttpSession session=req.getSession();
//session.setAttribute("error", "user name and password mismatch");
//req.getRequestDispatcher("login.jsp").forward(req,res);
//<% String error=(String)session.getAttribute("error");
//if(error!=null) {%>
//<p ><%=session.getAttribute("error") %></p>
//<%} session.removeAttribute("error"); %>














