<%@page import="com.busticketbooking.daoimpl.UserDaoImpl"%>
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
<title>Wallet</title>
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
        
        
    #updatewalletdiv{
        border: 2px solid black;
        border-radius: 10px;
        width: 400px;
        padding: 40px;
        margin-left: 450px;
        margin-top: 100px;
    }
    #updatewalletdiv table tr td{
        padding: 8px;
        font-size: x-large;
    }
    #amounttext{
        height: 30px;
        width: 200px;
        font-size: 15px;
    }
    #amountdiv{
        margin-top: 20px;
        margin-left: 50px;
        font-size: x-large;
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
        #btn a{
        	text-decoration: none;
            font-size: large;
        }
        #btn:hover{
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
<form action="UserHome.jsp">
    <div id="updatewalletdiv">
        <table>
            <tr>
                <td>LoginId :</td>
                <td><%=userModel1.getUserContact() %></td>
            </tr>
            <%String walletMessage=(String)session.getAttribute("userHome");
            if(walletMessage.equals("insufficient")){
            	session.setAttribute("userHome", "homeSession");
            	%>
            <script>
            	alert("Insufficient Balance...You can't book ticket with this balance    Please Recharge your Wallet");
            </script>
            
            <%} %>
            
            <tr>
                <td>Available Balance :</td>
                <td><%=userModel1.getUserWallet() %></td>
            </tr>
        </table>
    <div id="amountdiv">
        <label for="enteramount">Enter the amount</label>
        <input id="amounttext" name="amountentered" type="number" placeholder="To be added to your wallet" autocomplete="off" min="100" required>
    </div>
         <button id="btn" name="btn" type="submit">Submit</button>
    </div>
</form>
</body>
</html>