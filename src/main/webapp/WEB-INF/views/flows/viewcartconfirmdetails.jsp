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
                    return $http.post('http://localhost:9001/furnit/flows/fetchitems/')
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
                    return $http.post('http://localhost:9001/furnit/flows/createItem/', item)
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
                    return $http.post('http://localhost:9001/furnit/flows/createItem/'+id, item)
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
            
            updateAll: function(item){
                return $http.post('http://localhost:9001/furnit/flows/updateAddresses/', item)
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
                    return $http.post('http://localhost:9001/furnit/flows/deleteItem/'+id)
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
	
	myApp.controller("myCtrl", ['$scope', 'UserService' ,function($scope , $UserService){
		
		$scope.data = [];
		
		$scope.address = {shippingAddress : "${shippingAddress}" , billingAddress : "${billingAddress}" };
		
		<c:if test="${not empty datavalue}">
		$scope.data = ${dataValue};
		</c:if>
		
		$scope.updated = '';
		
		$UserService.fetchAllItems().then(
			    function(result) {
			    	$scope.data = result;
			        console.log($scope.data[0]);
			        
			        $scope.address = {shippingAddress : $scope.data[0].Address , billingAddress : $scope.data[0].BillingAddress };
			        
			        $scope.totalPrice = 0;
					
					angular.forEach($scope.data, function(value, key) {
						  
							//console.log(value.Price);
							
								$scope.totalPrice += parseInt(value.Price * value.Qty);
						});
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
        
        $scope.update = function()
		{
			//alert(arg);
			$UserService.updateAll($scope.address).then(
				    function(result) {
				    	$scope.updated = result.status;
				        console.log(result);
				     }
				 );
		}
        
        $scope.backToCart = function()
        {
        	$("#backtocart").submit();            
        }
        
        $scope.viewCompleteOrder = function()
        {
        	$("#viewCompleteOrder").submit();            
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
					    			<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-3"> <button style="box-shadow: 5px 5px 10px #555555; font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;" type="button" class="btn btn-success btn-responsive center" ng-click="backToCart();" ><span class="glyphicon glyphicon-chevron-left" ></span> &nbsp;&nbsp; Back to Cart </button> </div>
					    			<form id="backtocart" action="${flowExecutionUrl}&_eventId=BackToCart" method="post" >
										<input type="hidden" name="user" value="${not empty pageContext.request.userPrincipal}" />
									</form>
									
									<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-3"> <button style="box-shadow: 5px 5px 10px #555555; font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;" type="button" class="btn btn-danger btn-responsive center" ng-click="viewCompleteOrder();" >&nbsp;&nbsp;View Complete Order <span class="glyphicon glyphicon-chevron-right" ></span></button> </div>
									<form id="viewCompleteOrder" action="${flowExecutionUrl}&_eventId=ViewCompleteOrder" method="post" >
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
					    
					    	
					    
					    	<div class="table-responsive">
							  <table style="width: 80%;" class="table center">
							  	
							  	<tr>
							  		<td><label path="address" for="address">Shipping Address:</label></td>
							  		<td><textarea path="address" class="form-control" id="address" ng-model="address.shippingAddress"></textarea></td>							  		
							  	</tr>
							  	
							  	<tr>
							  		<td><label path="address" for="address">Billing Address:</label></td>
							  		<td><textarea path="address" class="form-control" id="address" ng-model="address.billingAddress"></textarea></td>							  		
							  	</tr>
							  	
							  	<tr>
							  		<td><div style="padding-top: 2%;padding-bottom: 2%;" > <button style="box-shadow: 5px 5px 10px #555555; font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;" type="button" ng-click="update();" class="btn btn-primary btn-responsive center">&nbsp;&nbsp;Update</button> </div></td>
							  		<td><div><div style="font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;" class="alert alert-success">{{updated}}</div></div></td>							  		
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