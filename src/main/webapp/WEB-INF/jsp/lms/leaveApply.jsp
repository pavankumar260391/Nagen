
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="ff"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

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
<title>LMS |Leave Apply</title>
<%@include file="eimport.jsp"%>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						/*  $("#leaveFrom1")
								.datepicker(
										{
											minDate : 0,
											dateFormat : 'MM/dd/yyyy',
											showOn : 'button',
											buttonImage : "${pageContext.request.contextPath}/images/datePickerPopup.gif",
											buttonImageOnly : true,
											showOtherMonths : true,
											selectOtherMonths : true
										}).next('button').text('').button({
									text : false
								});

						$("#leaveTo1")
								.datepicker(
										{
											minDate : 0,
											dateFormat : 'MM/dd/yyyy',
											showOn : 'button',
											buttonImage : "${pageContext.request.contextPath}/images/datePickerPopup.gif",
											buttonImageOnly : true,
											showOtherMonths : true,
											selectOtherMonths : true
										}).next('button').text('').button({
									text : false
								}); */

						$("#searchFiled").keypress(function(e) {
							if (e.keyCode == 13) {
								$("#searchForm").submit();
							}
						});

						$("#applyLeaveId").click(function() {
							var status = validate();
							if (status) {
								$("#faculityLeaveMasterVO").submit();
							}
						});

						$("#description").hide();
						$("#reason").hide();

						$("#lvmeeting").hide();

						$
								.ajax({
									url : "${pageContext.request.contextPath}/admin/facultyidAndNames.htm",
									type : "GET",
									success : function(msg) {
										var data = new Array();
										data = msg.split(',');
										//alert(data);
										AutoComplete_Create('searchFiled', data
												.sort(), 6);
									} //end of result
								});

						/* $("#leaveType1")
								.change(
										function() {
											if (document
													.getElementById("leaveType1").value == "Others") {
												$("#description").show();

											} else {
												$("#description").hide();

											}

										}); */

					});
</script>

<script type="text/javascript">
	function leaveCategoryCheck() {
		if (document.getElementById('lc1').checked) {
			$("#lvmeeting").show();
		} else {
			$("#lvmeeting").hide();
			$('input[name=leaveMeeting]:checked').val("NA");
		}
	}
</script>

<script type="text/javascript">
	function checkType() {
		$("#description").hide();
		if (document.getElementById("leaveType1").value == "Others") {
			$("#description").show();

		} else {
			$("#description").hide();

		}
	}
</script>

<script type="text/javascript">
	function checkReason() {
		$("#reason").hide();
		if (document.getElementById("purpose").value == "Others") {
			$("#reason").show();

		} else {
			$("#reason").hide();

		}
	}
</script>

<script type="text/javascript">
	function validate() {

		var form_valid = (document.getElementById('totalDays').value == '0');
		if (form_valid) {
			alert('please provide valid date inputs');
			return false;
		}

		if (document.getElementById('description').value == ''
				&& document.getElementById('leaveType1').value == 'Others') {
			alert("please provide a leave description");
			return false;

		}

		if (document.getElementById('reason').value == ''
				&& document.getElementById('purpose').value == 'Others') {
			alert("please provide a leave reason");
			return false;

		}

		if ($('input[name=leaveCategory]:checked').length <= 0) {
			alert("Please select the leave category");
			return false;
		}

		if ($('input[name=leaveMeeting]:checked').length <= 0
				&& $('input[name=leaveCategory]:checked').val() != 'FullDay') {
			alert("Select a valid leave meeting option");
			return false;
		}

		return true;
	}
</script>

