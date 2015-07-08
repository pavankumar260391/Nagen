<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="k" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<title>Learn Center | Courses</title>
 <%@include file="uimport.jsp" %>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">.bg, .box2{behavior:url("js/PIE.htc");}</style>
<![endif]-->
</head>
<body id="page2" style="background:url${pageContext.request.contextPath}/(images/bg_top2.jpg) top repeat-x #fff;">
<div class="body121">
  <div class="main">
    <!-- header -->
     <%@include file="userMenu.jsp" %>
    <!-- / header -->
  </div>
</div>
<div class="body2">
  <div class="main">
    <!-- content -->
    <section id="content">
      <div class="box1">
        <div class="wrapper">
                &nbsp;&nbsp;<h4 style="color: black"><img src="${pageContext.request.contextPath}/images/question1.png"/> - <b>Available Test</b></h4> 
                <hr style="color: black"/> 
      			<table  class="table table-bordered" width="100%" >
					     <tr height="35px" style="color: white;background-color:#013648;vertical-align: middle;" align="center">
					     <td align="left"><b>Sno.</b></td>
					   	   <td><b>Test Name</b></td>
					   	   <td><b>Questions</b></td>
					   	   <td><b>Duration(Min)</b></td>
					   	   <td><b>Date</b></td>
					   	   <td><b>Test Expire Time(Hrs)</b></td>
					   	      <td><b>Test Status/Action</b></td>
					     </tr>
					    
					    <k:set var="count" scope="page" value="0"/>
					     <k:forEach var="aOnlineTest" items="${assignedTestUserList}">
					        <k:set var="count" scope="page" value="${count+1}"/>
					       	<k:if test="${count%2==0}"> 
					      <tr height="25px"  style="background-color: #DBEAF9;color: black">
					     <td align="center"><b>${count}.</b></td>
					   	   <td>&nbsp;&nbsp;<b>${aOnlineTest.techName}</b></td>
					   	     <td align="center">&nbsp;&nbsp;<b>${aOnlineTest.numberOfQuestions}</b></td>
					   	       <td align="center">&nbsp;&nbsp;<b>${aOnlineTest.durationInMin}</b></td>
					   	   <td  align="center"><b>${aOnlineTest.assignDate}</b></td>
					   	   <td align="center"><b>${aOnlineTest.testExpireTimeInHrs}</b></td>
					   	      <td align="center">
					           	   	 <k:if test="${aOnlineTest.testStatus=='Not Started'}">
							           	<a href="loadTechTest?testName=${aOnlineTest.techName}"><b>StartTechTest</b><img align="center" src="${pageContext.request.contextPath}/images/start.png" alt="" width="25" height="25"/>
							           	</a>
								           	
							          </k:if> 	
							         
							         <k:if test="${aOnlineTest.testStatus=='In progress'}">
							           	<a href="loadTechTest?testName=${aOnlineTest.techName}"><b>Resume Test</b><img align="center" src="${pageContext.request.contextPath}/images/start.png" alt=""/>
							           	</a>
							 				
							          </k:if> 	
							            <k:if test="${aOnlineTest.testStatus=='complete'}">
							       			<b>Complete</b><img src="${pageContext.request.contextPath}/images/finish.jpg" alt=""  width="25" height="25"/>
							          </k:if> 	
					   	      </td>
					     </tr>
					       </k:if>
					    <k:if test="${count%2!=0}">
					      <tr height="25px"  style="background-color: #FCF6CF;">
					     <td  align="center"><b>${count}.</b></td>
					   	   <td>&nbsp;&nbsp;<b>${aOnlineTest.techName}</b></td>
					   	   <td align="center">&nbsp;&nbsp;<b>${aOnlineTest.numberOfQuestions}</b></td>
					   	       <td align="center">&nbsp;&nbsp;<b>${aOnlineTest.durationInMin}</b></td>
					   	   <td align="center"><b>${aOnlineTest.assignDate}</b></td>
					   	   <td align="center"><b>${aOnlineTest.testExpireTimeInHrs}</b></td>
					   	      <td align="center">
					   	      		 <k:if test="${aOnlineTest.testStatus=='Not Started'}">
							           	<a href="loadTechTest?testName=${aOnlineTest.techName}">  	<b>StartTechTest</b><img align="center" src="${pageContext.request.contextPath}/images/start.png" alt="" height="25" width="25"/>
							           	</a>
								         
							          </k:if> 	
							         
							         <k:if test="${aOnlineTest.testStatus=='In progress'}">
							           	<a href="loadTechTest?testName=${aOnlineTest.techName}"><b>Resume Test</b><img align="left" src="${pageContext.request.contextPath}/images/start.png" alt="" height="25" width="25"/>
							           	</a>
							 				
							          </k:if> 	
							          
							          <k:if test="${aOnlineTest.testStatus=='complete'}">
							       			<b>Complete</b><img src="${pageContext.request.contextPath}/images/finish.jpg" alt=""  width="25" height="25"/>
							          </k:if> 	 
					   	      </td>
					     </tr>
					      </k:if>
					     </k:forEach>  
					      <tr height="30px">
					     <td>&nbsp;</td>
					   	   <td></td>
					   	   <td></td>
					   	    <td></td>
					   	   <td></td>
					   	   <td></td>
					       <td></td>
					     
					     </tr>
					      <tr height="35px">
					     <td>&nbsp;</td>
					   	   <td></td>
					   	   <td></td>
					   	    <td></td>
					   	   <td></td>
					   	   <td></td>
					       <td></td>
					     
					     </tr>
					      <tr height="35px">
					     <td>&nbsp;</td>
					   	   <td></td>
					   	   <td></td>
					   	   <td></td>
					       <td></td>
					      <td></td>
					   	   <td></td>
					     </tr>
					      <tr height="35px">
					     <td>&nbsp;</td>
					   	   <td></td>
					   	   <td></td>
					   	   <td></td>
					   	    <td></td>
					   	   <td></td>
					   	   <td></td>
					     
					     </tr>
					      <tr height="35px">
					     <td>&nbsp;</td>
					   	   <td></td>
					   	   <td></td>
					   	    <td></td>
					   	   <td></td>
					   	   <td></td>
					   	   <td></td>
					     
					     </tr>
					      <tr height="35px">
					     <td>&nbsp;</td>
					   	   <td></td>
					   	   <td></td>
					   	    <td></td>
					   	   <td></td>
					   	   <td></td>
					   	   <td></td>
					     
					     </tr>
					      <tr height="35px">
					     <td>&nbsp;</td>
					   	   <td></td>
					   	   <td></td>
					   	   <td></td>
					   	    <td></td>
					   	   <td></td>
					       <td></td>
					     
					     </tr>
					     
					     
					</table>     
        </div>
      </div>
    </section>
    <br/><br/><br/>
    <!-- content -->
    <!-- / footer -->
  <%@include file="ufooter.jsp" %>

</body>
</html> --%>