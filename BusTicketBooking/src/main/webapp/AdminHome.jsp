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
         #profiletable table tr th,td{
            padding: 20px;
        }
        #profiletable{
            margin-left: 100px;
            margin-top: 50px;
        }
        legend{
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
         </ul>
     </div>

     <!--<div  id="profiletable">
        <table>
            <tr>
                <th><label for="name">Name</label></th>
                <th></th>
            </tr>
            <tr>
                <th><label for="mobile">Mobile</label></th>
                <th></th>
            </tr>
            <tr>
                <th><label for="emailId">Email Id</label></th>
                <th></th>
            </tr>
            <tr>
                <th><label for="password">Password</label></th>
                <th></th>
            </tr>
        </table>
            
    </div>-->

 </body>
 </html>