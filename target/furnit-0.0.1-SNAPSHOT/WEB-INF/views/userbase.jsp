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
		
		$scope.count = 0;
		
		//$scope.data = data;
		$scope.data = ${dataValue};
		//$scope.searchKeyword = ${searchKey};
		$scope.currItem = {Product_Id:"117", Group_Name:"beds", Name:"bed", Price:"66", Qty:"", Description:"", Image:"resources/images/beddisplay.jpg"};
		
		$scope.userdata = JSON.stringify( $scope.data );
		
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
		
		$scope.showAll = function()
		{
			console.log(JSON.stringify( $scope.data ));
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
		
		$scope.submitForUpdate = function()
		{	
			//alert('Bale');
			
			console.log( $scope.userdata );
	
			document.getElementById("sample").value = JSON.stringify($scope.data) ;
			
			$timeout(function()
			{	
				$("#ubh").submit();
			}, 200);
			
			//console.log(document.getElementById("sample").value);
			
		}
		
		$scope.roles = {
			    "1" : "User",
			    "2" : "Admin"
			};
		
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
    
    <!--  -->
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
									
										<div class="col-xs-12"><input type="text" id="search" value="" placeholder="Enter Search Keyword..." class="form-control" ng-model="searchKeyword.Username" ng-init="searchKeyword ='${searchKey}'" /></div>
										
										<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-2"> <button type="button" class="btn btn-primary btn-responsive" ng-click="submitForUpdate();">Update</button> </div>
										
									
									</div>
									
									
									<div class="rTableHeading row">
									
										<div class="col-xs-4">Name</div>
										<div class="col-xs-2">Role</div>
										<div class="col-xs-2">Active</div>
										<div class="col-xs-2">Delete</div>
										<div class="col-xs-2">View Details</div>
									
										<div style="width: 98%; height: 1px; background-color: #CCCCCC;" class="center"></div>
									
									</div>
				
									<form:form id="ubh" action="UpdateUsers" method="POST" modelAttribute="updateUsers">
										<form:input path="usersStatus" id="sample" type="hidden" value=""/>
									</form:form>
									
									<div ng-repeat="x in data | filter: searchKeyword" ng-init="number = countInit()" class="row" >
									
										
									
										<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-4">{{ x.Username }}</div>
										
											
										<%--<form:input path="groupName" type="hidden" id="igname" value="{{ x.Group_Name }}"/> --%>
										
										<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-2">
										<select ng-init="roles[x.Role]" ng-model="data[number].Role">
										    <option value='1'>User</option>
										    <option value='2'>Admin</option>
										    
										</select>
										
										</div>
										<%-- <form:input path="name" type="hidden" id="iname" value="{{ x.Name }}"/> --%>
										
										<%-- <form:input path="price" type="hidden" id="iprice" value="{{ x.Price }}"/>
										<form:input path="qty" type="hidden" id="iqty" value="{{ x.Qty }}"/>
										<form:input path="description" type="hidden" id="idescription" value="{{ x.Description }}"/> --%>
										
										<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-2"><input type="checkbox" checked="x.Active" ng-model="data[number].Active"/></div>
										<%-- <form:input path="image" type="hidden" id="iimage" value="{{ x.Image }}"/> --%>
										
										<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-2"> <div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-2"><input type="checkbox" value="{{x.Delete}}" ng-model="data[number].Delete"/></div> </div>
										<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-2"> <button type="button" class="btn btn-primary btn-responsive" ng-click="submitForView(number)">View</button> </div>
										
										<div style="width: 98%; height: 1px; background-color: #CCCCCC;" class="center"></div>
									
										
									
									</div>
					
									
									
								</div>
				
							
				
						</div>
				<!--  -->
	            
    <!--  -->
    <br><br>		
    				
    	<form:form id="viewdetails" action="ViewUser" method="POST" modelAttribute="viewUser">
					
					<form:input path="username" type="text" ng-show="false" ng-model="currItem.Username"/>
					   
		</form:form>
    				
				
				
	<br><br>

</body>