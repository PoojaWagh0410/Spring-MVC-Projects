<%@page import="com.qspiders.springMVC.dto.ContactDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Page</title>
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
	padding: 20px;
}

table {
	width: 90%;
	border-collapse: collapse;
	margin: 20px 0;
	background-color: #fff;
}

th, td {
	padding: 12px;
	text-align: left;
	border: 1px solid #ddd;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

h1 {
	text-align: center;
	color: #333;
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

/* Style for the paragraph */
.msg h2 {
	width: 50%;
	margin: 2em auto; /* Centers the paragraph horizontally */
	padding: 1.5em;
	text-align: center; /* Aligns text to the center */
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Adds box shadow */
	border-radius: 8px; /* Smooth edges for the paragraph box */
	color: #555; /* Text color */
	line-height: 1.6;
}

.msg p {
	width: 50%;
	margin: 2em auto; /* Centers the paragraph horizontally */
	padding: 1.5em;
	text-align: center; /* Aligns text to the center */
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Adds box shadow */
	border-radius: 8px;
	/* Smooth eaaaaaaaaaaaaaaaaadges for the paragraph box */
	color: #555; /* Text color */
	font-size: 1.1em;
	line-height: 1.6;
}

/* Style for ALL CONTACTS heading */
h2 {
    text-align: center; /* Center the text */
    font-size: 1.6em; /* Larger font size */
    font-weight: bold; /* Bold text */
    color: #4CAF50; /* Green color matching the theme */
    margin: 10px 0; /* Add space around the heading */
    text-transform: uppercase; /* Transform text to uppercase */
    letter-spacing: 1.5px; /* Add space between letters */
    background: linear-gradient(to right, #4CAF50, #81C784); /* Gradient background for the text */
    -webkit-background-clip: text; /* Clip the background to text */
    -webkit-text-fill-color: transparent; /* Make text transparent to show gradient */
    border-bottom: 3px solid #4CAF50; /* Add an underline effect */
    display: inline-block; /* Keep the heading inline with custom styles */
    padding-bottom: 3px; /* Add padding below the text */
}

/* Style for Go to Home Page section */
h4 {
    text-align: center; /* Center-align the text */
    font-size: 1.2em; /* Slightly larger font size */
    margin: 20px auto; /* Center the element vertically */
    color: #333; /* Neutral dark color for text */
    font-weight: normal; /* Regular font weight for a subtle appearance */
}

h4 a {
    color: #4CAF50; /* Green color for the link */
    text-decoration: none; /* Remove underline */
    font-weight: bold; /* Bold text for emphasis */
    transition: color 0.3s ease, text-shadow 0.3s ease; /* Smooth transitions */
}

h4 a:hover {
    color: #367c39; 
    text-shadow: 0 0 5px rgba(55, 140, 65, 0.7); /* Add a subtle glow effect */
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

</style>
</head>
<body>


	<nav>
		<a href="./add-contact-page">ADD CONTACT</a> <a href="">DELETE
			CONTACT</a> <a href="">EDIT CONTACT</a> <a href="./contacts">ALL
			CONTACTS</a> <a href="./logout">LOGOUT</a>
	</nav>

	<%
	@SuppressWarnings("unchecked")
	List<ContactDTO> contacts = (List<ContactDTO>) request.getAttribute("contacts");

	if (contacts != null) {
	%>

	<div align="center">
		<h2>ALL CONTACTS</h2>
		<table>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Work</th>
				<th>Gender</th>
				<th>DOB</th>
				<th>Address</th>
				<th>Website</th>
				<th colspan=2>Action</th>
			</tr>
			<%
			for (ContactDTO contact : contacts) {
			%>
			<tr>
				<td><%=contact.getFirstName()%></td>
				<td><%=contact.getLastName()%></td>
				<td><%=contact.getEmail()%></td>
				<td><%=contact.getMobile()%></td>
				<td><%=contact.getWork()%></td>
				<td><%=contact.getGender()%></td>
				<td><%=contact.getDob()%></td>
				<td><%=contact.getAddress()%></td>
				<td><%=contact.getWebsite()%></td>
				<td><a href="./edit-contact?id=<%=contact.getId()%>">Edit</a></td>
				<td><a href="./delete-contact?id=<%=contact.getId()%>">Delete</a></td>
			</tr>
			<%
			}
			}
			%>
		</table>

		<h4>
			Go to <a href="./home-page">Home</a> page
		</h4>
	</div>

	<div class="user_msg">
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<h1>Thank you for visiting...</h1>
		<h1><%=message%></h1>

		<%
		}
		%>
	</div>
</body>
</html>

