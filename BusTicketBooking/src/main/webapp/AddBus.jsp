<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        #bustitle{
            padding: 25px;
            font-size: 30px;
        }
        #headeraddbus{
            border: 1px solid black;
            height: 40px;
            background-color: rgb(200, 210, 238);
            margin-top:20px;
        }
        #headeraddbus,#addbus{
            width: 430px;
            margin-left: 500px;
        
        }
        #addbus{
            border: 1px solid black;
            padding: 15px;
            height: 423px;
        }
        #bustitle{
            padding-left: 180px;
        }
        input,textarea{
            width: 200px;
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
            <li><a href="OperatorList.jsp">Operator list</a></li>
            <li><a href="UserList.jsp">User list</a></li>
            <li><a href="BookingList.jsp">Booking list</a></li>
        </ul>
    </div>

	<form action="addbus">
    <div id="headeraddbus"> <label id="bustitle" for="bus">Bus</label> </div>
    <div id="addbus">
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

        </table>

        <div id="btn"><br>
            <button type="submit">Submit</button>
            <button id="reset" type="reset">Reset</button>
        </div>
    </div>
    </form>
</body>
</html>