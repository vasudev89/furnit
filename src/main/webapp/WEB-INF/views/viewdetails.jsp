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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/references/js/angular.min.js"></script>

<script type="text/javascript">
'use strict';
	
	var myApp = angular.module("myApp",[]);
	
	///////////////////////////////////////
	
	myApp.factory('UserService', ['$http', '$q', function($http, $q){
	 
    return {
         
            fetchAllItems: function() {
                    return $http.post('http://localhost:9002/furnit/flows/fetchitems/')
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching items');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            createItem: function(item){
                    return $http.post('http://localhost:9002/furnit/flows/createItem/', item)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while creating item');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            updateItem: function(item, id){
                    return $http.post('http://localhost:9002/furnit/flows/createItem/'+id, item)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while updating item');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            deleteItem: function(id){
                    return $http.post('http://localhost:9002/furnit/flows/deleteItem/'+id)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while deleting item');
                                        return $q.reject(errResponse);
                                    }
                            );
            }
         
    };
 
}]);

//////////////////////////////////////////////////
	
///////////////////////////////////////
	
	myApp.controller("myCtrl", ['$scope' , '$timeout' , 'UserService' ,function($scope , $timeout , $UserService){
		
		$scope.data = [];
		
		<c:if test="${not empty datavalue}">
		$scope.data = ${dataValue};
		</c:if>
		
		$scope.item = {ProductID: '${productId}' ,Name: '${name}',Address:"${address}", UserName: '${pageContext.request.userPrincipal.name}' , Price: '${price}' , Qty: 1, BillingAddress: "${address}" };
        
        console.log( $scope.item );
        
        $scope.AddToCart = function()
		{
        	var resp = $UserService.createItem($scope.item)
            .then(
	            self.fetchAllItems, 
	                    function(errResponse){
	                         console.error('Error while creating item.');
	                    } 
        	);
        	
        	console.log(resp);
        	
        	$timeout(function()
        	{
        		$("#beginflow").submit();
        	}, 500);
        	
		}
		
	}]);
	
	
</script>

<body ng-app="myApp" ng-controller="myCtrl">

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
							  		<td colspan="2"><div class="img-circle img-responsive nopadding center_img" style="background-image: url(${productimage}); background-size: 280px 220px;background-repeat: no-repeat;width: 280px ; height: 220px;" ></div></td>
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
							  		<td><label>${price} &nbsp; INR</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Quantity:</label></td>
							  		<td><input type="number" class="form-control" style="text-align: center;" min="1" max="100" value="1" ng-model="item.Qty" /> </td>
							  	</tr>
							  	
							  	<tr>
							  		<td></td>
							  		
							  		<c:choose>
							  			<c:when test="${not empty USER}">
							  				<td><button type="button" ng-click="AddToCart();" class="btn btn-success btn-responsive">Add To Cart</button> </td>	
							  			</c:when>
							  			
							  			<c:otherwise>
							  				<td>
							  				<button type="button" ng-click="AddToCart();" class="btn btn-success btn-responsive" disabled>Add To Cart</button>
							  				<span style="color: rgb(128,0,0); font-weight: bold; font-style: italic;" >&nbsp;&nbsp;&nbsp;Please Login as a Normal User to Begin Purchase</span>
											</td>
							  			</c:otherwise>
							  		</c:choose>
							  		
							  		
							  		
							  	</tr>
							  	
							  	
							  </table>
							</div>
					    </div>
					</div>
					</div>
					
					
	                
					</form>
					
					<form id="beginflow" action="initiateFlow" method="get" >
						<input type="hidden" name="user" value="${not empty pageContext.request.userPrincipal}" />
					</form>
					
					<br>
					<br>
					
	                
				
				<br><br>

</body>