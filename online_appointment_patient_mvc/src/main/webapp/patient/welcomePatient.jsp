<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align:center;">
    
<h1> Welcome  ${patientName} To Your Page </h1>
<h1>Search Doctor</h1>
  
       
       
       <form action="searchdoctor" method="get">
       <p>
			<p><label for="specialization">Category:</label><br>
			<input type="text" name="specialization" /> <br>
				   </p>
			<p><label for="reason">Reason:</label><br>
			<input type="text" name="reason" /> <br> </p>
			<input type="submit" value="Search" /> <br>
	</form> 
	<a href="http://localhost:8080/logout">Log out</a>
	
	
</body>
</html>