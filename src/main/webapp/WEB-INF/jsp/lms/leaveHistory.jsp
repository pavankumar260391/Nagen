
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>LMS | Leave History</title>
<%@include file="eimport.jsp"%>
</head>

<body>

	<!--Header-->
	<%@include file="eheader.jsp"%>
	<!-- /header -->

	<section class="title">
		<div class="container">
			<div class="row-fluid">
				<div class="span6">
					<h3>Leave History</h3>
				</div>
				<div class="span6">
					<ul class="breadcrumb pull-right">
						<li><a href="index.html">Home</a> <span class="divider">/</span></li>
						<li><a href="#">Leave Management</a> <span class="divider">/</span></li>
						<li class="active">Leave History</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- / .title -->

	<section id="portfolio" class="container main">

		<!-- <div class="col-xs-12">
             				<select name="selectedGroupName" class="form-control"  style="width: 300px;">
								<option>JAN</option>   
								<option>FEB</option>
								<option>MAR</option>
								<option>APR</option>
							</select> 
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input
								type="button" value="Show Attendance"
								id="loadUsersId"  class="btn btn-info" style="height:30px;margin-top: -6px;"/>
            	</div> -->
		<table class="table table-bordered table-hover" width="100%">
			<tr height="30px"
				style="color: black; background-color: #F1F1F1; vertical-align: middle;"
				align="center">
				<td ><b>SNO.</b></td>
				<td ><b>Date From</b></td>
				<td ><b>Date To</b></td>
				<td><b>Total Day(s)</b></td>

				<td><b>leave type</b></td>
				<td><b>leave category</b></td>
				<td><b>leave status</b></td>
				<td><b>purpose</b></td>
			</tr>

			<c:forEach varStatus="sn" var="facleavelist"
				items="${faculityLeaveMasterVOslist}">
				<tr bgcolor="#FFFFFF" style="color: black;">
					<td>${sn.count}.</td>
					<td><fmt:formatDate pattern="dd-MMM-yyyy"
							value="${facleavelist.leaveFrom}" /></td>
					<td><fmt:formatDate pattern="dd-MMM-yyyy"
							value="${facleavelist.leaveTo}" /></td>
					<td>${facleavelist.totalDays}</td>
					<td>${facleavelist.leaveType}</td>
					<td>${facleavelist.leaveCategory}</td>
					<td>${facleavelist.lstatus}</td>
					<td>${facleavelist.purpose}</td>
				</tr>
			</c:forEach>

		</table>
		<div style="clear: both;"></div>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</section>

	<!--Footer-->
	<footer id="footer">
		<div class="container">
			<div class="row-fluid">
				<div class="span5 cp">
					&copy; 2013 <a target="_blank" href="http://shapebootstrap.net/"
						title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>.
					All Rights Reserved.
				</div>
				<!--/Copyright-->

				<div class="span6">
					<ul class="social pull-right">
						<li><a href="#"><i class="icon-facebook"></i></a></li>
						<li><a href="#"><i class="icon-twitter"></i></a></li>
						<li><a href="#"><i class="icon-pinterest"></i></a></li>
						<li><a href="#"><i class="icon-linkedin"></i></a></li>
						<li><a href="#"><i class="icon-google-plus"></i></a></li>
						<li><a href="#"><i class="icon-youtube"></i></a></li>
						<li><a href="#"><i class="icon-tumblr"></i></a></li>
						<li><a href="#"><i class="icon-dribbble"></i></a></li>
						<li><a href="#"><i class="icon-rss"></i></a></li>
						<li><a href="#"><i class="icon-github-alt"></i></a></li>
						<li><a href="#"><i class="icon-instagram"></i></a></li>
					</ul>
				</div>

				<div class="span1">
					<a id="gototop" class="gototop pull-right" href="#"><i
						class="icon-angle-up"></i></a>
				</div>
				<!--/Goto Top-->
			</div>
		</div>
	</footer>
	<!--/Footer-->

	<!--  Login form -->
	<div class="modal hide fade in" id="loginForm" aria-hidden="false">
		<div class="modal-header">
			<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
			<h4>Login Form</h4>
		</div>
		<!--Modal Body-->
		<div class="modal-body">
			<form class="form-inline" action="index.html" method="post"
				id="form-login">
				<input type="text" class="input-small" placeholder="Email">
				<input type="password" class="input-small" placeholder="Password">
				<label class="checkbox"> <input type="checkbox">
					Remember me
				</label>
				<button type="submit" class="btn btn-primary">Sign in</button>
			</form>
			<a href="#">Forgot your password?</a>
		</div>
		<!--/Modal Body-->
	</div>
	<!--  /Login form -->

	<script
		src="${pageContext.request.contextPath}/js/vendor/jquery-1.9.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/vendor/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>
