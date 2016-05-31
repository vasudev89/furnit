<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page isELIgnored="false"%>

<div style=" background-image: url(${pageContext.request.contextPath}/resources/images/headerBack.jpg); position: absolute;  left: 0px; height: 70px; color: #FFC706; width: 100%; text-align: left; vertical-align: middle; line-height: 60px; border: 0px solid #FFC706; box-shadow: 5px 45px 40px #555555; font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;" >
		&nbsp;&nbsp;&nbsp;<span style="color: #FFFFFF; font-size: 32px;">Furn</span> - It
                
        <nav style="z-index: 4; background-image: url(${pageContext.request.contextPath}/resources/images/headerBack.jpg); border: none; box-shadow: 5px 5px 40px #000000;" class="navbar navbar-inverse">
			<div class="container-fluid">
    			<div class="navbar-header">
      				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>                        
      				</button>
    			</div>
    			<div class="collapse navbar-collapse" id="myNavbar">
	    			<ul class="nav navbar-nav navbar-left">
		    			<li><a class="nav navbar-left" href="${pageContext.request.contextPath}/index">Home</a></li>
		        		<li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
				        <li><a href="${pageContext.request.contextPath}/contactus">Contact Us</a></li>
				        <li><a href="${pageContext.request.contextPath}/product">Products</a></li>
				        <c:if test="${not empty ADMIN}">
				    		<li><a href="${pageContext.request.contextPath}/userbase">User Base</a></li>
				    	</c:if>
				        
				    </ul>
				    
	      			<ul class="nav navbar-nav navbar-right">
	      				
	      				
	      				<c:choose>
	      					<c:when test="${not empty pageContext.request.userPrincipal}">
	      						<li><span style="position: absolute; top: -5px; right: 5px; color: #FFFFFF; font-size: 1.1vw;">${pageContext.request.userPrincipal.name}</span></li>
	      						<li><a href="${pageContext.request.contextPath}/logout">Log Out</a></li>
	      						
	      					</c:when>
	      					
	      					<c:otherwise>
	      						<li><a href="${pageContext.request.contextPath}/loginpage">Login</a></li>
				        		<li><a href="${pageContext.request.contextPath}/signup">Sign Up</a></li>
				        		${isAdmin}
	      					</c:otherwise>
	      				</c:choose>
						
			        </ul>
	    		</div>
  			</div>
		</nav>
	</div>
	
	<footer style=" background-image: url(${pageContext.request.contextPath}/resources/images/headerBack.jpg); position: fixed; bottom:0px; width: 100%; z-index:4; color: #FFFFFF; padding-top: 10px; box-shadow: -10px 5px 40px #000000;" class="container-fluid text-center">
		<p><b>&copy; Vasudev Vashisht</b></p>
	</footer>