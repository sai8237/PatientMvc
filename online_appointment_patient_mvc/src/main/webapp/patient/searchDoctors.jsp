<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align:center;">

<h1> Hi ${patientName} </h1>

<h1>Doctors List</h1>
	<p><label for="timeDate">Enter Date :</label><br>
			<input type="text" name="dateTime" /> <br>
				   </p>
	<table border="2" width="70%" cellpadding="2" align="center">
	
	<tr><th>DoctorName</th><th>Category</th><th>Mobile Number</th><th>Fees</th><th>E-mail</th><th>Book</th></tr>
    <c:forEach var="doctor" items="${doctorList}"> 
    
    <tr> 
    <td>${doctor.name}</td>
    <td>${doctor.category}</td>
    <td>${doctor.mobile}</td>
    <td>${doctor.fee}</td>
    <td>${doctor.email}</td>
     <td><a href="booking/${doctor.name}/conf" >Book</a></td>
    </tr>
    </c:forEach>
    </table>
    <br/>

</body>
</html>