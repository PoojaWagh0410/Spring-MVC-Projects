<%@page import="com.qspiders.springMVC.dto.ContactDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style>
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
	border-radius: 8px; /* Smooth edges for the paragraph box */
	color: #555; /* Text color */
	font-size: 1.1em;
	line-height: 1.6;
}
</style>
</head>
<body>
	<nav >
		<a href="./add-contact-page">ADD CONTACT</a> 
		<a href="">DELETE CONTACT</a> 
		<a href="">EDIT CONTACT</a> 
		<a href="./contacts">ALL CONTACTS</a> 
		<a href="./logout">LOGOUT</a>
	</nav>

	<div class="msg">
		<h2>Welcome To Contact Manager</h2>
		<p>Welcome to the Contact Management System. Here, you can manage
			your contacts easily by adding, editing, viewing, or deleting them.</p>
	</div>
</body>
</html>
