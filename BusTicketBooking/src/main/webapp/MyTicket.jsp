<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@page import="com.busticketbooking.daoimpl.BookedTicketsDaoImpl"%>
<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%List<BookedTickets> bookTicketsList; %>
    <%HttpSession session2=request.getSession();
    BookedTicketsDaoImpl bookTicketsDao=new BookedTicketsDaoImpl();
    BookedTickets bookTickets=new BookedTickets();
      User userModel=(User)session2.getAttribute("userModel");
     bookTicketsList =new ArrayList<BookedTickets>();
      if(session2.getAttribute("ticketdetailsresult") != null){
      bookTicketsList=(List<BookedTickets>)session2.getAttribute("ticketdetailsresult");
      }
      
      
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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


        legend{
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
        #usertable{
            margin-left: 50px;
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

    <fieldset id="invoicediv">
        <legend>Invoice</legend>
        
        <table id="usertable">
            <tr>
                <td><label for="username">UserName :</label></td>
                <td><label for="age">Age :</label></td>
                <td><label for="mobile">Mobile :</label></td>
                <td><label for="gender">Gender :</label></td>
            </tr>
            <tr>
                <td><input type="text" value="<%=userModel.getUserName() %>" readonly></td>
                <td><input type="text" value="<%=userModel.getUserDOB() %>" readonly></td>
                <td><input type="text" value="<%=userModel.getUserContact() %>" readonly></td>
                <td><input type="text" value="<%=userModel.getUserGender() %>" readonly></td>
            </tr>
        </table>
        
        <form action="myticketservlet">
        <table id="ticketnotable">
            <tr>
                <td>TICKET NO :</td>
                <td><input type="text" name="tickettext" placeholder="Enter the ticket number" id="tickettext" required></td>
                <td><button id="btnticket" type="submit" >Submit</button></td>
            </tr>
        </table>
		</form>
		<%if(bookTicketsList != null){ %>
		<% for(BookedTickets bookTicket:bookTicketsList){%>
        <table id="traveltable">
            <tr>
            
                <td><label for="fromlocation">From Location : <h4 id="fromlocation"><%=bookTicket.getBusModel().getFromCity()%></h4></label></td>
                <td><label for="tolocation">To Location : <h4 id="tolocation"><%=bookTicket.getBusModel().getToCity()%></h4></label></td>
                <td><label for="buscategory">Bus Category : <h4 id="buscategory"><%=bookTicket.getBusModel().getBusCategory()%></hss4></label></td>
            </tr>
            <tr>
                <td><label for="departure">Departure At : <h4 id="departure"><%=bookTicket.getBusModel().getDeparture()%></h4></label></td>
                <td><label for="arrival">Arrival At : <h4 id="arrival"><%=bookTicket.getBusModel().getArrival()%></h4></label></td>
            </tr>
            <tr>
                <td><label for="seatcount">Seat Count : <h4 id="seatcount"><%=bookTicket.getTicketCount()%></h4></label></td>
                <td><label for="totalfair">Total Fair : <h4 id="totalfair"><%=bookTicket.getTotalPrice()%></h4></label></td>
                <td><label for="bookingstatus">Booking Status : <h4 id="bookingstatus"><%=bookTicket.getBookingStatus()%></h4></label></td>
            </tr>
        </table>
        <%} %>
        <%} %>
    </fieldset>

    
</body>

</html>