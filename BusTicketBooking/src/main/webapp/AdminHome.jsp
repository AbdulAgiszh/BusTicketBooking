<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Home</title>
<link rel="stylesheet" href="css/NavStyleAdmin.css">
<style type="text/css">
	#logout {
    		height: 50px;
    		width: 200px;
    		margin-top: 70px;
    		margin-left: 600px;
    		padding:8px;
    		color: black;
    		background-color: rgb(255 255 255);
    		border: none;
    		border-radius: 10px;
    		cursor: pointer;
    		box-shadow: 0px 0px 5px 0px black;
    		text-allign:center;
	}
</style>
 </head>
 <body>
     <div id="homeadmin" class="container-fluid">
         <ul>
             <li><a href="AdminProfile.jsp">Home</a></li>
             <li><a href="AddBus.jsp">Add Bus</a></li>
             <li><a href="AddOperator.jsp">Add Operator</a></li>
             <li><a href="BusList.jsp">Bus list</a></li>
             <li><a href="OperatorList.jsp?opertorId=0">Operator list</a></li>
             <li><a href="UserList.jsp">User list</a></li>
             <li><a href="BookingList.jsp">Booking list</a></li>
             <li><a href="SeatList.jsp">Seat list</a></li>
         </ul>
     </div>
     <form action="logout">
	<button type="submit" id="logout" ><h3>LogOut</h3></button>
	</form>
 </body>
 </html>