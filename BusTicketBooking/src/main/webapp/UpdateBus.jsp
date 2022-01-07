<%@page import="com.busticketbooking.model.Bus"%>
<%@page import="com.busticketbooking.daoimpl.BusDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Bus</title>
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
        padding-left: 60px;
        }
    a{
        text-decoration: none;
    }
        #headeraddbus{
             border: 1px solid black;
             height: 40px;
             background-color: rgb(200, 210, 238);
             margin-top:20px;
             padding: 10px;
             text-align: center;
             font-size: larger;
         }
         #headeraddbus2{
             border: 1px solid black;
             height: 40px;
             background-color: rgb(200, 210, 238);
             margin-top:-370px;
             padding: 10px;
             text-align: center;
             font-size: larger;
         }
         
         #headeraddbus,#addbus{
             width: 430px;
             margin-left: 120px;
         }
         #headeraddbus2,#addbus2{
            width: 430px;
            margin-left: 736px;
         }
         #addbus{
             border: 1px solid black;
             padding: 25px;
             height: 480px;
         }
         #addbus2{
             border: 1px solid black;
             padding: 25px;
         }

         #addbus table tr th,td{
            padding: 7px;
         }
         #addbus2 table tr th,td{
            padding: 8px;
         }
         input{
             height: 25px;
             width: 200px;
         }
         #seatStatus{
            height: 13px;
        }
         button{
             height: 35px;
             width: 100px;
             background-color: rgb(129, 168, 252);
             outline: none;
             border: none;
         }
         #btn{
             margin-left: 80px;
         }
         button:hover{
             background-color: rgb(247, 112, 112);
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
            
    </div>
 
     <div id="headeraddbus"> <label id="bustitle" for="bus">Bus</label> </div>
        <div id="addbus">
            <form action="updateBusPage">
                <table>
                    <tr>
                        <th><label for="busCategory">Bus Category</label></th>
                        <th><input name="busCategory" type="text" id="busCategory" ></th>
                    </tr>
                    <tr>
                        <th><label for="fromCity">From City</label></th>
                        <th><input name="fromCity" type="text" id="fromCity" ></th>
                    </tr>
                    <tr>
                        <th><label for="toCity">To City</label></th>
                        <th><input name="toCity" type="text" id="toCity" ></th>
                    </tr>
                    <tr>
                        <th><label for="departure">Departure</label></th>
                        <th><input name="departure" type="datetime-local" id="departure" ></th>
                    </tr>
                    <tr>
                        <th><label for="arrival">Arrival</label></th>
                        <th><input name="arrival" type="datetime-local" id="arrival" ></th>
                    </tr>
                    <tr>
                        <th><label for="seaterFare">Seater Fare</label></th>
                        <th><input name="seaterFare" type="number" id="seaterFare" ></th>
                    </tr>
                    <tr>
                        <th><label for="totalSeat">Total Seat</label></th>
                        <th><input name="totalSeat" type="number" id="totalSeat" ></th>
                    </tr>
                    <tr>
                        <th><label for="seatStatus">Status</label></th>
                        <th><input type="radio" id="seatStatus" name="seatStatus" value="available" required ><label for="available"> Available</label> 
                           <input type="radio" id="seatStatus" value="unavailable" name="seatStatus" required ><label for="unavailable">UnAvailable</label></th>
                    </tr>
        
                </table>
                <div id="btn"><br>
                    <button type="submit">Submit</button>
                    <button id="reset" type="reset">Reset</button>
                </div>
                </form>
                </div>

     <div id="headeraddbus2"> <label id="bustitle" for="bus">Bus</label> </div>
     <div id="addbus2">
        <form action="busAndOperatorPage">
            <table>
                <tr>
                    <th><label for="busno">Bus No</label></th>
                    <th><input name="busNo" type="text" id="busno" placeholder="Enter Bus No"   ></th>
                </tr>
                <tr>
                    <th><label for="operatorId">Operator ID</label></th>
                    <th><input name="operatorId" type="text" id="operatorId"   placeholder="Enter operator Id" ></th>
                </tr>
            </table>
            <div id="btn"><br>
                <button type="submit">Submit</button>
                <button id="reset" type="reset">Reset</button>
            </div>
            </form>
            </div>

     <script type="text/javascript">
     	<% int busId=Integer.parseInt(request.getParameter("busId")); 
     	BusDaoImpl busDao=new BusDaoImpl();
         Bus busModel=busDao.findBusDetailsUsingID(busId);
         session.setAttribute("busModell", busModel);
     	%> 
     	document.getElementById("busno").value="<%=busModel.getBusNo()%>";
     	document.getElementById("operatorId").value="<%=busModel.getOperatorId()%>";
     	document.getElementById("busCategory").value="<%=busModel.getBusCategory()%>";
     	document.getElementById("fromCity").value="<%=busModel.getFromCity()%>";
     	document.getElementById("toCity").value="<%=busModel.getToCity()%>";
     	document.getElementById("departure").value="<%=busModel.getDeparture()%>";
     	document.getElementById("arrival").value="<%=busModel.getArrival()%>";
     	document.getElementById("seaterFare").value="<%=busModel.getSeaterFare()%>";
     	document.getElementById("totalSeat").value="<%=busModel.getTotalseat()%>";
     	document.getElementById("seatStatus").value="<%=busModel.getSeatStatus()%>";
     </script>
</body>
</html>