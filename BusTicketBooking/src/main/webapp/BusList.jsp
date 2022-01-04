<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.BusDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    <%
    BusDaoImpl busDao=new BusDaoImpl();
        ResultSet rs=busDao.viewAllBus();
    %>
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
        table{
        border-collapse: collapse;
        }
        #buslistdiv table tr th,td {
            padding: 20px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
         }
        #buslistfieldset{
            margin-top: 20px;
            
        }
        #buslistdiv{
            margin-top: 20px;
        }
        legend{
            font-size: 30px;
            text-align: center;
        }
    </style>
    <body>
        <div id="homeadmin">
            <ul>
                <li><a href="AdminHome.jsp">Home</a></li>
            <li><a href="AddBus.jsp">Add Bus</a></li>
            <li><a href="AddOperator.jsp">Add Operator</a></li>
            <li><a href="BusList.jsp">Bus list</a></li>
            <li><a href="OperatorList.jsp">Operator list</a></li>
            <li><a href="UserList.jsp">User list</a></li>
            <li><a href="BookingList.jsp">Booking list</a></li>
            </ul>
                
        </div>
        <fieldset id="buslistfieldset">
            <legend>Bus_Details</legend>
        <div id="buslistdiv">
            <table>
                <tr>
                    <th>Bus Id</th>
                    <th>Bus No</th>
                    <th>Operator Id</th>
                    <th>Bus Type</th>
                    <th>From City</th>
                    <th>To City</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Seater Fare</th>
                    <th>Total Seat</th>
                    <th>Seat Status</th>
                    <th>Edit</th>
                </tr>
                <% while(rs.next()){ %>
                <tr>
                    <td><%=rs.getInt(1) %></td>
                    <td><%=rs.getInt(2) %></td>
                    <td><%=rs.getInt(3) %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getString(5) %></td>
                    <td><%=rs.getString(6) %></td>
                    <td><%=rs.getTimestamp(7)%></td>
                    <td><%=rs.getTimestamp(8)%></td>
                    <td><%=rs.getInt(9) %></td>
                    <td><%=rs.getInt(10) %></td>
                    <td><%=rs.getString(11) %></td>
                    <td><a href="UpdateBus.jsp?busId=<%=rs.getInt(1)%>">edit</a></td>
                </tr>
                <%} %>
            </table>
      </div>
    </fieldset>
    </body>

</html>