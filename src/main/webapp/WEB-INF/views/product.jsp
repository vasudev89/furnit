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
		    width: 80%;
		    border: 0px solid #73AD21;
		    
		}
		
		.center_img
		{
		    margin: auto;
		    width: 100%;
		    border: 0px solid #73AD21;
		    
		}
		
		.btn-responsive1
		{
		    white-space: normal !important;
		    word-wrap: break-word;
		}
		
		img
		{
		    display:block;
		    margin:auto;
		}
		
		//
		
		.animate-hide {
		 -webkit-transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 2s;
		    -moz-transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 2s;
		    -o-transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 2s;
		    transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 2s;
		  line-height:20px;
		  opacity:1;
		  padding:10px;
		  border:1px solid black;
		  background:white;
		}
		
		.animate-hide.ng-hide {
		  line-height:0;
		  opacity:0;
		  padding:0 10px;
		}
		
	</style>
	
</head>

<script type="text/javascript" src="resources/references/js/angular.min.js"></script>

<script type="text/javascript">
	var myApp = angular.module("myApp",[]);
	myApp.controller("myCtrl",function($scope ,$timeout){
		
		$scope.edit = true;
		
		$scope.file_display = 'Choose Image';
		
		$scope.count = 0;
		
		//$scope.data = data;
		$scope.data = ${dataValue};
		//$scope.searchKeyword = ${searchKey};
		$scope.currItem = {Product_Id:"117", Group_Name:"beds", Name:"bed", Price:"66", Qty:"", Description:"", Image:"resources/images/beddisplay.jpg"};
		$scope.raiseEdit = function(arg)
		{
			if( $scope.edit )
	    	{
	    		$("#editForm").animate({height: '+=25vw'}, "fast");
	    		$scope.edit = !$scope.edit;
	    	}
			
			$scope.currItem = $scope.data[arg];
		};
		
		$scope.killEdit = function()
		{
			if( !$scope.edit )
	    	{
	    		$("#editForm").animate({height: '0vw'}, "fast");
	    		$scope.edit = !$scope.edit;
	    	}
		};
		
		$scope.countInit = function()
		{
			return $scope.count++;
		}
		
		$scope.fileNameChaged = function()
		   {
		        alert("select file");
		   }
		
		$scope.submitForView = function(arg)
		{
			$scope.currItem = $scope.data[arg];
			
			console.log($scope.currItem);
			
			$timeout(function()
			{
				$("#viewdetails").submit();
			}, 200);
			
		}
		
	});
	
	
</script>

