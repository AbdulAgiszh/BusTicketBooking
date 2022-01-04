<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <%User userModel=(User) session.getAttribute("userModel"); 
    System.out.println(userModel.getUserContact());
    System.out.println(userModel.getUserName());
    System.out.println(userModel.getUserEmail());
    System.out.println(userModel.getUserDOB());
    System.out.println(userModel.getUserPassword());
    System.out.println(userModel.getUserGender());%>
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
                    <th><input type="text" name="mobile" id="mobile" required></th>
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