<%@page import="com.busticketbooking.model.User"%>
<%@page import="com.busticketbooking.daoimpl.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%User userModel=(User)session.getAttribute("userModel"); 
    UserDaoImpl userDao=new UserDaoImpl();
    User userModel1=userDao.getUserDetailsById(userModel.getUserId());
    
    int amountEntered=Integer.parseInt(request.getParameter("amountentered"));
    int totalAmount=amountEntered+userModel1.getUserWallet();
    userDao.updateWallet(totalAmount, userModel.getUserContact());
    
    
    User userModel2=new User(userModel1.getUserId(),userModel1.getUserName(),userModel1.getUserDOB(),userModel1.getUserEmail(),
  		  userModel1.getUserContact(),userModel1.getUserGender(),userModel1.getUserPassword(),totalAmount);
    session.setAttribute("user", userModel2);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Hub</title>
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
                  <li><a href="logout.jsp">LogOut</a></li>
                </ul>
        </div>
        <script>
            alert("Amount Successfully added to your wallet");
        </script>
</body>
</html>