<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@page import="com.busticketbooking.model.SeatDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
    BookedTickets bookTickets=new BookedTickets();
     bookTickets=(BookedTickets)session.getAttribute("ticketdetailsresult");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invoice</title>
 <style>
        *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
        }
        #nav ul,li{
            list-style: none;
            display: flex;
            margin-left: 10px;
    		padding: 102px;
    		padding-left: 6px;
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


        /* legend{
            font-size: xx-large;
            text-align: center;
            
        }
        #invoicediv {
            border:  solid black;
            padding: 30px;
        }
        #usertable tr td{
            padding: 0 45px;
        }
        #usertable tr td input{
            height: 30px;                                                                                                                                                                                                                                                                                                                                                                                                         : none;
        }
        #usertable{
            margin-left: 50px;
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
            margin-left: 350px;
        }
        #traveltable{
            margin-left: 220px;
        }
        #btnticket{
            margin-left: 40px;
        }*/
        /* #bookingstatus{
            border: 1px solid black;
            position: absolute;
            margin-left: 910px;
            margin-top: -185px;
            padding: 25px;
            border-radius: 80px;
            background-color: rgb(250, 173, 198);
        }  */
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






        #buslogohead{
            font-style: italic;
            font-family: cursive;
            font-size: 40px; 
            color: rgb(95, 95, 224);
        }
        #ticketdiv{
            border: 1px solid black;
   			padding: 30px;
            width: 788px;
            margin-left: 300px;
            height: 530px;
        }
        #heading{
            text-align: center;
        }
        #endtable tr td,#starttable tr td,#seattable tr td{
            padding: 10px;
        }
        #endtable{
            position: relative;
    		margin-left: 410px;
    		margin-top: -200px;
        }
        #usertable tr td{
            padding: 0 45px;
        }
        #usertable{
            position: absolute;
            margin-left: -30px;
        }
        #passengerdetails{
            text-align: center;
        }
        #seattable{
            margin-top: -40px;
        }
        /* #usertable tr td input{
            height: 30px;                                                                                                                                                                                                                                                                                                                                                                                                         : none;
        } */
        /* #usertable{
            margin-left: 50px;
        } */
        /* #seattable{
            margin-left: 90px;
        } */
        

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


            <div id="ticketdiv">
        <div id="heading">
            <h1 id="buslogohead">Bus Hub</h1>
            <h3>Ticket-Reservation</h3>
        </div><br>
            <table id="starttable">
                <tr>
                    <td><label for="bookingdate">Booking Date</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getBookingDate() %></h4></td>
                </tr>
                <tr>
                    <td><label for="dateofjourney">Date of Journey</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getDepartureDate().toLocalDate() %></h4></td>
                </tr>
                <tr>
                    <td><label for="startpoint">Service Start Point</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getBusModel().getFromCity() %></h4></td>
                </tr>
                <tr>
                    <td><label for="starttime">Start Time</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getBusModel().getDeparture().toLocalTime() %></h4></td>
                </tr>
                <tr>
                    <td><label for="class">Class Of Service</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getBusModel().getBusCategory() %></h4></td>
                </tr>
            </table>

            <table id="endtable">
                <tr>
                    <td><label for="pnrnumber">PNR Number</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getTicketNo() %></h4></td>
                </tr>
                <tr>
                    <td><label for="arrivaldate">Arrival Date</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getBusModel().getArrival().toLocalDate() %></h4></td>
                </tr>
                <tr>
                    <td><label for="endpoint">Service End Point</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getBusModel().getArrival().toLocalDate() %></h4></td>
                </tr>
                <tr>
                    <td><label for="destinationtime">Destination Time</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getBusModel().getArrival().toLocalTime() %></h4></td>
                </tr>
                <tr>
                    <td><label for="status">Booking Status</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getBookingStatus()%></h4></td>
                </tr>
                <tr>
                    <td><label for="totalfair">Total Fair</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getTotalPrice() %></h4></td>
                </tr>
            </table>
            <table id="seattable">
                <tr>
                    <td><label for="noofseats">No Of Seats</label></td>
                    <td>:</td>
                    <td><h4><%=bookTickets.getTicketCount() %></h4></td>
                </tr>
                <tr>
                    <td><label for="seatno">Seat No</label></td>
                    <td>:</td>
                    <%String seatNoList=(String)session.getAttribute("seatnumberdetailsresult"); %>
                    <td><h4><%=seatNoList%></h4></td>
                </tr>
            </table><br>
            <h4 id="passengerdetails">Passenger Details</h4><br>
            <table id="usertable">
                <tr>
                    <td><label for="username">UserName</label></td>
                    <td><label for="age">Age</label></td>
                    <td><label for="mobile">Mobile</label></td>
                    <td><label for="gender">Gender</label></td>
                </tr>
                <tr>
                    <td><h4><%=bookTickets.getUserModel().getUserName() %></h4></td>
                    <td><h4><%=bookTickets.getUserModel().getUserDOB() %></h4></td>
                    <td><h4><%=bookTickets.getUserModel().getUserContact() %></h4></td>
                    <td><h4><%=bookTickets.getUserModel().getUserGender() %></h4></td>
                </tr>
            </table>
        </div>
    
    
</body>
</html>