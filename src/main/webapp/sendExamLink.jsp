<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Learn Center | Courses</title>
<meta charset="utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css" type="text/css" media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/treset.css"
	type="text/css" media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layout.css"
	type="text/css" media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css"
	media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/tstyle.css"
	type="text/css" media="all">
		 <script type="text/javascript" src=${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.5.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/cufon-yui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/cufon-replace.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Molengo_400.font.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Expletus_Sans_400.font.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
		//alert("good morning!");
	$("input[type='button'][id='loadUsersId']").click(function() {
				$("#sendLinkToUserFrom").attr('action','${pageContext.request.contextPath}/action/loadSendExamLink');
				$("#sendLinkToUserFrom").submit();
 	});	
		
  	 $("input[type='button'][id='sendLinkId']").click(function() {
  		 	var NoOfUsers=$("input[type='hidden'][name='NoOfUsers']").val();
  			if(NoOfUsers==0){
  					alert("Users List cannot be empty to send the link for users.");
  					return;
  			}
  			 if($("input[type='checkbox'][id$='userCb']").is(':checked')){
  				 
  			 }else{
  				alert("please select a least one user from user list to send the test link.");
  				return;
  			 }
  			$("#sendLinkToUserFrom").submit();		
	 });
});
</script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">.bg, .box2{behavior:url("js/PIE.htc");}</style>
<![endif]-->




</head>
<body id="page2"
	style="background:url(${pageContext.request.contextPath}/images/bg_top2.jpg) top repeat-x #fff;"
	onkeydown="return (event.keyCode != 116)">
	<div class="body121">
		<div class="main">
			<!-- header -->
			 <%--   <%@include file="adminMenu.jsp" %> --%>
			<!-- / header -->
		</div>
	</div>
	<div class="body2">
		<div class="main">
			<!-- content -->
			<section id="content">
				<div class="box1">
					<div class="wrapper">
						&nbsp;&nbsp;
						<h4 style="color: black">
							<img
								src="${pageContext.request.contextPath}/images/configure.png" />
							- <b>Send Exam Link Page</b>
						</h4>
						<form id="sendLinkToUserFrom"
							action="${pageContext.request.contextPath}/action/sendExamLink"
							method="post">
							<table class="table">
							<tbody>
							<tr>
							<td>
							<input type="hidden" name="NoOfUsers"
								value="${fn:length(users)}" /> 
								 <b
								style="color: black"> Group : </b>
							<select 	name="selectedGroupName" class="form-control">
								   <%
							 		List<String> groupNames=(List<String>)request.getAttribute("userGroupList");
							 	    String selectedGroupName=(String)request.getParameter("selectedGroupName"); 
							 		for(String gname:groupNames){
							 		%>
									<option value="<%=gname%>" 
									   <% 
									    if(gname.equals(selectedGroupName)){
									    	 %>
									    	selected
									   <%
	 								   } 
									   %> 
									   >
									<%=gname%>
									
									</option>
									<%
							 	     }
									%>
						 </select>
							</td>
							<td>
							 <b
								style="color: black">Select Test Name :- </b> 
								<select
								name="testName"  class="form-control">
								<c:forEach var="testname" items="${testNames}">
									<option value="${testname}">${testname}</option>
								</c:forEach>
							</select> 
							</td>
							<td >
							
							 <b
								style="color: black"> &nbsp; </b>
								<br/>
								 <input
								type="button" value="Load Users"
								class="btn btn-primary"
								id="loadUsersId" style="margin-left:20px;"/>
								<td>
								</tr>
								</tbody>
								</table>

							<!--   <input type="button" value="Filter" id="filterRecord"
									style="background-color: pink; color: black; font-weight: bold;height:25px;width: 80px "/>
                         -->
							<hr style="color: black" />
							<hr style="color: blue" />

							<table border="0" width="100%" cellpadding="2px"
								cellspacing="1px">
								
								<tr>
								    <td>
								   Current Selected Group :  <b 	style="color: black"> ${param.selectedGroupName}${dgname}</b>
								    </td>  
									<td colspan="5" align="right" valign="bottom"><input
										type="button" value="Send Link"
										class="btn btn-primary"
										id="sendLinkId" /></td>
								</tr>
								<!-- <tr height="30px" align="center">
					     <td width="10px">&nbsp;</td>
					   	   <td width="100px">&nbsp;</td>
					   	   <td><b>&nbsp;</b></td>
					   	    <td width="50px">&nbsp;</td>
					     </tr> -->
							</table>

							<hr style="color: blue" />
							<img
								src="${pageContext.request.contextPath}/images/shopping-unlock-32.png" />
							<b>User List:-</b>
							<div style="float: right;">
								<img
									src="${pageContext.request.contextPath}/images/uphoto.png" />
								Total Users : <b>${fn:length(users)}</b>
							</div>
							<table  class="table  table-bordered table-hover"width="100%">
								<tr 
									style="color: white; background-color: #013648; vertical-align: middle;"
									align="center">
									<td width="10px"><b>SNO.</b>
									</td>
									<td width="240px"><b>Name</b>
									</td>
									<td><b>Email</b>
									</td>
									<td><b>LoginId</b>
									</td>
									<td><b>Batch</b>
									</td>
									<td><b>Photo</b>
									</td>
									<td><b>OP</b>
									<input type="checkbox" name="selectAllUserID"  checked="checked"/>
									</td>
								</tr>
								<c:forEach var="userItem" items="${users}"
									varStatus="status">
									<tr style="color: black; vertical-align: middle;">
										<td align="center"><b>${status.count}.</b>
										</td>
										<td>&nbsp;${userItem.firstName}&nbsp;&nbsp;${userItem.lastName}</td>
										<td>&nbsp;${userItem.email}</td>
										<td>&nbsp;${userItem.loginid}</td>
										<td align="center">&nbsp;Nov-2014</td>
										<td align="center">&nbsp;<img
								src="${pageContext.request.contextPath}/images/shopping-unlock-32.png" /></td>
										<td align="center">
											<input type="checkbox" name="userCb" id="userCb" value="${userItem.loginid}" checked="checked"/>
										</td>
									</tr>
								</c:forEach>

								<tr  style="color: black">
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr style="color: black">
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr  style="color: black">
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr  style="color: black">
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr style="color: black">
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>

								<tr
									align="center">
									<td colspan="7" align="right">&nbsp; <input type="button"
										value="Send Link"
										class="btn btn-primary"
										id="sendLinkId" /></td>
								</tr>


							</table>
						</form>
					</div>
				</div>
			</section>
			<!-- content -->

			<!-- / footer -->
	   <%@include file="afooter.jsp" %>
</body>
</html>