<body ng-app="myApp" ng-controller='myCtrl'>

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
    <c:if test="${not empty ADMIN}">
    <div id='add' style="position: absolute; left: 0px;  width: 4vw; top: 100px; z-index: 3; background-color: #EEEEEE; box-shadow: 5px 5px 20px #333333;">
	
		<button id="show_hide_add" style="z-index: 2; bottom: 0px; right: -50px; position: absolute; width: 50px; height: 100%; background-color: rgb(128,0,0); color: #FFFFFF; box-shadow: 2px 2px 20px #000000; border: 1px solid #FFC706; font-style: italic;font-weight: bold;font-size: 20px;font-family: Segoe UI, Tahoma, sans-serif; outline: none; padding-left: 5px; padding-right: 5px; "  > &nbsp; Add &nbsp;</button>
	
		<!--  -->
		<form:form action="InsertItem?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" method="POST" modelAttribute="addItem">
					
					<script type="text/css">
					</script>
					
					<br><br>
					<br>
					
					    	<div id="add_form" style="width: 0vw;" class="table-responsive">
							  <table style="width: 80%; bottom: 0px;" class="table center">
							  	<tr>
							  		<td><form:label path="name" for="name">Name:</form:label></td>
							  		<td><form:input path="name" type="text" class="form-control" id="name"/></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="groupName" for="groupName">Group Name:</form:label></td>
							  		<td><form:input path="groupName" type="text" class="form-control" id="group_name"/></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="description" for="description">Description:</form:label></td>
							  		<td><form:textarea path="description" class="form-control" id="description" ></form:textarea></td>
							  	</tr>
							  	
							  	
							  	<tr>
							  		<td><form:label path="price" for="price">Price:</form:label></td>
							  		<td><form:input path="price" type="text" class="form-control" id="price"/></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="image" for="image">Image:</form:label></td>
							  		<td>
							  		<label class="form-control"><span id="file_display">Choose Image</span><span style="position: relative; "><form:input path="file" onchange="changeFileDisplay();" type="file" style="opacity:0;" class="form-control"  id="imageFile"/></span></label>
							  		
							  		<script type="text/javascript">
							  			
							  			function changeFileDisplay()
							  			{
							  				document.getElementById("file_display").innerHTML = $('#imageFile').val();;
							  			}
							  		
							  		</script>
							  		
							  		</td>
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
					    
					<br><br>
					<br><br>
					<br>
					
	                
		</form:form>
		<!--  -->
		
	</div>
    </c:if>
    <!--  -->
    <script type="text/javascript">

    	var slide = true;
    	
	    $("#show_hide_add").click(function(){
	        var div = $("#add");
	        
	        if( slide )
	        {
	        	div.animate({width: '+=50vw'}, "fast");
	        	$("#add_form").animate({width: '+=50vw'}, "fast");
	        	slide = !slide;
	        }
	        else
	       	{
	        	div.animate({width: '-=50vw'}, "fast");
	        	$("#add_form").animate({width: '0vw'}, "fast");
	        	slide = !slide;
	        }
	        	
	        
	    }); 
	    
	    
	    
		
	</script>
    <!--  -->
    
    <div class="container">
					<div class="row">
					<div class="col-lg-6 center">
					
					
					</div>
					</div>
					</div>
					
					<br><br>
					
					<!--  -->
	                <!--  -->
					
					
					
					<div class="container center" >
				
								<div style=" overflow-x: none; width: 100%; font-style: italic; font-weight: bold; font-size: 1.2vw; font-family: Segoe UI, Tahoma, sans-serif;" class="center">
									
									<div class="rTableHeading row">
									
										<div class="col-xs-12"><input type="text" id="search" value="" placeholder="Enter Search Keyword..." class="form-control" ng-model="searchKeyword" ng-init="searchKeyword ='${searchKey}'" /></div>
										
										
									
									</div>
									<br><br>
									
									<div class="rTableHeading row">
									
										<c:choose>
											
											<c:when test="${not empty ADMIN}">
											
												<div class="col-xs-2">Product Id</div>
												<div class="col-xs-2">Name</div>
												<div class="col-xs-2">Image</div>
												<div class="col-xs-2">Edit</div>
												<div class="col-xs-2">Delete</div>
												<div class="col-xs-2">View Details</div>
											
											</c:when>
											
											<c:otherwise>
											
												<div class="col-xs-3">Product Id</div>
												<div class="col-xs-3">Name</div>
												<div class="col-xs-3">Image</div>
												<div class="col-xs-3">View Details</div>
											
											</c:otherwise>
											
										</c:choose>
										
										<div style="width: 98%; height: 1px; background-color: #CCCCCC;" class="center"></div>
									
									</div>
				
									
								
									<div ng-repeat="x in data | filter: searchKeyword" ng-init="number = countInit()" class="row" >
									
									
										<form:form action="DeleteItem" method="POST" modelAttribute="deleteItem">
									
										<c:choose>
											
											<c:when test="${not empty ADMIN}">
												
											
												<div class="col-xs-2"><div style="padding-top: 2%;padding-bottom: 2%;" >{{ x.Product_Id }}</div></div>
												<div class="col-xs-2"><div style="padding-top: 2%;padding-bottom: 2%;" >{{ x.Name }}</div></div>
												<div class="col-xs-2"><div style="padding-top: 2%;padding-bottom: 2%;" ><img ng-src="{{ x.Image }}" width="120" height="80" class="img-circle img-responsive"></img></div></div>
												<div class="col-xs-2"><div style="padding-top: 2%;padding-bottom: 2%;" > <button type="button" class="btn btn-primary btn-responsive" ng-click="raiseEdit(number);">Edit</button> </div></div>
												<div class="col-xs-2"><div style="padding-top: 2%;padding-bottom: 2%;" > <button type="submit" class="btn btn-primary btn-responsive">Delete</button> </div></div>
												<div class="col-xs-2"><div style="padding-top: 2%;padding-bottom: 2%;" > <button type="button" class="btn btn-primary btn-responsive" ng-click="submitForView(number)">View</button> </div></div>
											
											</c:when>
											
											<c:otherwise>
											
												<div class="col-xs-3"><div style="padding-top: 2%;padding-bottom: 2%;" >{{ x.Product_Id }}</div></div>
												<div class="col-xs-3"><div style="padding-top: 2%;padding-bottom: 2%;" >{{ x.Name }}</div></div>
												<div class="col-xs-3"><div style="padding-top: 2%;padding-bottom: 2%;" ><img ng-src="{{ x.Image }}" class="img-circle img-responsive"></img></div></div>
												<div class="col-xs-3"><div style="padding-top: 2%;padding-bottom: 2%;" > <button type="button" class="btn btn-primary btn-responsive" ng-click="submitForView(number)">View</button> </div></div>
											
											</c:otherwise>
											
										</c:choose>
									
										
										
										<form:input path="productId" type="hidden" id="ipid" value="{{ x.Product_Id }}"/>
										<form:input path="groupName" type="hidden" id="igname" value="{{ x.Group_Name }}"/>
										
										
										<form:input path="name" type="hidden" id="iname" value="{{ x.Name }}"/>
										
										<form:input path="price" type="hidden" id="iprice" value="{{ x.Price }}"/>
										<form:input path="qty" type="hidden" id="iqty" value="{{ x.Qty }}"/>
										<form:input path="description" type="hidden" id="idescription" value="{{ x.Description }}"/>
										
										<form:input path="image" type="hidden" id="iimage" value="{{ x.Image }}"/>
										
										<div style="width: 98%; height: 1px; background-color: #CCCCCC;" class="center"></div>
									
										</form:form>
									
									</div>
					
									
									
								</div>
				
							
				
						</div>
				<!--  -->
	            
    <!--  -->
    <br><br>		
    
    <!--  -->
    
		<form:form action="EditItem?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" method="POST" modelAttribute="editItem">
					
					<script type="text/css">
					</script>
					
					<br><br>
					<br>
					
					    	<div id="editForm" style="position: fixed; width: 100%; height: 0%; bottom: 0vw; background-color: #EEEEEE; box-shadow: 0px -5px 20px #000000;" class="table-responsive">
							  
							  
							  
							  
							  <form:input path="productId" type="text" ng-show="false" ng-model="currItem.Product_Id"/>
							  
							  <table style="width: 80%; bottom: 0px;" class="table center">
							  	<tr>
							  		<td>
							  			<div style="padding-top: 2%;padding-bottom: 2%;" >
											<button type="button" class="btn btn-primary btn-responsive" ng-click="killEdit()">Close</button> 
								  			&nbsp;&nbsp;&nbsp;
								  			<button type="submit" class="btn btn-primary btn-responsive">Submit</button> 
								  		</div>
									</td>
							  		
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="name" for="name">Name:</form:label></td>
							  		<td><form:input path="name" type="text" class="form-control" id="name" ng-model="currItem.Name"/></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="groupName" for="groupName">Group Name:</form:label></td>
							  		<td><form:input path="groupName" type="text" class="form-control" id="group_name" ng-model="currItem.Group_Name"/></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="description" for="description">Description:</form:label></td>
							  		<td><form:textarea path="description" class="form-control" id="description" ng-model="currItem.Description"></form:textarea></td>
							  	</tr>
							  	
							  	
							  	<tr>
							  		<td><form:label path="price" for="price">Price:</form:label></td>
							  		<td><form:input path="price" type="text" class="form-control" id="price" ng-model="currItem.Price" /></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><form:label path="image" for="image">Image:</form:label></td>
							  		<td>
							  		
							  			<label class="form-control"><span id="file_display1">Choose Image</span><span style="position: relative; "><form:input path="file" onchange="changeFileDisplay1();" type="file" style="opacity:0;" class="form-control"  id="imageFile1"/></span></label>
							  		
								  		<script type="text/javascript">
								  			
								  			function changeFileDisplay1()
								  			{
								  				document.getElementById("file_display1").innerHTML = $('#imageFile1').val();;
								  			}
								  		
								  		</script>
							  		
									</td>
							  	</tr>
							  	
							  </table>
							  
							</div>
					    
					<br><br>
					<br><br>
					<br><br><br><br><br>
					
	                
		</form:form>
		<!--  -->
		
		<!--  -->
		<form:form id="viewdetails" action="ViewDetails" method="POST" modelAttribute="viewItem">
					
					<form:input path="productId" type="text" ng-show="false" ng-model="currItem.Product_Id"/>
					<form:input path="name" type="text" ng-show="false" class="form-control" id="name" ng-model="currItem.Name"/>
					<form:input path="groupName" type="text" ng-show="false" class="form-control" id="group_name" ng-model="currItem.Group_Name"/>
					<form:textarea path="description" ng-show="false" class="form-control" id="description" ng-model="currItem.Description"></form:textarea>
					<form:input path="price" ng-show="false" type="text" class="form-control" id="price" ng-model="currItem.Price" />
					<form:input path="price" ng-show="false" type="text" class="form-control" id="price" ng-model="currItem.Qty" />
					<form:input path="image" ng-show="false" type="text" class="form-control" id="image" ng-model="currItem.Image" /></td>
					   
		</form:form>
		<!--  -->
    	
		
</body>