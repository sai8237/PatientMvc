<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Patient</title>
</head>
<style>
.jumbotron {
    padding:70px 30px 70px 30px;
    margin:40px auto;
    background: #9575CD ;
    color:floralwhite;
}
</style>
<body style="text-align:center;">


    <p><header class="jumbotron">
        <div class="container">
            <div class="row row-header">
                <div class="col-12 col-sm-6">
                    <h1> Welcome  ${patientName} </h1>
                </div>
                <div class="col-12 col-sm">
                </div>
            </div>
        </div>
    </header> </p>
    
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
	<a href="http://localhost:8087/logout">Log out</a>
	
	
</body>
</html>