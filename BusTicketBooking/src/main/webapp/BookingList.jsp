<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.BookedTicketsDaoImpl" %>
    <%@page import="java.time.LocalDate" %>
    <%@page import="java.sql.ResultSet" %>
    <%
    BookedTicketsDaoImpl bookDao=new BookedTicketsDaoImpl();
        ResultSet rs=bookDao.showlistAdmin();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking List</title>
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
            #bookinglistdiv table tr th,td {
                padding: 20px;
                text-align: center;
                border: 1px solid black;
                border-collapse: collapse;
             }
            #bookinglistfieldset{
                margin-top: 25px;
                margin-left: 70px;
                width: 1000px;
            }
            #bookinglistdiv{
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
            
        <fieldset id="bookinglistfieldset">
            <legend>Booking List</legend>
        <div id="bookinglistdiv">
            <table>
                <tr>
                	<th>Booking Id</th>
                    <th>Ticket No</th>
                    <th>User Id</th>
                    <th>Bus Id</th>
                    <th>Booking_Date</th>
                    <th>Departure_Date</th>
                    <th>Ticket Count</th>
                    <th>Total Price</th>
                    <th>Booking Status</th>
                    <th>Payment Status</th>
                </tr>
                <% while(rs.next()){ %>
                <tr>
                	<td><%=rs.getInt(1) %></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getInt(3) %></td>
                    <td><%=rs.getInt(4) %></td>
                    <td><%=rs.getDate(5).toLocalDate()%></td>
                    <td><%=rs.getTimestamp(6).toLocalDateTime().format(format)%></td>
                    <td><%=rs.getInt(7) %></td>
                    <td><%=rs.getInt(8) %></td>
                    <td><%=rs.getString(9) %></td>
                    <td><%=rs.getString(10) %></td>
                </tr>
                <%} %>
            </table>
      </div>
    </fieldset>
    </div>
</body>
</html>