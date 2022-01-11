<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.busticketbooking.daoimpl.BookedTicketsDaoImpl"%>
<%@page import="com.busticketbooking.daoimpl.UserDaoImpl"%>
<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%User userModel=(User)session.getAttribute("userModel"); 
      BookedTickets bookTickets=new BookedTickets();
      BookedTicketsDaoImpl bookTicketsDao=new BookedTicketsDaoImpl();
      List<BookedTickets> bookTicketsList=new ArrayList<BookedTickets>();
      bookTicketsList=bookTicketsDao.getBookingDetailsForCurrentUser(userModel);
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking History</title>
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
           /*  position: fixed; */
            overflow: hidden;
            top: 0;
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
/*             z-index: 5; */
            
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
        a{
                text-decoration: none;
            }
            #operatorlistdiv table tr th,td {
                padding: 25px;
                text-align: center;
                border: 1px solid black;
                border-collapse: collapse;
             }
            #operatorlistfieldset{
                margin-top: 110px;
                margin-left: 100px;
                width: 1000px;
                
            }
            #operatorlistdiv{
                padding: 40px;
                margin-left: 20px;
                margin-top: 10px;
            }
            legend{
                font-size: 30px;
                text-align: center;
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

        <fieldset id="operatorlistfieldset">
            <legend>Booking-History</legend>
        <div id="operatorlistdiv">
         
            <table>
                <tr>
                    <th>Ticket No</th>
                    <th>Booking_Date</th>
                    <th>Bus Type</th>
                    <th>Departure_Date</th>
                    <th>Arrival_Date</th>
                    <th>Seat Count</th>
                    <th>Total Price</th>
                    <th>Booking Status</th>
                </tr>
                <%for(BookedTickets bookTicket:bookTicketsList){%>
				<tr>
                    <td><%=bookTicket.getTicketNo() %></td>
                    <td><%=bookTicket.getBookingDate() %></td>
                    <td><%=bookTicket.getBusModel().getBusCategory() %></td>
                    <td><%=bookTicket.getBusModel().getDeparture() %></td>
                    <td><%=bookTicket.getBusModel().getArrival() %></td>
                    <td><%=bookTicket.getTicketCount() %></td>
                    <td><%=bookTicket.getTotalPrice() %></td>
                    <td><%=bookTicket.getBookingStatus() %></td>
                </tr>
                <%} %>
            </table>
            
      </div>
    </fieldset>
</body>
</html>