<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
		

        body{
            background: url(‫images/juan-encalada-6mcVaoGNz1w-unsplash.jpg);
            background-size: cover;
            background-repeat: no-repeat    ;
            
        }
        .signup{
            width: 400px;
            height: 400px;
            margin-left: 130px;
            margin-top: 50px ;
            padding: 20px;
            
        }
        th,td{
            /* padding: 0 25px;
            padding: 10px 0; */
            padding: 5px;
        }
        #buttontable{
            margin-left: 30px;
            padding-top: 20px;
            
        }
        a{
        	text-decoration: none;
        }
        button{
            height: 35px;
            width: 100px;
            border: none;
            outline: none;
        }
        button:hover{
            background-color: tomato;
        }
        label,h2{
            color: black;
        }
        #male{
            margin-left: 0%;
            padding: 0 40px   ;
        }
        input{
            outline: none;
        }
    </style>
</head>


<body>

<form action="registerpage" onsubmit="return register()">
    <fieldset class="signup">
        <legend><h2>Registeration</h2></legend>

        <table id="signuptable" style="border-spacing: 5px;">
            <tr>
                <th><label for="name">UserName</label></th>
                <th><input type="text" name="name" id="name" required autofocus autocomplete="off" required></th>
            </tr>
            <tr>
                <th><label for="emailId">EmailId</label></th>
                <th><input name="emailId" type="email" id="emailId" autocomplete="off" pattern="[A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}" required ></th>
            </tr>
            <tr>
                <th><label for="mobile">MobileNumber</label></th>
                <th><input name="mobile" type="text" id="mobile" autocomplete="off" pattern="[6-9][0-9]{9}" title="Must contain 10 numbers only" required></th>
            </tr>
            <tr>
                <th><label for="password">Password</label></th>
                <th><input name="password" type="password" id="password" autocomplete="off" pattern="^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,15}$" title="weak-password" required></th>
            </tr>
            <tr>
                <th><label for="dob">DOB</label></th>
                <th><input name="dob" type="date" id="dob" autocomplete="off" required></th>
            </tr>
            <tr>
                <th><label for="gender">Gender</label></th>
                <th id="male"><input type="radio" name="gender" value="Male" required required><label for="Male"> Male</label> 
                    <input type="radio" value="Female" name="gender" required required><label for="Female">Female</label></th>
            </tr>
            
        </table>
        <br>
        <table id="buttontable">
            <tr>
                <td><button type="submit">Register</button></td>
                <td><button type="reset">Reset</button></td>
                <td><button type="submit"><a href="index.jsp"> Home</a></button></td>
            </tr>
        </table>
        
    </fieldset>
</form>
<script type="text/javascript">
function register(){
	if(true){
		alert("Registered Successfully");
	}
	else{
		alert("not successfull");
	}
}
</script>
</body>
</html>