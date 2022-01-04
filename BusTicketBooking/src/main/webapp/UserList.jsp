<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.busticketbooking.daoimpl.UserDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    
    <%
        UserDaoImpl userDao=new UserDaoImpl(); 
            ResultSet rs=userDao.viewUserDetails();
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
            #operatorlistdiv table tr th,td {
                padding: 20px;
                text-align: center;
                border: 1px solid black;
                border-collapse: collapse;
             }
            #operatorlistfieldset{
                margin-top: 25px;
                margin-left: 100px;
                width: 1000px;
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
            
        <fieldset id="operatorlistfieldset">
            <legend>Operator_Details</legend>
        <div id="operatorlistdiv">
            <table>
                <tr>
                    <th>User Id</th>
                    <th>Name</th>
                    <th>DateOfBirth</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Gender</th>
                    <th>Password</th>
                    <th>Wallet</th>
                    <th>Status</th>
                </tr>
              <% while(rs.next()){ %>
                <tr>
                    <td><%=rs.getInt(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getDate(3)%></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getLong(5) %></td>
                    <td><%=rs.getString(6) %></td>
                    <td><%=rs.getString(7) %></td>
                    <td><%=rs.getInt(8) %></td>
                    <td><%=rs.getString(9) %></td>
                </tr>
                <%} %>
            </table>
      </div>
    </fieldset>
    </div>
</body>
</html>