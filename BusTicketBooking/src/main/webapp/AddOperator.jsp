<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
       *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
        }
        #homeadmin{
            border: 1px solid black;
            height: 85px;
            background-color: rgb(166, 166, 233);
           
        }
        #homeadmin ul li {
            list-style: none;
            display: inline-block;
            padding: 30px;
            padding-left: 70px;
            }
        a{
            text-decoration: none;
        }
         #headeraddoperator{
            border: 1px solid black;
            height: 35px;
            background-color: rgb(200, 210, 238);
            margin-top:60px;
            padding: 5px;
        }
        #headeraddoperator,#addOperator{
            width: 430px;
            margin-left: 470px;
        }
        #operatortitle{
            padding-left: 150px;
            font-size: 20px;
        }
        #addOperator{
            border: 1px solid black;
            padding: 25px;
            height: 310px;
            padding-left: 40px;
            
        }
        input{
            height: 25px;
        }
        table,tr,th{
            padding: 7px;
        }
        button{
            height: 35px;
            width: 100px;
            background-color: rgb(129, 168, 252);
            outline: none;
            border: none;
        }
        #btn{
            margin-left: 45px;
        }
        button:hover{
            background-color: rgb(247, 112, 112);
        }
    </style>
</head>
<body>
	<% String sessionName=(String)session.getAttribute("AdminHome");
	System.out.println(sessionName);
	if(sessionName.equals("AddOperatorSession")){
		session.setAttribute("AdminHome", "HomeSession");
	%>
		<script type="text/javascript">
		alert("Operator added Successfully");
		</script>
	<%}%>
    <div id="homeadmin">
        <ul>
             <li><a href="AdminHome.jsp">Home</a></li>
            <li><a href="AddBus.jsp">Add Bus</a></li>
            <li><a href="AddOperator.jsp">Add Operator</a></li>
            <li><a href="BusList.jsp">Bus list</a></li>
            <li><a href="OperatorList.jsp?opertorId=0">Operator list</a></li>
            <li><a href="UserList.jsp">User list</a></li>
            <li><a href="BookingList.jsp">Booking list</a></li>
        </ul>
    </div>

	<form action="addoperator">
    <div id="headeraddoperator"> <label id="operatortitle" for="operatortitle">Operator</label> </div>
    <div id="addOperator">
        <table >
            <tr>
                <th><label for="operatorName">Operator Name</label></th>
                <th><input name="operatorName" type="text" id="operatorName" required autofocus></th>
            </tr>
            <tr>
                <th><label for="operatorEmail">Operator Email</label></th>
                <th><input name="operatorEmail" type="email" id="operatorEmail" ></th>
            </tr>
            <tr>
                <th><label for="operatorContact">Operator Contact</label></th>
                <th><input name="operatorContact" type="number" id="operatorContact"></th>
            </tr>
            <tr>
                <th><label for="operatorAge">Operator Age</label></th>
                <th><input name="operatorAge" type="number" id="operatorAge"></th>
            </tr>
            
           
     </table>
        <div id="btn"><br>
            <button type="submit">Submit</button>
            <button id="reset" type="reset">Reset</button>
        </div>
    </div>
    </form>

</body>
</html>