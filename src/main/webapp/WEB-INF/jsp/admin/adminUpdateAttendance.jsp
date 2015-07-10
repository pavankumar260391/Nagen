<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="ff"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Portfolio | Nova</title>
<%@include file="aimport.jsp"%>
<script src="${pageContext.request.contextPath}/js/admin/attendance-update.js"></script>
<script>
$(document).ready(function(){
	var req = contextPath+'/admin/searchEmployee';
	$("#suggestBox").autocomplete({ 
		delay:500,
		source: function(request, response){    			
			$.ajax({    				
				url:req,
				data:request,
				success: function(result){
					var items = result;
					response(result.slice(0, 10));
				}    				
			});    			
		},
		 select: function (event,ui){
			$("#monthSelect").show();
			$('#monthLabel').show();
			$('#lateInfoButton').show()
			selectedName = ui.item.value;
			var optionSelected = $(this).find('option:selected').val();
			ajaxCall(selectedName,'retreiveEmployeeForAdmin',optionSelected);   			
		}
	});
});

$(document).ready(function(){
	$('#monthSelect').change(function(){
		var option = $(this).find('option:selected').val();
		ajaxCall(option,'retreiveEmployeeForAdminMonth',option);   	
		
	});
});
  

$(document).ready(function() {
    $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 500,
      width: 500,
      modal: true,
      show: {
        effect: "blind",
        duration: 200
      },
      hide: {
        effect: "explode",
        duration: 200
      }
    });   
  });
  </script>

</head>

<body>

	<!--Header-->
	<%@include file="aheader.jsp"%>
	<!-- /header -->

	<section class="title">
		<div class="container">
			<div class="row-fluid">
				  <div class="span6">
                    <h4>Update Attedance</h4>
                </div>
                <div class="span6">
                 
                </div>
			</div>
		</div>
	</section>
	<!-- / .title -->

	<section id="portfolio" class="container main">


		<!-- <div class="col-xs-12">
			<input type="text" id="suggestBox" name="employeeName"
				placeholder="Search Employee" class="form-control"
				style="width: 300px;"></input> &nbsp;&nbsp;
		</div> -->


		<ff:form
			action="${pageContext.request.contextPath}/employee/retreiveEmployeeInfo"
			method="post" class="form-inline" commandName="adminMonthUtility">
			<table width="1150" border="0" align="left">
				<tbody>
					<tr style="color: #000000; font-weight: bold;" >
						<td>							
					 <input type="text" id="suggestBox" name="employeeName"
							placeholder="Search Employee" class="form-control"
							style="width: 300px;"></input>
						</td>
						<td style=" padding-right:4cm;"><label for="monthSelection" id="monthLabel"
							class="control-label" style="display: none; font-weight: bold;">Select
								Month:</label>
						<ff:select path="month" id="monthSelect"
								items="${adminMonthList}" style="display:none;"
								name="selectedGroupName" class="form-control">
							</ff:select></td>
						<td style=" padding-left:4cm;"><span 
									id="montlylateInfo" style="display: none; font-weight: bold;"></span>
						<span 
									id="montlyEarlyInfo" style="display: none; font-weight: bold;"></span></td>
					</tr>
				</tbody>

			</table>
		</ff:form>
		&nbsp;&nbsp;
		<!-- <button id="lateInfoButton" class="btn btn-info"
			style="display: none; height: 30px; margin-top: -10px;">Details</button>
 -->

		<table class="table table-bordered table-hover" id="employeeTable"
			width="100%">
			<tr height="30px"
				style="color: black; background-color: #F1F1F1; vertical-align: middle;"
				align="center">
				<td width="10px"><b>SNO.</b></td>
				<td width="200px"><b>Att Date</b></td>
				<td><b>In Time</b></td>

				<td><b>Out Time</b></td>
				<td><b>In Status</b></td>
				<td><b>Out Status</b></td>
				<td><b>Status</b></td>
				<td><b>Present</b></td>
				<td width="75px"></td>
			</tr>

			<c:forEach var="item" items="${facultyAttendStatusVOlist}"
				varStatus="status">
				<tr height="25px" style="color: black; vertical-align: middle;">
					<td align="center"><b>${status.count}.</b></td>
					<td>&nbsp; <fmt:formatDate pattern="dd-MM-yyyy"
							value="${item.cdate}" />
					</td>
					<td>&nbsp;${item.intime}</td>
					<td>&nbsp;${item.outtime}</td>
					<td align="center">&nbsp;${item.intimestatus}</td>
					<td align="center">&nbsp; ${item.outtimestatus}</td>
					<td align="center">${item.status}</td>
					<td align="center">${item.present}</td>
				</tr>
			</c:forEach>
		</table>

		<div id="dialog-form" title="Change Employee Information"
			class="container">
			<br>&nbsp;

			<ff:form role="form" class="form-horizontal" id="employeeForm"
				commandName="EmptyfacultyAttendStatusVO">
				<div class="control-group">
					<label for="attendus" class="control-label">Attendus Date</label>
					<div class="controls">
						<input type="text" name="cdate" id="attdDate" class="form-control"
							value="" disabled="disabled"></input>
					</div>
				</div>
				<div class="control-group">
					<label for="intime" class="control-label">In Time</label>
					<div class="controls">
						<input type="text" name="intime" id="inTime" class="form-control"
							value=""></input>
					</div>
				</div>
				<div class="control-group">
					<label for="outtime" class="control-label">Out Time</label>
					<div class="controls">
						<input type="text" name="outtime" id="outTime"
							class="form-control" value=""></input>
					</div>
				</div>
				<div class="control-group">
					<label for="instatus" class="control-label">In Status</label>
					<div class="controls">
						<ff:select path="intimestatus" id="inStatus"
							class="form-control" value="">
							<option value="Normal">Normal</option>
							<option value="Late">Late</option>
							</ff:select>
					</div>
				</div>
				<div class="control-group">
					<label for="outstatus" class="control-label">Out Status</label>
					<div class="controls">
						<ff:select path="outtimestatus" id="outStatus"
							class="form-control" >
							<option value="Normal">Normal</option>
							<option value="Early">Early</option>
							</ff:select>
					</div>
				</div>
				<div class="control-group">
					<label for="status" class="control-label">Status</label>
					<div class="controls">
						<ff:select path="status" id="status" class="form-control"
							>
							<option value="Normal">Normal</option>
							<option value="Late">Late</option>
							</ff:select>
					</div>
				</div>
				<div class="control-group">
					<label for="present" class="control-label">Present</label>
					<div class="controls">
						<ff:select path="present" class="form-control"
							id="present" value="">
							<option value="Yes">Yes</option>
							<option value="No">No</option></ff:select>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="button" onclick="updateEmployee()" value="Update"
							class="btn btn-primary"></input> <input type="button"
							onclick="deleteAttendus()" value="Delete"  class="btn btn-danger"></input>
					</div>
				</div>
			</ff:form>
		</div>
		
		<div id="dialog-success-message" title="Updation Status">
			<span id="updation-success" style="display: none; font-weight: bold;"></span>
		</div>
		
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


</body>
</html>
