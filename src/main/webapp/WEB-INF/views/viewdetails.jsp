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
							  		<td><div class="img-circle img-responsive nopadding center_img" style="background-image: url(${productimage}); background-size: 280px 220px;background-repeat: no-repeat;width: 280px ; height: 220px;" ></div></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Product ID:</label></td>
							  		<td><label>${productId}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Name:</label></td>
							  		<td><label>${name}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Group Name:</label></td>
							  		<td><label>${groupName}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Description:</label></td>
							  		<td><label>${description}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Price:</label></td>
							  		<td><label>${price}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Quantity:</label></td>
							  		<td><label>${qty}</label></td>
							  	</tr>
							  	
							  	
							  </table>
							</div>
					    </div>
					</div>
					</div>
					
					
	                
					</form>
					
					<br>
					<br>
					
	                
				
				<br><br>

</body>