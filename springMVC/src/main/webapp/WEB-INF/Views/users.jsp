<%@page import="com.qspiders.springMVC.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Users</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
}

.container {
	width: 80%;
	margin: auto;
	overflow: hidden;
	padding: 12px;
}

table {
	width: 85%;
	border-collapse: collapse;
	margin: 20px 0;
	background-color: #fff;
}

th, td {
	padding: 12px;
	text-align: left;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #4CAF50;
	color: white;
	text-align: center;
	
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

h1 {
	text-align: center;
	color: #333;
}

h2 {
    text-align: center; /* Center the text */
    font-size: 1.7em; /* Increase font size */
    font-weight: bold; /* Make the text bold */
    color: #4CAF50; /* Use a green color matching the theme */
    margin: 10px 0; /* Add space around the heading */
    text-transform: uppercase; /* Transform text to uppercase */
    letter-spacing: 2px; /* Add spacing between letters */
    background: linear-gradient(to right, #4CAF50, #81C784); /* Gradient background */
    -webkit-background-clip: text; /* Use background for text */
    -webkit-text-fill-color: transparent; /* Make the text transparent to show the gradient */
    padding-bottom: 4px; /* Add some space below */
    border-bottom: 3px solid #4CAF50; /* Add a border underneath */
    display: inline-block; /* Make the heading a block element for styling */
}


.message {
	text-align: center;
	margin: 20px 0;
	color: #007BFF;
	font-size: 1.2em;
}

body, html {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f9;
}

nav {
	background-color: #4CAF50;
	padding: 1em 2em;
	display: flex;
	justify-content: space-around;
	align-items: center;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

nav a {
	color: #ffffff;
	text-decoration: none;
	font-weight: bold;
	padding: 0.5em 1em;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

nav a:hover {
	background-color: #367c39;
	color: #e8f5e9;
}

.user_msg {
	margin: 10px auto; /* Center the message horizontally */
	padding: 10px; /* Add space inside the box */
	width: 50%; /* Adjust the width of the message box */
	text-align: center; /* Align text to the center */
	background-color: #e7f3fe; /* Light blue background */
	border-left: 5px solid #4CAF50; /* Accent border on the left */
	color: #4CAF50; /* Darker text color */
	font-size: 0.8em; /* Slightly larger font size */
	line-height: 1.5; /* Improved line spacing */
	border-radius: 8px; /* Smooth rounded corners */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}

.user_msg h1 {
	margin: 0; /* Remove default margin */
	padding: 10px 0; /* Add space inside the heading */
	color: #4CAF50; /* Blue color for the heading text */
	font-size: 1.5em; /* Larger font size for headings */
}

nav {
	background-color: #4CAF50;
	padding: 1em 2em;
	display: flex;
	justify-content: space-around;
	align-items: center;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

nav a {
	color: #ffffff;
	text-decoration: none;
	font-weight: bold;
	padding: 0.5em 1em;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

nav a:hover {
	background-color: #367c39;
	color: #e8f5e9;
}
</style>
</head>
<body>

	<%
	@SuppressWarnings("unchecked")
	List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");

	if (users != null) {
	%>
	
	<nav >
		<a href="./users">ALL USER</a> 
		<a href="./sign-up-page">SIGN UP</a> 
		<a href="./login-page">SIGN IN</a> 
		<a href="./logout">LOGOUT</a>
	</nav>
	
	
	<div align="center">
		<h2>ALL USERS</h2>
		<table>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Password</th>
				<th colspan=2>Action</th>
			</tr>
			<%
			for (UserDTO user : users) {
			%>
			<tr>
				<td><%=user.getName()%></td>
				<td><%=user.getEmail()%></td>
				<td><%=user.getMobile()%></td>
				<td><%=user.getPassword()%></td>
				<td><a href="./edit-user?id=<%=user.getId()%>">Edit</a></td>
				<td><a href="./delete-user?id=<%=user.getId()%>">Delete</a></td>
			</tr>
			<%
			}
			}
			%>
		</table>
	</div>

	<div class="user_msg">
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<h1><%=message%></h1>
		<h1>Thank you for visiting...</h1>
		<%
		}
		%>
	</div>
</body>
</html>

