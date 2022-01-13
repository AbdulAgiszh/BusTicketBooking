<%@page import="com.busticketbooking.daoimpl.UserDaoImpl"%>
<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@page import="com.busticketbooking.daoimpl.BookedTicketsDaoImpl"%>
<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%User userModel=(User)session.getAttribute("userModel"); 
      UserDaoImpl userDao=new UserDaoImpl();
      User userModel1=userDao.getUserDetailsById(userModel.getUserId());%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancel Ticket</title>
<link rel="stylesheet" href="css/UserNavigationStyle.css">
<style>
        legend{
            font-size: xx-large;
            text-align: center;
            
        }
        #invoicediv {
            border:  solid black;
            padding: 30px;
        }
        #tickettext {
            border-top: none;
            border-left: none;
            border-right: none;
        }
        #tickettext{
            height: 30px;    
            font-size: 18px;
            outline: none;
            color: rgb(24, 11, 7);
            width: 200px;
            text-align: center;
        }
        #traveltable tr td{
            padding: 25px;
            
        }
        #ticketnotable{
            padding: 35px;
            margin-left: 30px;
        }
        #traveltable{
            margin-left: 220px;
        }
        #invoicediv {
    		border: solid black;
   			 padding: 18px;
    		height: 200px;
    		width: 640px;
    		margin-left: 350px;
    		margin-top: 100px;
    		}
        #deductedmessage{
            position: absolute;
            color: red;
            font-size: 17px;
            margin-left: 58px;
            margin-top: -20px;
        }
        #btnticket{
            margin-left: 40px;
            
        }
        #btnticket{
            height: 45px;
            width: 120px;
            background-color: rgb(129, 168, 252);
            outline: none;
            border: none;
            color: blanchedalmond;
            text-decoration: none;
            font-size: large;
        }
        #btnticket:hover{
            background-color: rgb(247, 112, 112);
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

	<%String cancelMessage=(String)session.getAttribute("userHome");
    if(cancelMessage.equals("cancelSuccess")){
    	session.setAttribute("userHome", "homeSession");
    	%>
    	<script>
    	alert("Ticket cancelled successfully");
    	alert("Your (85%)refund amount will be credit with your wallet with in 7 working days ")
    </script>
    
    <%}
    else if(cancelMessage.equals("wrongTicketNumber")){
    	session.setAttribute("userHome", "homeSession");
    	%>
    	<script>
    	alert("Oops!! Wrong Ticket Number Please Enter correct ticket number....");
    </script>

	<%} 
	else if(cancelMessage.equals("BusAlreadyDeparture")){
    	session.setAttribute("userHome", "homeSession");%>
    	<script>
    	alert("Bus departure date is ended..you can't cancel the ticket");
    </script>
    <%}
    else if(cancelMessage.equals("TicketAlreadyCancel")){
    	session.setAttribute("userHome", "homeSession");%>
    	<script>
    	alert("Oops This ticket was already cancelled by you");
    </script>
    <%} %>
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

    <fieldset id="invoicediv">
        <legend>CancelTicket</legend>
        <form action="cancelticketservlet">
        <table id="ticketnotable">
            <tr>
                <td>TICKET NO :</td>
                <td><input id="tickettext" name="tickettext" type="text" placeholder="Enter the ticket number" autofocus autocomplete="off" required></td>
                <td><button id="btnticket" type="submit" >Submit</button></td>
            </tr>
        </table>
        <label for="deductedmessage" id="deductedmessage">If you want to cancel your ticket(15% amount will be deducted)</label>
        </form>
</fieldset>
<script type="text/javascript">

</script>
</body>
</html>