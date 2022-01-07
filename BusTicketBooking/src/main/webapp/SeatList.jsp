<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.busticketbooking.model.SeatDetails"%>
<%@page import="com.busticketbooking.daoimpl.SeatDetailsDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    SeatDetailsDaoImpl seatDao=new SeatDetailsDaoImpl();
    SeatDetails seatModel=new SeatDetails();
    List<SeatDetails> seatDetailsList=new ArrayList<SeatDetails>();
    seatDetailsList=seatDao.showSeatList();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seat List</title>
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
        #seatlistdiv table tr th,td {
            padding: 0 60px;
            height: 65px;
            text-align: center;
            border: 1px solid black;
            border-collapse: collapse;
         }
         
        #seatlistfieldset{
            margin-top: 20px;
            margin-left: 130px;
            width: 0%;
        }
        #seatlistdiv{
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

        <fieldset id="seatlistfieldset">
            <legend>Seat_Details</legend>
        <div id="seatlistdiv">
            <table>
                <tr>
                    <th>Ticket_No</th>
                    <th>User_Id</th>
                    <th>Bus_Id</th>
                    <th>Seat_No</th>
                    <th>Seat_Status</th>
                </tr>
                <%for(SeatDetails seatInfo:seatDetailsList){%>
                <tr>
                    <td><%=seatInfo.getBookedTickets().getTicketNo() %></td>
                    <td><%=seatInfo.getBookedTickets().getUserModel().getUserId()%></td>
                    <td><%=seatInfo.getBookedTickets().getBusModel().getBusId() %></td>
                    <td><%=seatInfo.getSeatNo() %></td>
                    <td><%=seatInfo.getStatus() %></td>
                </tr>
                 <%} %>
            </table>
      </div>
    </fieldset>

     
 </body>
 </html>