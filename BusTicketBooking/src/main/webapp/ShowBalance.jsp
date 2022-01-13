<%@page import="com.busticketbooking.daoimpl.UserDaoImpl"%>
<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%User userModel=(User)session.getAttribute("userModel"); 
      UserDaoImpl userDao=new UserDaoImpl();
      User userModel1=userDao.getUserDetailsById(userModel.getUserId());
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Wallet</title>
<link rel="stylesheet" href="css/UserNavigationStyle.css">
<style>
        #balancediv{
            border: 1px solid black;
            border-radius: 15px;
            width: 500px;
            padding: 50px;
            margin-top: 100px;
            margin-left: 350px;
        }
        #btn a{
        	text-decoration: none;
            font-size: large;
        }
       #btn{
            height: 45px;
            width: 120px;
            background-color: rgb(129, 168, 252);
            outline: none;
            border: none;
            margin-left: 100px;
            margin-top: 30px;
            cursor: pointer;
        }
        #btn:hover{
            background-color: rgb(247, 112, 112);
        }
        #availableamount{
            font-size: 17px;
            font-style: oblique;
            border-radius: 5px;
            border: 1px solid rgb(238, 225, 225);
            padding: 10px;
            margin-left: 10px;
        }
        #buslogo{
            font-style: italic;
            font-family: cursive;
            font-size: 23px; 
            color: rgb(95, 95, 224);
        }
    </style>
</head>
<body>
    <div id="nav">
            <ul>
                <li><span id="buslogo">BusHub</span></li>
                <li><a href="SearchBus.jsp">Bus_Tickets</a></li>
                <li><a href="AboutUs.jsp">About_us</a></li>
                  <li><div class="dropdown">
                    <button class="dropbtn">Ticket 
                    </button>
                    <div class="dropdown-content">
                      <a href="UserBookingHistory.jsp">Booking History</a>
                      <a href="MyTicket.jsp">My Ticket</a>
                      <a href="CancelTicket.jsp">Cancel Ticket</a>
                    </div>
                  </div> </li>
    
                  <li><div class="dropdown">
                    <button class="dropbtn">Wallet 
                    </button>
                    <div class="dropdown-content">
                      <a href="ShowBalance.jsp">Show Balance</a>
                      <a href="UpdateWallet.jsp">Update Wallet</a>
                    </div>
                  </div> 
                  <li><a href="UserProfile.jsp">Profile</a></li>
                  <li><a href="logout">LogOut</a></li>
                </ul>
        </div>
      <form action="UpdateWallet.jsp">
        <div id="balancediv">
            <label for="balance">Current Balance</label>
            <span id="availableamount"><%=userModel1.getUserWallet() %></span> <br><br>
            <label for="clickbutton">Click here to update your wallet</label>
            <button id="btn" name="btn" type="submit">Deposit</button>
        </div>
        </form>
</body>
</html>