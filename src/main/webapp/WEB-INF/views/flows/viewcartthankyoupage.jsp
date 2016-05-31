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

<body ng-app="myApp" ng-controller="myCtrl" style="background-color: #333333;">

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/references/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/references/js/bootstrap.min.js"></script>

	<c:import url="/head"/>

	<!--  -->
	
	<br>
	<br>
	<br>
	<br>
	
	<div>                
                
    
    
    <!--  -->
    
    <br><br>
					<script type="text/css">
					</script>
					
					<div class="container">
						<div class="row">
					    	<div class="col-lg-12 col-centered">
					    		<div class="row">
					    		
					    			<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-4"> </div>
					    			<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-4"> <a href="${pageContext.request.contextPath}" class="btn btn-primary btn-responsive center" style="box-shadow: 5px 5px 10px #000000; font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;"><span class="glyphicon glyphicon-home" ></span> &nbsp;&nbsp; Home</button> </a></div>
									<div style="padding-top: 2%;padding-bottom: 2%;" class="col-xs-4"> </div>
					    		
					    		</div>
							</div>
						</div>
					</div>
					
					
					
					<div class="container">
					<div class="row">
					    <div class="col-lg-12 col-centered">
					    
					    	
					    
					    	<div style="font-style: italic;font-weight: bold;font-size: 16px;font-family: Segoe UI, Tahoma, sans-serif; color: #333333;box-shadow: 5px 5px 40px #000000;background-image: url(${pageContext.request.contextPath}/resources/images/thankyou.jpg); background-size: cover;" class="table-responsive">
							  <table style="width: 100%;" class="table">
							  	<tr>
							  		<div style="background-color: #777777;">
							  			&nbsp;&nbsp;
							  			<span style="color: #FFFFFF; font-size: 32px;">Furn</span>
										<span style="color: #FFC706; font-size: 24px;"> - It</span>
							  		</div>
							  	</tr>
							  	
							  	<tr>
							  		<p style="font-style: italic;font-weight: bold;font-size: 16px;font-family: Segoe UI, Tahoma, sans-serif; color: #333333; background-color: #FFFFFF; padding: 20px; opacity: 0.8; box-shadow: 5px 5px 20px #000000;" >We thank you for your business. Your order will reach you within 15 working days. Feel free to reach out to us with your feedback.</p>
							  	</tr>
							  	
							  	<br>
							  	<br>
							  	<br>
							  	<br>
							  	<br>
							  	<br>
							  	<br>
							  	<br>
							  	<br>
							  	<br>
							  	<br>
							  	
							  	
							  </table>
							</div>
					    </div>
					</div>
					</div>
					
					<br>
					
				
				<br><br>

</body>