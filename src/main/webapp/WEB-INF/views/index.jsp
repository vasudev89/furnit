<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sec:authentication var="user" property="principal" />
<!DOCTYPE html>
<head>
	
	<link rel="stylesheet" href="resources/references/css/bootstrap.min.css">
	
	<style>
		.center
		{
		    margin: auto;
		    width: 100%;
		    border: 0px solid #73AD21;
		    box-shadow: 2px 2px 20px #000000;
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
	
	<div class="container">
  	
  	<div id="myCarousel" class="carousel slide center" data-ride="carousel">
    	<!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>      
	    </ol>

    	<!-- Wrapper for slides -->
    	<div style="height: 210px; background-color: rgb(128,0,0);" class="carousel-inner" role="listbox">
      		<div class="item active">
        		<img src="resources/images/image1.jpg" alt="diningtable" width="660px" height="345px">
      		</div>

      		<div class="item">
        		<img src="resources/images/image2.jpg" alt="bookshelf" width="660px" height="345px">
      		</div>
    
      		<div class="item">
        		<img src="resources/images/image3.jpg" alt="beddisplay" width="660px" height="345px">
      		</div>
      
    	</div>

    	<!-- Left and right controls -->
    	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      		<span class="sr-only">Previous</span>
    	</a>
    	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      		<span class="sr-only">Next</span>
    	</a>
  	</div>
  	
  	<div style="
                    color: #000000;
                    text-align: center;
                    vertical-align: middle;
                    line-height: 10px;
                    border: 0px solid #FFC706;
                    box-shadow: 5px 25px 40px #555555;
                    font-style: italic;
                    font-weight: bold;
                    font-size: 14px;
                    font-family: Segoe UI, Tahoma, sans-serif;
                    
      				
                " class="container-fluid carousel slide" >
                <div class="row">
                <br>
                <br>
	                <div class="col-md-4">
		                <a href="product?searchKey=Beds" ><div class="img-circle img-responsive nopadding center_img" style="background-image: url(resources/images/beddisplay.jpg); background-size: 280px 220px; width: 280px ; height: 220px;" > <a align="center" href="product?searchKey=Beds" style="line-height: 340px; font-size: 140%; background-color: #CCCCCC;" >&nbsp; Beds &nbsp;</a> </div></a>
		                <br><br>
		                <p style="font-weight: none; font-size: 12px; font-style: none; line-height: 20px;">A piece of furniture used as a place to sleep or relax. They consist of a soft, cushioned mattress on a bed frame</p>
	                </div>
	                
	                <div class="col-md-4">
		                <a href="product?searchKey=Book+Shelves" ><div class="img-circle img-responsive nopadding center_img" style="background-image: url(resources/images/bookshelf.jpg); background-size: 280px 220px;background-repeat: no-repeat;width: 280px ; height: 220px;" > <a align="center" href="product?searchKey=Book+Shelves" style="line-height: 340px; font-size: 140%; background-color: #CCCCCC;" >&nbsp;Book Shelves&nbsp;</a> </div></a>
		                <br><br>
		                <p style="font-weight: none; font-size: 12px; font-style: none; line-height: 20px;">Your friendly garage for your books. A peaceful outlook and a soothing utopia can be found in these shelves.</p>
	                </div>
	                
	                <div class="col-md-4">
		                <a href="product?searchKey=Sofas" ><div class="img-circle img-responsive nopadding center_img" style="background-image: url(resources/images/sofas.jpg); background-size: 280px 220px; width: 280px ; height: 220px;" > <a align="center" href="product?searchKey=Sofas" style="line-height: 340px; font-size: 140%;background-color: #CCCCCC;" > &nbsp;Sofas&nbsp; </a> </div></a>
		                <br><br>
		                <p style="font-weight: none; font-size: 12px; font-style: none; line-height: 20px;">Sit Down and Relax. Enjoy a movie and bunk up with your friends on the weekend.</p>
	                </div>
                
                </div>
                
                
                <br><br>
                
	                
					
				</div>
  
  <!--  -->
  
</div>
  	
  	</div>
	
	<!--  -->


	

</body>