<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Registration</title>
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
                    <h1>Patient Registration</h1>
                </div>
                <div class="col-12 col-sm">
                </div>
            </div>
        </div>
    </header> </p>
     
       
       
       <form action="processregister" method="post">
            <p><label for="username">Username:</label><br>
			<input type="text" name="name" /> <br></p>
			<p><label for="password">Password:</label><br>
			<input type="password" name="password" /> <br> </p>
			<p><label for="email">Email:</label><br>
			<input type="email" name="email" /> <br></p>
			<p><label for="age">Age:</label><br>
			<input type="number" name="age" /> <br></p>
			  <p><label for="gender">Gender:</label><br>
				  <select name="gender" id="gender">
				    <option value="opel">Male</option>
				    <option value="audi">Female</option>
				  </select> </p>
			<p><label for="mobile">Mobile Number:</label><br>
			<input type="number" name="mobile" /> <br>	</p>
				
			<input type="submit" value="Register" /> <br>
	</form>
	<a href="http://localhost:8087/login">Login Here</a><br>
	
	
	
</body>
</html>