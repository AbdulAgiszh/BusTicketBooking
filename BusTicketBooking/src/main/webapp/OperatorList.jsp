<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.OperatorDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    <%
    OperatorDaoImpl operatorDao=new OperatorDaoImpl();
        ResultSet rs=operatorDao.viewOperator();
        int opertorId=Integer.parseInt(request.getParameter("opertorId"));
        //System.out.println(opertorId);
        operatorDao.deleteOperator(opertorId);
    %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Operator List</title>
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
            padding-left: 60px;
            }
        a{
            text-decoration: none;
        }
        #operatorlistdiv table tr th,td {
            padding: 20px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
         }
        #operatorlistfieldset{
            margin-top: 20px;
            margin-left: 200px;
            width: 900px;
        }
        #operatorlistdiv{
            padding: 35px;
            margin-left: 20px;
            margin-top: 10px;
        }
        legend{
            font-size: 30px;
            text-align: center;
        }
       
    </style>
</head>
<body>
	<%if(opertorId>0){ %>
	<script type="text/javascript">
		alert("Operator deleted Successfully");
		</script>
		<%} %>
		
	<% String sessionName=(String)session.getAttribute("AdminHome");
	//System.out.println(sessionName);
	if(sessionName.equals("UpdateOperatorSession")){
		session.setAttribute("AdminHome", "HomeSession");
	%>
		<script type="text/javascript">
		alert("Operator Updated Successfully");
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

    <fieldset id="operatorlistfieldset">
        <legend>Operator_Details</legend>
    <div id="operatorlistdiv">
        <table>
            <tr>
                <th>Operator Id</th>
                <th>Operator Name</th>
                <th>Operator Email</th>
                <th>Operator Contact</th>
                <th>Operator Age</th>
                <th>Operator Status</th>
                <th>edit&delete</th>
            </tr>
            <% while(rs.next()){ %>
                <tr>
                    <td><%=rs.getInt(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td><%=rs.getLong(4) %></td>
                    <td><%=rs.getInt(5) %></td>
                    <td><%=rs.getString(6) %>
                    <td><a href="UpdateOperator.jsp?operatorId=<%=rs.getInt(1)%>">edit</a> / <a href="OperatorList.jsp?opertorId=<%=rs.getInt(1)%>">delete</a></td>
                </tr>
                <% } %>
        
        </table>
  </div>
  
</fieldset>


</body>
</html>