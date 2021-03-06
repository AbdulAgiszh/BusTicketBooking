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
import com.busticketbooking.exception.LoginPasswordException;
import com.busticketbooking.exception.LoginUserNameException;
import com.busticketbooking.model.Admin;
import com.busticketbooking.model.User;

@WebServlet("/loginWay")
public class LoginController extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();

		String loginId = req.getParameter("name");
		String password = req.getParameter("password");

		AdminDaoImpl adminDao = new AdminDaoImpl();
		UserDaoImpl userDao = new UserDaoImpl();
		Admin adminModel;
		User userModel = new User();

		// admin Login
		if (loginId.endsWith("admin@gmail.com")) {
			boolean adminCheckFlag;
			adminCheckFlag = adminDao.checkadmin(loginId);
			try {
				if (adminCheckFlag) {
					adminModel = adminDao.adminLogin(loginId);
					if (adminModel.getAdminPassword().equals(password)) {
						try {
							res.sendRedirect("AdminHome.jsp");
							session.setAttribute("AdminHome", "HomeSession");
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					} else {
						throw new LoginPasswordException();
					}
				} else {
					throw new LoginUserNameException();
				}
			} catch (LoginUserNameException e) {
				session.setAttribute("erroruserid", e.getUserNameLoginMessage());
				try {
					res.sendRedirect("Login.jsp");
				} catch (IOException e1) {
					System.out.println(e1.getMessage());
				}
			} catch (LoginPasswordException e) {
				session.setAttribute("erroruserid", e.getPasswordLoginMessage());
				try {
					res.sendRedirect("Login.jsp");
				} catch (IOException e1) {
					System.out.println(e1.getMessage());
				}
			}
		} else if (loginId.contains("admin@gmail.com") == false && loginId.matches("[0-9]+") == false) {
			try {
				throw new LoginUserNameException();
			} catch (LoginUserNameException e) {
				session.setAttribute("erroruserid", e.getUserNameLoginMessage());
				try {
					res.sendRedirect("Login.jsp");
				} catch (IOException e1) {
					System.out.println(e1.getMessage());
				}
			}
		}

		// userLogin
		else {
			boolean userCheckFlag;
			long userId = Long.parseLong(loginId);
			userCheckFlag = userDao.checkUser(userId);
			try {
				if (userCheckFlag) {
					userModel = userDao.loginUser(userId);

					if (userModel.getUserPassword().equals(password)) {
						try {
							session.setAttribute("userModel", userModel);
							session.setAttribute("userHome", "loginSession");
							res.sendRedirect("SearchBus.jsp");
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					} else {
						throw new LoginPasswordException();
					}

				} else {
					throw new LoginUserNameException();
				}
			} catch (LoginUserNameException e) {
				session.setAttribute("erroruserid", e.getUserNameLoginMessage());
				try {
					res.sendRedirect("Login.jsp");
				} catch (IOException e1) {
					System.out.println(e1.getMessage());
				}

			} catch (LoginPasswordException e) {
				session.setAttribute("erroruserid", e.getPasswordLoginMessage());
				try {
					res.sendRedirect("Login.jsp");
				} catch (IOException e1) {
					System.out.println(e1.getMessage());
				}
			}
		}
	}
}
