<%@page import = "in.sp.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
<style>
	*{
		margin:0;
		padding:0;
		box-sizing:border-box;
	}
	body,html{
		width:100%;
		height:100%;
	}
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        padding: 20px;
		display: grid;
    	place-content: center;
    }
    .container {
        max-width: 80%;
    	width: 75vh;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    form {
        margin-bottom: 10px;
        display:grid;
        gap:1px;
    }
    h1{
    	margin-bottom:1rem;
    	border-bottom: 3px solid #9e9e9e;
    	padding-bottom: 5px;
    	letter-spacing: 2px;
    }
    input[type=text], input[type=email], input[type=password], input[type=date]{
        width: calc(100% - 12px);
        padding: 8px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type=radio] {
        margin: 5px 10px 5px 0;
    }
    input[type=submit] {
        background-color: #4CAF50;
    	color: white;
    	margin-top: 1rem;
    	padding: 10px 20px;
    	border: none;
    	border-radius: 4px;
    	cursor: pointer;
    	font-size: 16px;
    	width: 80%;
    	place-self:center;
    }
    .gen{
    	display: grid;
    	grid-template-columns: 0.5fr 0.8fr 0.8fr;
    }
    input[type=submit]:hover {
        background-color: #45a049;
    }
    .register-button {
        text-align: center;
        margin-top: 1rem;
    }
    .register-button a {
        text-decoration: none;
        color: #007bff;
    }
    .register-button a:hover {
        color: #0056b3;
    }
    .right{
    	color:green;
    	text-align: center;
    	font-size: larger;
    	letter-spacing: 1px;
    	font-weight: 800;
    	margin-bottom: 1rem;
    }.wrong{
    	color:red;
    	text-align: center;
    	font-size: larger;
    	letter-spacing: 1px;
    	font-weight: 800;
    	margin-bottom: 1rem;
    }
</style>
</head>
<body>
	<%
		User user = (User) session.getAttribute("session_user");
	%>
    <div class="container">
        <h1>Edit Form</h1>
        <form action="edit" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= user.getName() %>" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" readonly>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>
            <div class ="gen">
            	<label>Gender:</label>
            	<%
					if(user.getGender().equals("Male")){
				%>
            	<div>
            		<input type="radio" id="male" name="gender" value="Male" checked>
            		<label for="male">Male</label>
            	</div>
            	<div>
            		<input type="radio" id="female" name="gender" value="Female">
            		<label for="female">Female</label>
            	</div>
            	<%
					}else{
				%>
            	<div>
            		<input type="radio" id="male" name="gender" value="Male">
            		<label for="male">Male</label>
            	</div>
            	<div>
            		<input type="radio" id="female" name="gender" value="Female" checked>
            		<label for="female">Female</label>
            	</div>
            	<%
					}
				%>
            </div>
            <label for="Date">Date Of Birth:</label>
            <input type="date" id="date" name="date" placeholder="Enter the Date of Birth" value="<%= user.getDob() %>" required>
            <label for="city">City:</label>
            <input type="text" id="city" name="city" placeholder="Enter the City" value="<%= user.getCity() %>" required>
            <input type="submit" value="Save">
        </form>
    </div>
</body>
</html>
