<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/references/css/bootstrap.min.css">
	
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
	
	myApp.controller("myCtrl", ['$scope', '$timeout', 'UserService' ,function($scope , $timeout , $UserService){
		
		$scope.data = [];
		
		<c:if test="${not empty datavalue}">
		$scope.data = ${dataValue};
		</c:if>
		
		$UserService.fetchAllItems().then(
			    function(result) {
			    	$scope.data = result;
			        console.log(result);
			     }
			 );;
		
		console.log($scope.data);
		
		$scope.item = {ProductID: '${productId}' ,Name: '${name}',Address:'', UserName: '${pageContext.request.userPrincipal.name}' , Price: '${price}' , Qty: 1};
        
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
		}
	
        $scope.countInit = function()
		{
			return $scope.count++;
		}
        
        $scope.deleteItem = function(arg)
		{
			//alert(arg);
			$UserService.deleteItem(arg).then(
				    function(result) {
				    	$scope.data = result;
				        console.log(result);
				     }
				 );
		}
        
        $scope.goToProducts = function()
        {
        	$("#products").submit();            
        }
        
        $scope.goToCheckout = function()
        {
        	$("#checkout").submit();            
        }
        
        
	}]);
	
	
</script>
<body ng-app="myApp" ng-controller="myCtrl">

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/references/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/references/js/bootstrap.min.js"></script>

	<c:import url="/head"/>

	<!--  -->
	
	<br>
	<br>
	<br>
	<br>
	
	<div>                
                
    <br><br>
    
    <!--  -->
    
    <br><br>
					
					
					<script type="text/css">
					</script>
					
					<div class="container">
						<div class="row">
					    	<div class="col-lg-12 col-centered">
					    		<div class="row">
					    		
					    			<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-3"> </div>
					    			
					    			<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-3"> <button style="box-shadow: 5px 5px 10px #555555; font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;" type="button" class="btn btn-success btn-responsive center" ng-click="goToProducts();"><span class="glyphicon glyphicon-chevron-left" ></span> &nbsp;&nbsp; Continue Shopping</button> </div>
					    			<form id="products" action="${flowExecutionUrl}&_eventId=goToProducts" method="post" >
										<input type="hidden" name="user" value="${not empty pageContext.request.userPrincipal}" />
									</form>
									
									<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-3"> <button style="box-shadow: 5px 5px 10px #555555; font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;" type="button" class="btn btn-danger btn-responsive center" ng-click="goToCheckout();" >Checkout &nbsp;&nbsp; <span class="glyphicon glyphicon-chevron-right" ></span></button> </div>
									<form id="checkout" action="${flowExecutionUrl}&_eventId=goToCheckout" method="post" >
										<input type="hidden" name="user" value="${not empty pageContext.request.userPrincipal}" />
									</form>
									
									<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-3"> </div>
					    		
					    		</div>
							</div>
						</div>
					</div>
					
					<br><br>
					
					<div class="container">
					<div class="row">
					    <div class="col-lg-12 col-centered">
					    
					    	
					    
					    	<div class="table-responsive" ng-repeat="x in data" ng-init="number = countInit()">
							  <table style="width: 80%;" class="table center">
							  	
							  	<tr>
							  		<td colspan="2"><div class="img-circle img-responsive nopadding center_img" style="background-image: url( ${pageContext.request.contextPath}/resources/images/image_{{x.ProductID}}.jpg); background-size: 280px 220px;background-repeat: no-repeat;width: 280px ; height: 220px;" ></div></td>
							  	</tr>
							  	
							  	<tr>
							  		<td colspan="2">
							  		<div class="row">
					    		
					    				<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-4 "></div>
						    			<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-4 "> <button style="box-shadow: 5px 5px 10px #555555; font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;" type="button" ng-click="deleteItem(x.CartID)" class="btn btn-primary btn-responsive center"><span class="glyphicon glyphicon-remove" ></span>&nbsp;&nbsp;Delete</button> </div>
										<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-4 "></div>
										
					    			</div>
									</td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Product ID:</label></td>
							  		<td><label>{{x.ProductID}}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Name:</label></td>
							  		<td><label>{{x.Name}}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Price:</label></td>
							  		<td><label>{{x.Price}}</label></td>
							  	</tr>
							  	
							  	<tr>
							  		<td><label>Quantity:</label></td>
							  		<td><label>{{x.Qty}}</label></td>
							  	</tr>
							  	
							  </table>
							  
							  <br><br>
							  
							</div>
					    </div>
					</div>
					</div>
					
					
	                
					
					<br>
					<br>
					<br>
					
				
				<br><br>

</body>