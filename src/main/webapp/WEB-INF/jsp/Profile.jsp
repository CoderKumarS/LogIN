<%@page import = "in.sp.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
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
    .profile-container {
        max-width: 80%;
    	width: 75vh;
    	height: max-content;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .profile-header {
    	display: flex;
    	justify-content: flex-end;
    } 
    .edit{
    	display: grid;
    	place-content: center;
    	border:none;
    }
    .edit a{
    	background: blue;
    	text-decoration: none;
    	padding: 10px 20px;
    	border-radius: 5px;
    	color: white;
    	display:flex;
    	align-items:center; 
    	gap:0.5rem;
    }
    .edit a span{
    	font-size:large;
    }
    .edit a:hover{
    	background: #0000af;  
    }
    .profile-details {
        margin: 10px 0;
        height: 80%;
        display: flex;
    	flex-direction: column;
    	gap: 10px;
    }    
    .profile-details h3 {
        color: #333;
        height: 10%;
    }   
    .profile-details h3 span{
        font-size: larger;
	    font-family: cursive;
    	letter-spacing: 3px;
    }
    .hero-image {
		width: 100%;
        max-height: 400px;
        object-fit: cover;
        border-radius: 8px;
	}   
    .detail-label {
        font-weight: bold;
    }
    .detail-value {
        margin-left: 10px;
    }
    .exit{
    	display: grid;
    	place-content: center;
    	border:none;
    }
    .exit a{
    	background: red;
    	text-decoration: none;
    	padding: 10px 20px;
    	border-radius: 5px;
    	color: white;
    	display:flex;
    	align-items:center; 
    	gap:0.5rem;
    }
    .exit a span{
    	font-size:large;
    }
    .exit a:hover{
    	background: #b10000;  
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
	<%
		User user = (User) session.getAttribute("session_user");
	%>
    <div class="profile-container">
    	<div class ="profile-header">
    		<div class="exit">
    			<a href="delete">Delete<span class="material-symbols-outlined">delete</span></a>
        	</div>
        </div>        
        <div class="profile-details">
        <img src='https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_vZ5mSj7WQ_ssMvnajyZp7ZoP6l4OkD-mrDsnebuMoR9DLHOyEkRATqlEugdYR3UYm2j7bf9ooNdvuC9poahhCSvwyskUqbdWEFluk_7Ocwy9Wg3sj_PavYDxznUSe6Kksl-qjHr8pNpeDvX6VEEMwjbAFfB4isylGquWn-R_XnIpiR25YFM6Hp62OaS2A=w919-h516-p-k-no-nu'class="hero-image"/>
    		<div class="edit">
    			<a href="editForm">Edit<span class="material-symbols-outlined">edit</span></a>
        	</div>
        	<h3>Hello, Welcome <span><%= user.getName() %></span></h3>
            <p><span class="detail-label">Gender:</span> <span class="detail-value"><%= user.getGender() %></span></p>
            <p><span class="detail-label">Email:</span> <span class="detail-value"><%= user.getEmail() %></span></p>
            <p><span class="detail-label">City:</span> <span class="detail-value"><%= user.getCity() %></span></p>
            <p><span class="detail-label">Date-of-Birth:</span> <span class="detail-value"><%= user.getDob() %></span></p>
        </div>
        <div class="exit">
        	<a href="logout">Exit<span class="material-symbols-outlined">logout</span></a>
        </div>
    </div>
</body>
</html>
