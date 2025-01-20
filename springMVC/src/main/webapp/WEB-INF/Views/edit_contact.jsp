<%@page import="com.qspiders.springMVC.dto.ContactDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>

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

form input[type="text"], form input[type="email"], form input[type="number"]
	{
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

@media ( max-width : 500px) {
	form {
		width: 90%;
		padding: 15px 20px;
	}
}
</style>

</head>
<body>

	<%
	ContactDTO contact = (ContactDTO) request.getAttribute("contacts");
	%>
	<div align="center">
		<form action="./update-contact" method="post">
			<table>
				<tr>
					<td><b>ID :</b></td>
					<td><input type="text" name="id" value="<%=contact.getId()%>"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td><b>First Name :</b></td>
					<td><input type="text" name="first_name"
						value="<%=contact.getFirstName()%>"></td>
				</tr>
				<tr>
					<td><b>Last Name :</b></td>
					<td><input type="text" name="last_name"
						value="<%=contact.getLastName()%>"></td>
				</tr>
				<tr>
					<td><b>Email :</b></td>
					<td><input type="email" name="email"
						value="<%=contact.getEmail()%>"></td>
				</tr>
				<tr>
					<td><b>Mobile Number :</b></td>
					<td><input type="number" name="mobile"
						value="<%=contact.getMobile()%>"></td>
				</tr>
				<tr>
					<td><b>Work :</b></td>
					<td><input type="number" name="work"
						value="<%=contact.getWork()%>"></td>
				</tr>
				<tr>
					<td><b>Gender :</b></td>
					<td><label><input type="radio" name="gender"
							value="MALE" required> Male</label><label><input
							type="radio" name="gender" value="FEMALE"> Female</label> <label><input
							type="radio" name="gender" value="OTHERS"> Others</label></td>
				</tr>
				<tr>
					<td><b>Date Of Birth :</b></td>
					<td><input type="text" name="dob"
						value="<%=contact.getDob()%>"></td>
				</tr>
				<tr>
					<td><b>Address :</b></td>
					<td><input type="text" name="address"
						value="<%=contact.getAddress()%>"></td>
				</tr>
				<tr>
					<td><b>Website :</b></td>
					<td><input type="text" name="website"
						value="<%=contact.getWebsite()%>"></td>
				</tr>
				<tr></tr>
			</table>
			<input type="submit" value="UPDATE">
		</form>
	</div>
</body>
</html>