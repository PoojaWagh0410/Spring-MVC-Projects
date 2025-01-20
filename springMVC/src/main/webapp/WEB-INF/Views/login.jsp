<%@page import="com.qspiders.springMVC.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Form</title>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	margin: 0;
	padding: 0;
	background-image:
		url("https://img.freepik.com/free-photo/vintage-pink-telephone-composition_23-2148913955.jpg");
	background-size: cover;
}

div[align="center"] {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

form {
	background-color: #ffffff;
	border-radius: 30px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	width: 400px;
	position: relative;
}

form h3 {
	font-size: 24px;
	font-weight: 600;
	color: #333333;
	margin-bottom: 20px;
	text-align: center;
	border-bottom: 2px solid #4CAF50;
	display: inline-block;
	padding-bottom: 5px;
}

form table {
	width: 100%;
}

form table td {
	padding: 7px;
}

form input[type="text"], form input[type="email"], form input[type="number"],
	form input[type="password"] {
	width: 100%;
	padding: 8px;
	margin: 4px 0;
	border: 1px solid #ccc;
	border-radius: 8px;
	box-sizing: border-box;
}

form input[type="radio"] {
	margin-right: 5px;
}

form input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 140px;
	font-size: 16px;
	border-radius: 4px;
	cursor: pointer;
	display: block;
	margin: 20px auto 0;
}

form input[type="submit"]:hover {
	background-color: #45a049;
}

form label {
	font-size: 14px;
	color: #555555;
}

.message-container {
	text-align: center;
	margin-bottom: 20px;
}

.message-container h1 {
	font-size: 20px;
	color: green;
	margin: 0;
}

.message-container h3 {
	font-size: 16px;
	color: #555;
	margin: 5px 0;
}

@media ( max-width : 500px) {
	form {
		width: 90%;
		padding: 15px 20px;
	}
}
</style>

</head>
<body>
	<div align="center">
		<form action="./auth-user" method="post">
			<div class="message-container">
				<%
				String message = (String) request.getAttribute("message");
				if (message != null) {
				%>
				<h1><%=message%></h1>
				<h3>Login here</h3>
				<%
				}
				%>
				
			</div>
			
			<h3>Login Form</h3>
			<table>
				<tr>
					<td><b>Email :</b></td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td><b>Password :</b></td>
					<td><input type="password" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="LogIn">
		<h4>New User?<a href="./sign-up-page">Sign up</a></h4>
		</form>
		
	</div>
</body>
</html>
