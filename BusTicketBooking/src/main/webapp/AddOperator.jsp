<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Add Operator</title>
<link rel="stylesheet" href="css/NavStyleAdmin.css">
<style>

         #headeraddoperator{
            padding: 0px;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    text-align: center;
        }
        #headeraddoperator,#addOperator{
             margin: 0px auto;
        }
        #operatortitle{
           padding: 0px;
    font-size: 30px;
    font-weight:bold;
     text-align: center;
        }
        #addOperator{
             padding: 17px;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    border: none;
    margin: 55px auto;
            
        }
        
        #addOperator label {
        display: inline-block;
    padding: 0px 7px;
}
        #addOperator table,tr,th{
            padding: 7px 0px;
    margin: 14px auto;
        }
       #btn button{
           height: 35px;
    width: 100px;
    outline: none;
    border: none;
    box-shadow: 0px 0px 10px 0px #c7c7c7;
    background: none;
    margin: 0px 20px;
        }
        #btn{
            text-align:center
        }
        #btn button:hover{
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
            <li><a href="SeatList.jsp">Seat list</a></li>
        </ul>
    </div>

	<form action="addoperator">
    <div id="addOperator" class="col-sm-4">
        <div id="headeraddoperator"> <label id="operatortitle" for="operatortitle">Operator</label> </div>
    
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