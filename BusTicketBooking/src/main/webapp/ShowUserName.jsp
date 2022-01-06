<%@page import="com.busticketbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%HttpSession httpSession=request.getSession();
    	User userModel=new User();
    	User userModel1=(User)httpSession.getAttribute("userModel");
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <%if(userModel1!=null){%>
 <script>
 alert("Welcome _ <%=userModel1.getUserName() %>");
</script>
 
  response.sendRedirect("index.jsp");
   <%}%>
 
</body>
</html>