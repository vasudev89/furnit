<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		
		.error
		{
			color: #a94442;
			background-color: #f2dede;
			padding: 5px;
			//margin-bottom: 20px;
			border: 1px solid #ebccd1;
			border-radius: 4px;
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
					<script type="text/css">
					</script>
					
					<div class="container">
					<div class="row">
					    <div class="col-lg-12 col-centered">
					    	<div class="table-responsive">
					    	
					    	<c:if test="${success != null}">
			                <div class="alert alert-success">
			                	<p>${success}</p>
			                </div>
			                </c:if>
			                
			                <c:if test="${error != null}">
			                <div class="alert alert-danger">
			                	<p>${error}</p>
			                </div>
			                </c:if>
					    	
					    	<form:form action="InsertUser" method="POST" modelAttribute="addUser">
							  <table style="width: 80%;" class="table center">
							  	<tr>
							  		<td><form:label path="email" for="email">Email address:</form:label></td>
							  		<td><form:input path="email" type="email" class="form-control" id="email" autofocus="true"/></td>
							  		<td class="alert alert-danger"><form:errors path="email"/></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="username" for="username">Username:</form:label></td>
							  		<td><form:input path="username" type="text" class="form-control" id="username"/></td>
							  		<td class="alert alert-danger"><form:errors path="username"/></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="password" for="password">Password:</form:label></td>
							  		<td><form:input path="password" type="password" class="form-control" id="password"/></td>
							  		<td class="alert alert-danger"><form:errors path="password"/></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="cPassword" for="cPassword">Confirm Password:</form:label></td>
							  		<td><form:input path="cPassword" type="password" class="form-control" id="cpassword"/></td>
							  		<td class="alert alert-danger"><form:errors path="cPassword"/></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="phone" for="phone">Phone:</form:label></td>
							  		<td><form:input path="phone" type="phone" class="form-control" id="phone"/></td>
							  		<td class="alert alert-danger"><form:errors path="phone" /></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="address" for="address">Address:</form:label></td>
							  		<td><form:textarea path="address" class="form-control" id="address"></form:textarea></td>
							  		<td class="alert alert-danger"><form:errors path="address" /></td>
							  	</tr>
							  	
							  	<tr>
							  		<td colspan="2" >
							  		<div class="row">
									    <div class="col-md-2 col-md-offset-5"> <button type="submit" class="btn btn-default">Submit</button> </div>
									</div>
							  		</td>
							  	</tr>
							  	
							  </table>
							  </form:form>
							</div>
					    </div>
					</div>
					</div>
					
					
	                
					
					
					<br>
					
					
				<br><br>

</body>