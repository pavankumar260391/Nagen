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


<script>
contextPath= "${pageContext.request.contextPath}";

function updateEmployee(){
	 var myForm = $("#employeeForm").serialize(); 
	
	$.ajax({
		url : contextPath+"/admin/updateEmployee",
		type:"post",
		data:myForm,
		success: function(result){
			
		}
		
	});
}

function ajaxCall(option,controller,selectedMonth){
	$.ajax({
    	url:contextPath+"/admin/"+controller+"/"+option,	        	
    	type: "POST",	     
    	success: function(result){
    		$('#employeeTable').empty();
    			var months = {1:"January", 2:"February", 3:"March", 4:"April", 5:"May", 6:"June", 7:"July", 8:"August", 9:"September", 10:"October", 11:"November", 12:"December" };
    	        var trHTML ="";
    	        var inStatusCount = 0;
	        	var outStatusCount = 0;
    	        trHTML += "<tr height=\"25px\" style=\"color:black; background-color: #F1F1F1; vertical-align: middle;\" align=\"center\"> <td width=\"10px\"><b>SNO.</b></td><td width=\"250px\"><b>Att Date</b></td><td><b>In Time</b></td><td><b>Out Time</b></td><td><b>In Status</b></td><td><b>Out Status</b></td><td><b>Status</b></td><td><b>Present</b></td><td></td></tr>";
    	        
    	        $.each(result, function (i, item) {
    	        	var counter = 0;
    	        	var instatus = $.trim(item.intimestatus);
    	        	var outstatus = $.trim(item.outtimestatus);    	        	
    	        	var parsedDate = new Date(parseInt(item.cdate));
    	        	var month = parsedDate.getMonth() + 1;
    	        	var day = parsedDate.getDate();
    	        	var year = parsedDate.getFullYear();
    	        	var date = day + "-" + month + "-" + year;
    	        	if(instatus == "Late"){
    	        		inStatusCount += 1;
    	        		instatus = '<td class="data'+(counter+4)+'" style="background-color: #F2DEDE;">' + item.intimestatus +'</td>';
    	        		
    	        	}else{
    	        		instatus ='<td class="data'+(counter+4)+'">' + item.intimestatus + '</td>';
    	        	}
    	        	if(outstatus == "Early"){
    	        		outStatusCount += 1;
    	        		outstatus= '<td class="data'+(counter+5)+'" style="background-color: #F2DEDE;">' + item.outtimestatus + '</td>';
    	        	}else{
    	        		outstatus = '<td class="data'+(counter+5)+'">' + item.outtimestatus + '</td>';
    	        	}
    	            trHTML += '<tr height="15px" id="resultDataRow'+i+'" style="color: black; vertical-align: middle;"><td class="data'+counter+'"><b>' + i + '.</b></td><td class="data'+(counter+1)+'">' + date + '</td><td class="data'+(counter+2)+'">' + item.intime + '</td><td class="data'+(counter+3)+'">' + item.outtime + '</td>'+instatus+''+outstatus+'<td class="data'+(counter+6)+'">' + item.status + '</td><td class="data'+(counter+7)+'">' + item.present + '</td><td class="data'+(counter+8)+'"><button id="btnId'+i+'" class="btn btn-primary" onClick="popupOpen(this.id)"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>Edit</button></td></tr>';
    	        });
    	        $('#employeeTable').append(trHTML);
    	        $('#dialog').attr('title', "Details for "+ months.selectedMonth);
    	        $('#montlylateInfo').show();
    	        $('#montlylateInfo').html('Total Late Arrival : '+inStatusCount);
    	        $('#montlyEarlyInfo').show();
    	        $('#montlyEarlyInfo').html('Total Early Out : '+outStatusCount);
    		
    	}});  
}

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
			var option = ui.item.value;
			var optionSelected = $(this).find('option:selected').val();
			ajaxCall(option,'retreiveEmployeeForAdmin',optionSelected);   			
		}
	});
});

