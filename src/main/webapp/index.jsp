<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        html,body{
            width: 100%;
    		height: 100%;
    		display: grid;
    		align-items: center;
        }
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .container {
            max-width: 80%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1{
            padding-bottom: 2px;
    		letter-spacing: 2px;
    		font-weight: 900;
        }
        .hero-image {
            width: 100%;
            max-height: 390px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .features {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .feature {
            flex: 1;
            text-align: center;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            margin: 0 10px;
        }
        .feature h2 {
            margin-bottom: 10px;
            color: #333;
        }
        .feature p {
            color: #666;
        }
        .cta-section {
            text-align: center;
            margin-top: 20px;
        }
        .cta-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }
        .cta-button:hover {
            background-color: #45a049;
        }
        @media (max-width: 768px) {
  			.features {
    			flex-direction: column;
    			gap:10px; /* Example color change for mobile devices */
  			}
		}
    </style>
</head>
<body>
	<div class="container">
        <div class="header">
            <h1>Welcome to Our Website</h1>
            <p>Java Project for basic CRUD operation.</p>
        </div>
        <img src="https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_u8bBevDOSdwMoq77rNESoGGyGTqGxDkSZPa7ssDBDjFAEd43uvuqL08JOmNdcYeG2V8-GUvEEQSed2FXC9mjbXKOVvdXbKfqm6bCtUUAZqSAGERZYMKn0WwQFY90CvN38A1ICGbf1N_dQivUxzjr-I6b8=w919-h516-p-k-no-nu" alt="Hero Image" class="hero-image">
        <div class="features">
            <div class="feature">
                <h2>Feature 1 <br/>(Create)</h2>
                <p>We can Create a User.</p>
            </div>
            <div class="feature">
                <h2>Feature 2 <br/>(Read)</h2>
                <p>We can Login using User details.</p>
            </div>
            <div class="feature">
                <h2>Feature 3 <br/>(Update)</h2>
                <p>We can Change the password of User.</p>
            </div>
            <div class="feature">
                <h2>Feature 4 <br/>(Delete)</h2>
                <p>We can Delete the User.</p>
            </div>
        </div>
        <div class="cta-section">
            <a href="LoginForm" class="cta-button">Learn More</a>
        </div>
    </div>
</body>
</html>