<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@page import="com.busticketbooking.daoimpl.BookedTicketsDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%BookedTicketsDaoImpl bookTicketsDao=new BookedTicketsDaoImpl();
     BookedTickets bookedTickets=(BookedTickets) session.getAttribute("FinalBookTicketsModel");
     
     //int bookingTicketId=bookTicketsDao.findBookingId(bookedTickets);
     //BookedTickets bookTickets1=bookTicketsDao.findBookedTicketsObjectDetails(bookingTicketId);
     //System.out.println("objedtbookid" +bookTickets1.getBookingId());
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
            cursor: pointer;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
        
        
        #successdiv{
            border: solid black;
            width: 450px;
            height: 300px;
            padding: 50px;
            padding-top: 70px;
            margin-left: 430px;
            margin-top: 120px;
            border-radius: 25px;
            background-color: rgb(91, 253, 91);
            
        }
    </style>
</head>
<body>

    <div id="nav">
        <ul>
            <li><span id="buslogo">BusHub</span></li>
            <li><a href="SearchBus.jsp">Bus_Tickets</a></li>
            <li><a href="aboutus.html">About_us</a></li>
            <li><a href="UserProfile.jsp">Profile</a></li>

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
              </div> </li>

            <li><a href="Login.jsp">SignIn</a></li>
            <li><a href="UserRegister.jsp">SignUp</a></li>
        </ul>
        </div>


    <div id="successdiv">
        <h2> Ticket Successfully Booked </h2><br><br><br>
        <h3>Your Ticket No :  <span><%=bookedTickets.getTicketNo()%></span></h3>
        <p><--Use this Ticket No for further purpose--></p>

    </div>
    <script>
            alert("payment paid successfully");
    </script>
</body>
</html>