<script type="text/javascript">
	function totalLeaveCheck() {

		$("#leaveFrom1").datepicker({
			dateFormat : 'mm/dd/yyyy'
		});
		$("#leaveTo1").datepicker({
			dateFormat : 'mm/dd/yyyy'
		});

		$("#leaveTo1").change(
				function() {

					var leaveTo = $("#leaveTo1").val();
					if (leaveTo.trim().length == 0) {
						alert("Leave to date cannot be blank.");
						$("#leaveTo1").focus();
						return;
					}
					var leaveFrom = $("#leaveFrom1").val();
					if (leaveFrom.trim().length == 0) {
						alert("Leave From date cannot be blank.");
						$("#leaveFrom1").focus();
						return;
					}

					if ($("#leaveFrom1").val() == $("#leaveTo1").val()) {
						$("#totalDays").val(1);
						return;
					}

					else if ($("#leaveFrom1").val() != ''
							|| $("#leaveTo1").val() != '') {

						var diff = ($("#leaveTo1").datepicker("getDate") - $(
								"#leaveFrom1").datepicker("getDate"))
								/ 1000 / 60 / 60 / 24; // days
						if (diff > 0) {
							$("#totalDays").val(diff);
						} else {
							alert("Invalid date inputs")
							$("#leaveFrom1").focus();
							$("#leaveFrom1").clear();
							return false;
						}
					}

				});

		$("#leaveFrom1").change(
				function() {

					if ($("#leaveFrom1").val() == $("#leaveTo1").val()) {
						$("#totalDays").val(1);
						return;
					}

					else if ($("#leaveFrom1").val() != ''
							&& $("#leaveTo1").val() != '') {

						var diff = ($("#leaveTo1").datepicker("getDate") - $(
								"#leaveFrom1").datepicker("getDate"))
								/ 1000 / 60 / 60 / 24; // days
						if (diff > 0) {
							$("#totalDays").val(diff);
						} else {
							alert("Invalid date inputs")
							$("#leaveFrom1").focus();
							$("#leaveFrom1").clear();
							return false;
						}
					}

				});

	}
</script>

<script type="text/javascript">
	function ValidateMobNumber(txtMobId) {

		$('#mobile').keypress(function(event) {

			if (event.which != 8 && isNaN(String.fromCharCode(event.which))) {
				event.preventDefault(); //stop character from entering input
				document.getElementById('mobileError').innerHTML = " Invalid";
			} else {
				document.getElementById('mobileValid').innerHTML = " Valid";

			}

		});
	}
</script>

<style>
.error {
	color: red;
	font-size: 12px;
}
</style>

<!-- <script>
	$(document).ready(function() {

		$('#leaveForm').validate({ // initialize the plugin
			rules : {
				mobile : {
					phoneUS : true,
					required : true,

				}
			}
		});
	});
</script> -->

</head>

