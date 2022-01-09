<%@page import="com.busticketbooking.daoimpl.BusDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.model.User" %>
    <%@page import="com.busticketbooking.daoimpl.UserDaoImpl" %>
    <%@page import="javax.servlet.http.HttpSession" %>
    <%BusDaoImpl busDao=new BusDaoImpl();
    List<String> locationList=new ArrayList<String>(); 
    locationList=busDao.getLocations();
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Hub</title>

<style>
        *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
        }
        body{
            background: url("seat2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            height: 537px;
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
        
        
        input{
            height: 30px;
            width: 220px;
            border-top: none;
            border-left: none;
            border-right: none;
            outline: none;
        }
        input,type{
            font-size: 20px;
            padding-top: 5px;
            padding-left: 30px;
            margin-left: 10px;
            background-color: blanchedalmond;
        }
        span{
            font-size: larger;
        }
        table,tr,td{
            padding: 0px;
            border-spacing: 0px;
        }
        #searchlocation{
            padding: 40px;
            border: 1px solid black;
            border-radius: 15px;
            height: 247px;
            width: 1030px;
            margin-left: 150px;
            margin-top: 100px;
            background-color: blanchedalmond;
            border:none;
        }.fromto{
            border: 0.100px solid black;
            width: 300px;
            height: 105px;
            font-size: 20px;
            padding: 20px;
            margin-top: 0px;
        }
        #searchbutton{
            height: 50px;
            width: 200px;
            margin-top: 80px;
            margin-left: 360px;
            color: white;
            background-color: rgb(88, 88, 219);
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }
        #usernameshow{
            font-size: larger;
            margin-left: 1100px;
        }
        #loginlink{
            margin-left: 450px;
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

	   
            
        <%session.setAttribute("userHome", "homeSession");%>
           
    <div id="nav">
        <ul>
            <li><span id="buslogo">BusHub</span></li>
            <li><a href="index.jsp">Bus_Tickets</a></li>
            <li><a href="AboutUs.jsp">About_us</a></li>
            
            <li id="loginlink"><a href="Login.jsp">SignIn</a></li>
            <li><a href="UserRegister.jsp">SignUp</a></li>
            </ul>
            
        </div>
	
	
    <div>
    <form action="FilterBus.jsp">
        <div id="searchlocation">
            <table>
                <tr>
                    <td><div class="fromto">
                        <span>FROM</span><br>
                        <input name="fromlocation"  id="fromlocation" autocomplete="off" placeholder="Search Locations" list = "from" required>
                            <datalist id = "from">
                            <%for(int i=0;i<locationList.size();i++){%>
                        	<option value="<%=locationList.get(i)%>"><%=locationList.get(i)%></option>
                        	<%}%>
                            </datalist></div></td																																																																																																		>
                    <td><div class="fromto">
                        <span>TO</span><br>
                        <input name="tolocation" id="tolocation" autocomplete="off" placeholder="Search Locations" list = "to" required>
                        <datalist id = "to">
                        <%for(int i=0;i<locationList.size();i++){%>
                        <option value="<%=locationList.get(i)%>"><%=locationList.get(i)%></option>
                        <%}%>
                        </datalist></div></td>
                    <td><div class="fromto">
                        <span>DATE</span><br>
                        <input name="date" id="date" type="date" required></div></td>
                </tr>
            </table>
            <button type="submit" id="searchbutton" onclick="return validate()"><h3>SEARCH</h3></button>

        </div>
        </form>
    </div>
    
    <script type="text/javascript">
      
    today();
    function today(){
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        var yyyy1= today.getFullYear()+10;
    maxdate =yyyy1 + '-' + mm + '-'+ dd  ;
    mindate =yyyy + '-' + mm + '-'+ dd  ;
    document.getElementById("date").setAttribute("max",maxdate);
    document.getElementById("date").setAttribute("min",mindate);
    }
    
    function validate(){
        var from=document.getElementById("fromlocation");
        var to=document.getElementById("tolocation");
        if(from.value.trim()==to.value.trim()){
        	alert("please enter correct location");
            return false;
        }
        else{
        return true;
        }
    }
    </script>
</body>
</html>