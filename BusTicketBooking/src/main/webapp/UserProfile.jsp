<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" href="css/NavStyleUser.css">
<style>
        #profiletable table tr th,td{
            padding: 10px;
        }
        #profiletable{
            margin-left: 40px;
            margin-top: 50px;
        }
        legend{
            text-align: center;
        }
        #updateprofile{
            width: 500px;
            margin-left: 500px;
            margin-top: -332px;
        }
        #updateprofile table tr td,th{
            padding: 10px;

        }
        #updateprofile table{
            padding: 40px;
        }
        input{
            height: 25px; 
        }
        #btn a{
        	text-decoration: none;
            font-size: large;
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
        #btn:hover , #btnupdatediv:hover{
            background-color: rgb(247, 112, 112);
        }
         #btnupdatediv{
             margin-left: 175px;
              height: 45px;
              width: 120px;
              background-color: rgb(129, 168, 252);
              outline: none;
              border: none;
              cursor: pointer;
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

	 <%String profileMessage=(String)session.getAttribute("userHome");
            if(profileMessage.equals("updateUserProfileServlet")){
            	session.setAttribute("userHome", "homeSession");
            	%>
            <script>
            	alert("Profile Updated Successfully");
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
    <%User userModel=(User) session.getAttribute("userModel"); %>
    </ul>
    </div>
    <div  id="profiletable">
        <table>
            <tr>
                <th><label for="mobile">MobileNumber</label></th>
                <th><%=userModel.getUserContact() %></th>
            </tr>
            <tr>
                <th><label for="name">UserName</label></th>
                <th><%=userModel.getUserName()%></th>
            </tr>
            <tr>
                <th><label for="emailId">EmailId</label></th>
                <th><%=userModel.getUserEmail() %></th>
            </tr>
            <tr>
                <th><label for="dob">DOB</label></th>
                <th><%=userModel.getUserDOB()%></th>
            </tr>
            <tr>
                <th><label for="password">Password</label></th>
                <th><%=userModel.getUserPassword()%></th>
            </tr>
            <tr>
                <th><label for="gender">Gender</label></th>
                <th><%=userModel.getUserGender()%></th>
            </tr>
        </table>
            <button id="btn" type="submit" onclick="updateProfilebox()">update</button>
    </div>


    
        <fieldset id="updateprofile" style="visibility: hidden;">
            <legend><h2>Profile</h2></legend>
            <form action="userProfileUpdate" >
            <table>
                <tr>
                    <th><label for="userName">UserName</label></th>
                    <th><input type="text" name="userName" id="userName" required autofocus autocomplete="off"></th>
                </tr>
                <tr>
                    <th><label for="emailId">EmailId</label></th>
                    <th><input type="email" name="emailId" id="emailId" required></th>
                </tr>
                <tr>
                    <th><label for="mobile">MobileNumber</label></th>
                    <th><input type="text" name="mobile" id="mobile" readonly required></th>
                </tr>
                <tr>
                    <th><label for="password">Password</label></th>
                    <th><input type="password" name="password" id="password"  required></th>
                </tr>
                <tr>
                    <th><label for="dob">DOB</label></th>
                    <th><input type="date" name="dob" id="dob" ></th>
                </tr>
                <tr>
                    <th><label for="gender">Gender</label></th>
                    <th id="male"><input type="radio" name="gender" id="gender" required><label for="Male"> Male</label> 
                        <input type="radio" name="gender" id="gender" required><label for="Female">Female</label></th>
                </tr>
                
            </table>
                <button  id="btnupdatediv" type="submit">Submit</button>
    	</form>
        </fieldset>
    
    <script>
        function updateProfilebox(){
            document.getElementById("updateprofile").style.visibility="visible";
        }
        document.getElementById("userName").value="<%=userModel.getUserName()%>";
        document.getElementById("emailId").value="<%=userModel.getUserEmail()%>";
        document.getElementById("mobile").value="<%=userModel.getUserContact()%>";
        document.getElementById("password").value="<%=userModel.getUserPassword()%>";
        document.getElementById("dob").value="<%=userModel.getUserDOB()%>";
        document.getElementById("gender").value="<%=userModel.getUserGender()%>";
    </script>
</body>
</html>