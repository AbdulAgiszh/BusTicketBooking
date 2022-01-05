package com.busticketbooking.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busticketbooking.daoimpl.BusDaoImpl;
import com.busticketbooking.model.Bus;


@WebServlet("/updateBusPage")
public class UpdateBusController extends HttpServlet  {
		
		BusDaoImpl busDao=new BusDaoImpl();
		
		public void service(HttpServletRequest req,HttpServletResponse res) {
			HttpSession session=req.getSession();
			
			Bus busModel=(Bus) session.getAttribute("busModell");
			
			int busId=busModel.getBusId();
			System.out.println(busId);
			
			int busNo=Integer.parseInt(req.getParameter("busNo"));
			System.out.println(busNo);
			int operatorId=Integer.parseInt(req.getParameter("operatorId"));
			System.out.println(operatorId);
			String busCategory=req.getParameter("busCategory");
			System.out.println(busCategory);
			String fromCity=req.getParameter("fromCity");
			System.out.println("fromCity");
			String toCity=req.getParameter("toCity");
			System.out.println(toCity);
			LocalDateTime departure=LocalDateTime.parse(req.getParameter("departure"));
			System.out.println(departure);
			LocalDateTime arrival=LocalDateTime.parse(req.getParameter("arrival"));
			System.out.println(arrival);
			int seaterFare=Integer.parseInt(req.getParameter("seaterFare"));
			System.out.println(seaterFare);
			int totalSeat=Integer.parseInt(req.getParameter("totalSeat"));
			System.out.println(totalSeat);
			String status=req.getParameter("seatStatus");
			System.out.println(status);	
			
			Bus bus=new Bus(busId,busNo,operatorId,busCategory,fromCity,toCity,departure,arrival,seaterFare,totalSeat,status);
			boolean busUpdateFlag=busDao.updateBus(bus);
			
			if(busUpdateFlag) {
				try {
					session.setAttribute("AdminHome", "UpdateBusSession");
					req.getRequestDispatcher("BusList.jsp").forward(req,res);
				} catch (ServletException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
		}
}