<body>

	<!--Header-->
	<%@include file="eheader.jsp"%>
	<!-- /header -->

	<!-- / .title -->

	<section id="portfolio" class="container main">

		<%-- <div class="alert alert-info fade in" id="myAlert">
			<a href="#" class="close" data-dismiss="alert">&times;</a> <strong></strong>
			${successMessage}
		</div> --%>

		<ff:form
			action="${pageContext.request.contextPath}/employee/leaveEntry"
			method="post" commandName="faculityLeaveMasterVO" id="leaveForm">

			<table>
				<tr>
					<td style="color: blue; font-weight: bold;" align="left"><font
						style="color: black">Welcome </font>${faculityLeaveMasterVO.getName()}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
						style="color: black">Department:</font>
						${faculityLeaveMasterVO.getDepartment()}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
						style="color: black">Designation:</font>${faculityLeaveMasterVO.getDesignation()}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font
						style="color: black">Type:</font>
						${faculityLeaveMasterVO.getType()}</td>
				</tr>
			</table>

			<table>
				<tr>
					<td style="color: blue;" align="left"><font
						style="color: black"><b>Available Leaves:</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font style="color: black"><b>EL: </b></font>${faculityLeaveMasterVO.totalEL}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font style="color: black"><b>CL: </b></font>
						${faculityLeaveMasterVO.totalCL}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font style="color: black"><b>SL: </b></font>
						${faculityLeaveMasterVO.totalSL}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font style="color: black"><b>OD: </b></font>${faculityLeaveMasterVO.od}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font style="color: black"><b>Status: </b></font><font
						style="color: black">New</font>&nbsp;&nbsp;<font
						style="color: black"><b>Created on: </b></font><font
						style="color: black"><%=new java.util.Date()%></font></td>
				</tr>
			</table>

			<table border="0" style="width: 100%;" class="table" >

				<tr height="25px">
					<td colspan="1" style="width: 30%; align: left;"><b>Leave
							From </b><font color="red">*</font> <ff:input type="text"
							path="leaveFrom" id="leaveFrom1" style="width: 30%"
							class="datepicker" onchange="javascript:totalLeaveCheck();" />
					<td colspan="1" style="width: 30%; align: center;"><b>Leave
							To </b><font color="red">*</font> <ff:input type="text"
							path="leaveTo" id="leaveTo1" style="width: 30%"
							class="datepicker" />
					<td colspan="1" style="width: 30%; align: right;"><b>Total
							day(s) &nbsp; :</b> <ff:input type="text" id="totalDays"
							path="totalDays" style="width: 10%" /></td>
				</tr>

				<tr height="25px">
					<td colspan="1" style="width: 10%; align: left;"><b>Leave
							Type </b><font color="red">*</font> <ff:select path="leaveType"
							name="leaveType" id="leaveType1"
							onchange="javascript:checkType();"
							style="background-color:#FFFFFF">
							<option>(Select an option)</option>
							<option>CL</option>
							<option>EL</option>
							<option>OD</option>
							<option>Compensatory Leave</option>
							<option>Others</option>
						</ff:select> <ff:input path="description" id="description"
							style="background-color:white;" placeholder="Description"
							size="65" /></td>

					<td colspan="1" style="width: 10%; align: center;"><b>Purpose
					</b><font color="red">*</font> <ff:select path="purpose" name="purpose"
							style="background-color:white" id="purpose"
							onchange="javascript:checkReason();">
							<ff:options items="${leaveReasons}" />
						</ff:select>
						
						 <ff:input path="reason" id="reason"
							style="background-color:white;margin-left:60px;" placeholder="Description"
							size="65"  /></td>

					<td>Mobile: <ff:input type="text" path="mobile" size="10"
							id="mobile" maxlength="10" style="height: 15px"
							onkeydown="return ValidateMobNumber('mobile')" /><span
						id="mobileError" style="color: red"></span><span id="mobileValid"
						style="color: green"></span>
				</tr>

				<tr height="25px">
					<td colspan="1" style="width: 10%; align: left;"><b>Leave
							Category </b><font color="red">*</font> &nbsp;<ff:radiobutton
							path="leaveCategory" name="leaveCategory"
							onclick="javascript:leaveCategoryCheck();" id="lc1"
							value="HalfDay" />Half Day &nbsp; <ff:radiobutton
							onclick="javascript:leaveCategoryCheck();" name="leaveCategory"
							id="lc2" path="leaveCategory" value="FullDay" />Full Day</td>

					<td id="lvmeeting" colspan="1" style="width: 10%; align: center;"><b>Leave
							Meeting &nbsp; : </b> &nbsp;<ff:radiobutton path="leaveMeeting"
							id="fh" value="FirstHalf" />First Half &nbsp;<ff:radiobutton
							id="sh" path="leaveMeeting" value="SecondHalf" />Second Half</td>


					<%-- <td>Mobile: <ff:input data-validation="number" type="text"
							path="mobile" size="10" id="mobile" maxlength="10"
							style="height: 15px"
							onkeydown="return ValidateMobNumber('mobile')" /> --%>
				</tr>

				<tr height="25px">
					<td colspan="1" style="width: 10%; align: left;"><b>Reporting
							Manager &nbsp; : </b> <ff:select path="reportingManager"
							style="background-color:#FFFFFF">
							<ff:options items="${managerList}" />
						</ff:select></td>

					<td colspan="1" style="width: 10%; align: center;"><b>CC
							To &nbsp; : </b> <ff:select path="ccTo"
							style="background-color:#FFFFFF" multiple="true">
							<ff:options items="${ccToList}" />
						</ff:select></td>
				</tr>

				<tr height="25px">
					<td colspan="1" style="width: 10%; align: right;"><input
						type="submit" value="Apply Leave" class="btn btn-info"
						id="userRegistrationBt" /> <input type="reset" value="Clear"
						class="btn btn-info" style="" /></td>
				</tr>
			</table>
		</ff:form>

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
	<script src="${pageContext.request.contextPath}/js/BeatPicker.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.datepicker').datepicker();
			$("input[type='text'][id='leaveFrom1']").click(function() {
				$("#myAlert").alert();
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.datepicker').datepicker();
			$("input[type='text'][id='leaveTo1']").click(function() {
				$("#myAlert").alert();
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("input[type='text'][id='mobile']").click(function() {
				$("#myAlert").alert();
			});
		});
	</script>


</body>
</html>
