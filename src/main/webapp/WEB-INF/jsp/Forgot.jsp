<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Page</title>
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
    }
    h1{
    	margin-bottom:1rem;
        border-bottom: 3px solid #9e9e9e;
    	padding-bottom: 5px;
    	letter-spacing: 2px;
    }
    input[type=text], input[type=date] {
        width: calc(100% - 12px);
        padding: 8px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type=submit] {
        background-color: #4CAF50;
    	color: white;
    	margin-top:5px;
    	padding: 10px 20px;
    	border: none;
    	border-radius: 4px;
    	cursor: pointer;
    	font-size: 16px;
    	width: 80%;
    	place-self:center;
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
    }
    .wrong{
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
	<div class = "container">
		<h1>Password Reset</h1>
		<form action="forgot" method="post">
			<label for="name">Username:</label>
            <input type="text" id="name" name="name" placeholder="Enter Your Username (Email Id)" required>
            <label for="Date">Date Of Birth:</label>
            <input type="date" id="date" name="date" required>
            <input type="submit" value="Reset"/>
		</form>
		<div class="register-button">
			<p>Don't have an account? <a href="RegisterForm">Register</a></p>
    	</div>
	</div>
</body>
</html>