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
<title>Insert title here</title>
<style>
         *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
        }
        ul,li{
            list-style: none;
            display: flex;
            margin-left: 15px;
            padding: 70px;
            padding-left: 10px;
            padding-top: 0px;
            margin-top: 15px;
        }
        #nav{
            border: 1px solid blanchedalmond ;
            height: 90px;
            background-color: blanchedalmond;
        }
        #nav a{
            text-decoration: none;
            font-size: 20px;
        }
        
        #signlink {
            display: flex;
            margin-left: 540px;
        }


		.dropdown .dropbtn {
            font-size: 20px;  
            border: none;
            outline: none;
            color: rgb(113, 99, 177);
        }
        .dropbtn{
            font-size: 20px;  
            border: none;
            outline: none;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
  
        }

        .dropdown-content a {
            float: none;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
        
        
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
    </style>
</head>
<body>
    <div id="nav">
        <ul>
            <li><span>Logo</span></li>
            <li><a href="SearchBus.jsp">Bus_Tickets</a></li>
            <li><a href="AboutUs.jsp">About_us</a></li>
            <li><a href="UserProfile.jsp">Profile</a></li>

              <li><div class="dropdown">
                <button class="dropbtn">Ticket 
                </button>
                <div class="dropdown-content">
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
              </div> </li>

            <li><a href="Login.html">SignIn</a></li>
            <li><a href="UserRegister.html">SignUp</a></li>
            </ul>
        </div>

        <div id="balancediv">
            <label for="balance">Current Balance</label>
            <span id="availableamount"><%=userModel1.getUserWallet() %></span> <br><br>
            <label for="clickbutton">Click here to update your wallet</label>
            <button id="btn" name="btn" type="submit"><a href="UpdateWallet.jsp">Deposite</a></button>
        </div>
</body>
</html>