
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
<title>LMS | Leave Balance</title>
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
					<h3>Leave Balance</h3>
				</div>
				<div class="span6">
					<ul class="breadcrumb pull-right">
						<li><a href="index.html">Home</a> <span class="divider">/</span></li>
						<li><a href="#">Leave Management</a> <span class="divider">/</span></li>
						<li class="active">Leave Balance</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- / .title -->

	<section id="portfolio" class="container main">

		<table>
			<tr>
				<td style="color: blue; font-weight: bold;" align="left"><font
					style="color: black">Welcome </font>${faculityLeaveMasterVO.getName()}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					style="color: black">Department:</font>
					${faculityLeaveMasterVO.getDepartment()}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					style="color: black">Designation:</font>${faculityLeaveMasterVO.getDesignation()}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					style="color: black;"><font style="color: black">For
							the year </font><%=new java.text.SimpleDateFormat("yyyy")
					.format(new java.util.Date())%>&nbsp;&nbsp;<font
						style="color: black">as on </font> <%=new java.util.Date()%> </font></td>
			</tr>
		</table>
		<br>
		<table class="table table-bordered table-hover"
			style="width: 50%; margin-left: auto; margin-right: auto;">
			<thead>
				<tr height="30px"
					style="color: black; background-color: #F1F1F1; vertical-align: middle;"
					align="center">

					<td><b>CL</b></td>
					<td><b>SL</b></td>
					<td><b>EL</b></td>
					<td><b>OD</b></td>
				</tr>
			</thead>
			<tbody>
				<tr bgcolor="#FFFFFF" style="color: black;">
					<td>${faculityLeaveMasterVO.totalCL}</td>
					<td>${faculityLeaveMasterVO.totalSL}</td>
					<td>${faculityLeaveMasterVO.totalEL}</td>
					<td>${faculityLeaveMasterVO.od}</td>
				</tr>

			</tbody>
		</table>

		<div style="clear: both;"></div>

		<br></br> <br></br> <br></br> <br></br> <br></br> 

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
