<%@page import="com.busticketbooking.model.BookedTickets"%>
<%@page import="com.busticketbooking.daoimpl.BookedTicketsDaoImpl"%>
<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%HttpSession session2=request.getSession();
      User userModel=(User)session2.getAttribute("userModel");
      BookedTicketsDaoImpl bookTicketsDao=new BookedTicketsDaoImpl();
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
        <table id="ticketnotable">
            <tr>
                <td>TICKET NO :</td>
                <td><input type="text" placeholder="Enter the ticket number" id="tickettext" required></td>
                <td><button id="btnticket" type="submit" onclick="ticketNumberClick()">Submit</button></td>
            </tr>
        </table>

        <table id="traveltable" style="visibility: hidden;">
            <tr>
                <td><label for="fromlocation">From Location : <h4 id="fromlocation"></h4></label></td>
                <td><label for="tolocation">To Location : <h4 id="tolocation"></h4></label></td>
                <td><label for="buscategory">Bus Category : <h4 id="buscategory"></hss4></label></td>
            </tr>
            <tr>
                <td><label for="departure">Departure At : <h4 id="departure"></h4></label></td>
                <td><label for="arrival">Arrival At : <h4 id="arrival"></h4></label></td>
            </tr>
            <tr>
                <td><label for="seatcount">Seat Count : <h4 id="seatcount"></h4></label></td>
                <td><label for="totalfair">Total Fair : <h4 id="totalfair"></h4></label></td>
            </tr>
        </table>
    </fieldset>

    
</body>
<script>
        
    function ticketNumberClick(){
    	
    	var ticketNumber=document.getElementById("tickettext").value;
    	
    	<%BookedTickets bookTicketsModel=bookTicketsDao.findBookedTicketsDetails(ticketNumber);
    	if(bookTicketsModel!=null){%>
    	document.getElementById("traveltable").style.visibility="visible";
    	
    	document.getElementById("fromlocation").value="<%=bookTicketsModel.getBusModel().getFromCity()%>";
        document.getElementById("tolocation").value="<%=bookTicketsModel.getBusModel().getToCity()%>";
        document.getElementById("buscategory").value="<%=bookTicketsModel.getBusModel().getBusCategory()%>";
        document.getElementById("departure").value="<%=bookTicketsModel.getBusModel().getDeparture()%>";
        document.getElementById("arrival").value="<%=bookTicketsModel.getBusModel().getArrival()%>";
        document.getElementById("seatcount").value="<%=bookTicketsModel.getTicketCount()%>";
        document.getElementById("totalfair").value="<%=bookTicketsModel.getTotalPrice()%>";
        <%}
        else{
        %>
        alert("please enter correct ticket number");
        request.sendRedirect("MyTicket.jsp");
        <%}%>
        
        
    }
    
    </script>
</html>