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
							  		<td><label for="email">Email address:</label></td>
							  		<td><input type="email" class="form-control" id="email"></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label for="message">Message:</label></td>
							  		<td><input type="text" class="form-control" id="message"></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label for="description">Description:</label></td>
							  		<td><textarea class="form-control" id="description"></textarea></td>
							  	</tr>
							  	
							  	<tr>
							  		<td colspan="2" >
							  		<div class="row">
									    <div class="col-md-2 col-md-offset-5"> <button type="submit" class="btn btn-default">Submit</button> </div>
									</div>
							  		</td>
							  	</tr>
							  	
							  </table>
							</div>
					    </div>
					</div>
					</div>
					
					
	                
					</form>
					
					
</body>