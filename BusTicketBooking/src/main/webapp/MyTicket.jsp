
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/UserNavigationStyle.css">
<title>Invoice</title>
    <style>

        #invoicediv legend{
            font-size: xx-large;
            text-align: center;
            
        }
        #invoicediv {
    		border: solid black;
   			 padding: 18px;
    		height: 200px;
    		width: 640px;
    		margin-left: 350px;
    		margin-top: 100px;
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
            margin-left:20px;
        }
        #ticketnoword{
         color: rgb(95, 95, 224);
        }
        #ticketnotable{
            padding: 35px;
            margin-left: 30px;
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
    if(cancelMessage.equals("cancelProblem")){
    	session.setAttribute("userHome", "homeSession");
    	%>
    	<script>
    	alert("Please enter correct ticket number");
    </script>
    
    <%}%>
    
    
    <div id="nav">
        <ul>
            <li><span id="buslogo">BusHub</span></li>
            <li><a href="SearchBus.jsp" onclick="searchbusfunc()">Bus_Tickets</a></li>
            <li><a href="AboutUs.jsp" onclick="aboutusfunc()">About_us</a></li>
              <li><div class="dropdown">
                <button class="dropbtn">Ticket 
                </button>
                <div class="dropdown-content">
                  <a href="UserBookingHistory.jsp" onclick="bookinghistoryfunc()">Booking History</a>
                  <a href="MyTicket.jsp" onclick="myticketfunc()">My Ticket</a>
                  <a href="CancelTicket.jsp" onclick="cancelticketfunc()">Cancel Ticket</a>
                </div>
              </div> </li>

              <li><div class="dropdown">
                <button class="dropbtn">Wallet 
                </button>
                <div class="dropdown-content">
                  <a href="ShowBalance.jsp" onclick="showbalancefunc()">Show Balance</a>
                  <a href="UpdateWallet.jsp" onclick="updatewalletfunc()">Update Wallet</a>
                </div>
              </div> 
              <li><a href="UserProfile.jsp" onclick="profilefunc()">Profile</a></li>
              <li><a href="logout" onclick="logoutfunc()">LogOut</a></li>
            </ul>
    </div>

    <fieldset id="invoicediv">
        <legend>Invoice</legend>
        
        <form action="myticketservlet">
        <table id="ticketnotable">
            <tr>
                <td><h3 id="ticketnoword">TICKET NUMBER:</h3></td>
                <td><input type="text" name="tickettext" placeholder="Enter the ticket number" id="tickettext" autofocus autocomplete="off" required></td>
                <td><button id="btnticket" type="submit" >Submit</button></td>
            </tr>
        </table>
		</form>
    </fieldset>
</body>
</html>