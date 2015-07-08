  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Learn Center | Courses</title>
<meta charset="utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css" type="text/css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/treset.css" type="text/css" media="all"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tstyle.css" type="text/css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.2.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-yui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-replace.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Molengo_400.font.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Expletus_Sans_400.font.js"></script>
 <script  src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
 <script type="text/javascript">
$(document).ready(function() {
		//alert("good morning!");
  	 $("input[type='button'][id='userRegistrationBt']").click(function() {
  		    //validating the test name
  			var fname=$("input[type='text'][name='firstName']").val();
  			if(fname.length==0){
  					alert("First Name cannot be blank.......");
  					$("input[type='text'][name='firstName']").focus();
  					return;
  			}
  			
  			/* var email=$("input[type='password'][name='password']").val();
  			if(email.length>10){
  					alert("Password lenght  cannot be greater than 10 characters.");
  					$("input[type='password'][name='password']").focus();
  					return;
  			} */
  			
  			var email=$("input[type='text'][name='email']").val();
  			if(email.length==0){
  					alert("Email  cannot be blank.......");
  					$("input[type='text'][name='email']").focus();
  					return;
  			}
  			
  			
  			
  			$("#userRegistrationForm").submit();		
	 });
});
</script>	
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">.bg, .box2{behavior:url("js/PIE.htc");}</style>
<![endif]-->
   
   
   

</head>
<body id="page2" style="background:url(${pageContext.request.contextPath}/images/bg_top2.jpg) top repeat-x #fff;" onkeydown="return (event.keyCode != 116)">
<div class="body121">
  <div class="main">
    <!-- header -->
   <%--  <%@include file="adminMenu.jsp" %> --%>
    <!-- / header -->
  </div>
</div>
<div class="body2">
  <div class="main">
    <!-- content -->
    <section id="content">
      <div class="box1">
        <div class="wrapper">
                &nbsp;&nbsp;<h4 style="color: black"><img src="${pageContext.request.contextPath}/images/executive.png" width="32" height="32"/> - <b>Profile Page</b></h4>
               <form:form id="userRegistrationForm"  method="POST" commandName="user" enctype="multipart/form-data"> 
                 <hr style="color: red;width: 100%"/> 
                     <h4 style="color: red;" align="center">
								 ${emessage}
						</h4>
        	<table border="0" width="100%"  class="table">
      			 	 <tr height="27px" >
					     <td colspan="1" align="right" valign="bottom"  style="width: 30%">
					       <b>First Name <font color="red">*</font>&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					        <form:input path="firstName"  class="form-control" style="width: 70%"/>
					     </td>
					      <td colspan="1" align="left" valign="top" rowspan="9">
					      <img src="${pageContext.request.contextPath}/images/userReg.png"/>
					     </td>
					   </tr>
					   
					    <tr height="25px" >
					     <td colspan="1" align="right" valign="bottom"  style="width: 30%">
					       <b>Last Name&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					        <form:input path="lastName" style="width: 70%" class="form-control"/>
					     </td>
					   </tr>
					   
					     <%-- <tr height="25px" >
					     <td colspan="1" align="right" valign="bottom"  style="width: 30%">
					       <b>Password&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					        <form:password path="password" style="width: 60%"/>
					     </td>
					   </tr>
					    --%>
					     <tr height="25px" >
					     <td colspan="1" align="right" valign="bottom"  style="width: 30%">
					       <b>Email <font color="red">*</font>&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					        <form:input path="email" class="form-control" readonly="true"/>
					     </td>
					   </tr>
					   
					     <tr height="25px" >
					     <td colspan="1" align="right" valign="bottom"  style="width: 30%">
					       <b>Mobile&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					        <form:input path="mobile" style="width: 50%" class="form-control"/>
					     </td>
					   </tr>
					   
					    <tr height="25px" >
					     <td colspan="1" align="right" valign="bottom"  style="width: 30%">
					       <b>Gender <font color="red">*</font>&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					          <select name="gender" class="form-control"  style="width: 30%">
					          		<option>Male</option>
					          		<option>Female</option>
					          </select>
					     </td>
					   </tr>
					   
					    <tr height="25px" >
					     <td colspan="1" align="right" valign="bottom"  style="width: 30%">
					       <b>DOB&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					        <form:input path="dob" style="width: 30%" class="form-control"/>
					     </td>
					   </tr>
					   
					      <tr height="25px" >
					     <td colspan="1" align="right" valign="bottom"  style="width: 30%">
					       <b>Photo&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					        <input type="file" name="photo"  class="form-control"/>
					     </td>
					   </tr>
					   
					   <tr height="25px"  >
					    <td colspan="1" align="right" valign="middle"  style="width: 30%">
					         <b>Address&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					          <form:textarea rows="" cols="60" path="address" class="form-control"/>
					     </td>
					   </tr>
					   
					        <tr height="25px" >
					     <td colspan="1" align="right" valign="bottom"  style="width: 30%">
					        &nbsp; 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					        &nbsp; 
					     </td>
					         <td colspan="1" align="left" valign="bottom" >
					        &nbsp; 
					     </td>
					   </tr>
					   
					    <tr height="25px"  >
					     <td colspan="2" align="right" valign="bottom" >
					        <input type="button" value="Update"  class="btn btn-success" id="userRegistrationBt"/>
					     </td>
					   </tr>
					  
					  
					 </table>
					</form:form>
					
        </div>
      </div>
    </section>
    <!-- content -->
    	<!--    <hr style="color: blue"/> -->
    <!-- / footer -->
<%@include file="afooter.jsp" %>

</body>
</html>