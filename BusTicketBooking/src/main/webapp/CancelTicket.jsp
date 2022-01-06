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
<title>Insert title here</title>
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

	<%String cancelMessage=(String)session.getAttribute("userHome");
    if(cancelMessage.equals("cancelSuccess")){
    	session.setAttribute("userHome", "homeSession");
    	%>
    	<script>
    	alert("Ticket cancelled successfully");
    </script>
    
    <%}
    else if(cancelMessage.equals("wrongTicketNumber")){%>
    	session.setAttribute("userHome", "homeSession");
    	%>
    	<script>
    	alert("Oops!! Wrong Ticket Number Please Enter correct ticket number....");
    </script>

	<%} %>
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

            <li><a href="Login.html">SignIn</a></li>
            <li><a href="UserRegister.html">SignUp</a></li>
            </ul>
        </div>

    <fieldset id="invoicediv">
        <legend>CancelTicket</legend>
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
        <form action="cancelticketservlet">
        <table id="ticketnotable">
            <tr>
                <td>TICKET NO :</td>
                <td><input id="tickettext" name="tickettext" type="text" placeholder="Enter the ticket number"></td>
                <td><button id="btnticket" type="submit" >Submit</button></td>
            </tr>
        </table>
        </form>
</fieldset>
<script type="text/javascript">

</script>
</body>
</html>