$(document).ready(function(){
	$('#monthSelect').change(function(){
		var option = $(this).find('option:selected').val();
		ajaxCall(option,'retreiveEmployeeForAdminMonth',option);   	
		
	});
});

  
function popupOpen(rowId){	
	var resultRowId = $("#"+rowId).closest('tr').attr("id");
	$("#attdDate").val($("#"+resultRowId).children("td.data1").text());
	$("#inTime").val($("#"+resultRowId).children("td.data2").text());
	$("#outTime").val($("#"+resultRowId).children("td.data3").text());
	$("#inStatus").val($("#"+resultRowId).children("td.data4").text());
	$("#outStatus").val($("#"+resultRowId).children("td.data5").text());
	$("#status").val($("#"+resultRowId).children("td.data6").text());
	$("#present").val($("#"+resultRowId).children("td.data7").text());	
	$("#dialog-form").dialog("open");
}

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
    /* $(document).on("click","#btnId0", function() {
      $( "#dialog-form" ).dialog( "open" );
    }); */
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
					<h1>Show Employee</h1>
				</div>
				<div class="span6">
					<ul class="breadcrumb pull-right">
						<li><a href="index.html">Home</a> <span class="divider">/</span></li>
						<li><a href="#">Pages</a> <span class="divider">/</span></li>
						<li class="active">Portfolio</li>
					</ul>
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
					<table class="table borderless" align="left">
					<tbody>	
					<tr>
					<td>
					<!-- <label class="sr-only" for="searchName">Search Employee</label>
					 -->
					<input type="text" id="suggestBox" name="employeeName"
						placeholder="Search Employee" class="form-control"
						style="width: 300px;"></input>
						
						
					<label for="monthSelection" id="monthLabel" class="control-label" style="display: none;">Select Month:</label>
					
					<ff:select path="month" id="monthSelect" items="${adminMonthList}"
						style="display:none;" name="selectedGroupName" class="form-control">
					</ff:select>
						
					 <strong><p class="help-block" id="montlylateInfo" style="display: none;"></p></strong>
					<strong><p class="help-block" id="montlyEarlyInfo" style="display: none;"></p></strong>
					</td></tr>
					</tbody>
					
					</table>
		</ff:form>&nbsp;&nbsp;
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

			<ff:form role="form" class="form-horizontal" id="employeeForm" commandName="EmptyfacultyAttendStatusVO">
			<div class="control-group">
				<label for="attendus" class="control-label">Attendus Date</label> 
				<div class="controls">
				<input
					type="text" name="cdate" id="attdDate" class="form-control"
					value="" ></input>
				</div>	
				</div>
				<div class="control-group">
					 <label for="intime" class="control-label">In
						Time</label>
						<div class="controls">
						 <input type="text" name="intime" id="inTime"
					class="form-control" value=""></input>
					</div></div>
					<div class="control-group">
					 <label
					for="outtime" class="control-label">Out Time</label> 
					<div class="controls">
					<input
					type="text" name="outtime" id="outTime" class="form-control"
					value=""></input>
					</div></div>
					<div class="control-group">
					<label for="instatus" class="control-label">In
						Status</label>
						<div class="controls"> 
						<input type="text" name="intimestatus" id="inStatus"
					class="form-control" value=""></input>
					</div></div>
					<div class="control-group">
						<label
					for="outstatus" class="control-label">Out Status</label>
					 <div class="controls">
					 <input
					type="text" name="outtimestatus" id="outStatus" class="form-control"
					value=""></input>
					</div></div>
					<div class="control-group">
					 <label for="status" class="control-label">Status</label>
				<div class="controls">
				<input type="text" name="status" id="status" class="form-control"
					value=""></input>
					</div></div>
					<div class="control-group">
					 <label for="present" class="control-label">Present</label>
				<div class="controls">
				<input type="text" name="present" class="form-control" id="present"
					value=""></input>
					</div></div>
				<div class="control-group">
				<div class="controls">
				 <input type="button" onclick="updateEmployee()" value="Update"
					class="btn btn-primary"></input> 
					<input type="submit"
					value="Delete" class="btn btn-danger" align="center"></input>
					</div></div>
			</ff:form>
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
