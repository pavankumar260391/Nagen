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
	   <script type="text/javascript" src=${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
		//alert("good morning!");
  	 $("input[type='button'][id='loadUsersId']").click(function() {
			$("#showUsersFormId").submit();		
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
			<%--    <%@include file="adminMenu.jsp" %> --%>
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
								src="${pageContext.request.contextPath}/images/uphoto.png" />
							- <b>Available Users</b>
						</h4>
						<form:form id="showUsersFormId"
							action="${pageContext.request.contextPath}/action/loadUsersByGroup"
							method="post" commandName="userListInput">
							<input type="hidden" name="NoOfUsers"
								value="${fn:length(userList)}" /> <br /> 
								
								   <div class="form-group">
          
         	    <div class="col-xs-6">
         	      <label for="inputEmail" class="control-label col-xs-2">Group : </label>
             			<form:select path="selectedGroupName" class="form-control"  style="width: 300px;">
							     <form:options items="${userGroupList}"/>
							</form:select> 
            	</div>
          			  <div class="col-xs-2">
          			   <input
								type="button" value="Load Users"
								id="loadUsersId"  class="btn btn-primary" style="margin-right:20px;""/>
          			  </div>
          			  
       				 </div>
							&nbsp;&nbsp;
							<hr style="color: black" />
							<img
								src="${pageContext.request.contextPath}/images/shopping-unlock-32.png" />
							<b>User List:-</b>
							<div style="float: right;">
								<img
									src="${pageContext.request.contextPath}/images/uphoto.png" />
								Total Users : <b>${fn:length(users)}</b>
							</div>
							<table  class="table table-bordered" width="100%">
								<tr height="30px"
									style="color:black; background-color: #F1F1F1; vertical-align: middle;"
									align="center">
									<td width="10px"><b>SNO.</b>
									</td>
									<td width="250px"><b>Name</b>
									</td>
									<td><b>Email</b>
									</td>
									
									<td><b>Password</b>
									</td>
									<td><b>Batch</b>
									</td>
									<td><b>Photo</b>
									</td>
									<td><b>Exam Detail</b>
									<input type="checkbox" name="selectAllUserID"  checked="checked"/>
									</td>
								</tr>
								<c:forEach var="userItem" items="${users}"
									varStatus="status">
									<tr height="25px" style="color: black; vertical-align: middle;">
										<td align="center"><b>${status.count}.</b>
										</td>
										<td>&nbsp;${userItem.firstName}&nbsp;&nbsp;${userItem.lastName}</td>
										<td>&nbsp;${userItem.email}</td>
												<td>&nbsp;${userItem.password}</td>
										<td align="center">&nbsp;Nov-2014</td>
										<td align="center">&nbsp;
										<img
								src="${pageContext.request.contextPath}/images/uphoto.png" /></td>
										<td align="center">
										&nbsp;
										<a href="${pageContext.request.contextPath}/action/usersTestHistory?loginid=${userItem.loginid}">
										<img
								src="${pageContext.request.contextPath}/images/detail.png" width="32" height="32"/>
											</a>
											<%-- <input type="checkbox" name="userCb" value="${userItem.loginid}" checked="checked"/> --%>
										</td>
									</tr>
								</c:forEach>

								<tr height="25px" style="color: black">
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr height="25px" style="color: black">
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr height="25px" style="color: black">
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td bgcolor="white">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</form:form>
					</div>
				</div>
			</section>
			<!-- content -->

			<!-- / footer -->
	   <%@include file="afooter.jsp" %>


</body>
</html>