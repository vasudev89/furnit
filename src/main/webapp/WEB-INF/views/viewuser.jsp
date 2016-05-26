<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
	
	<link rel="stylesheet" href="resources/references/css/bootstrap.min.css">
	
	<style>
		.center
		{
		    margin: auto;
		    width: 100%;
		    border: 0px solid #73AD21;
		    
		}
		
		.center_img
		{
		    margin: auto;
		    width: 100%;
		    border: 0px solid #73AD21;
		    
		}
		
		img
		{
		    display:block;
		    margin:auto;
		}
	</style>
	
</head>

<body>

	<script type="text/javascript" src="resources/references/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="resources/references/js/bootstrap.min.js"></script>

	<c:import url="/head"/>

	<!--  -->
	
	<br>
	<br>
	<br>
	<br>
	
	<div>                
                
    <br><br>
    <br>
    
    <!--  -->
    
    <br><br>
					<form role="form">
					
					<script type="text/css">
					</script>
					
					<div class="container">
					<div class="row">
					    <div class="col-lg-12 col-centered">
					    	<div class="table-responsive">
							  <table style="width: 80%;" class="table center">
							  	
							  	<tr>
							  		<td><label>Email:</label></td>
							  		<td><label>${email}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Name:</label></td>
							  		<td><label>${username}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Role:</label></td>
							  		<td><label>${role}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Phone:</label></td>
							  		<td><label>${phone}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Address:</label></td>
							  		<td><label>${address}</label></td>
							  	</tr>
							  	
							  </table>
							</div>
					    </div>
					</div>
					</div>
					
					
	                
					</form>
					
					<br>
					<br>
					<br>
					
				
				<br><br>

</body>