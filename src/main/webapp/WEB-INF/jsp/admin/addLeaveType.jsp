<%@ taglib uri="http://www.springframework.org/tags/form" prefix="ff"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Add Leave Type | BAS</title>
    
      <div class="span6">
                    <ul class="breadcrumb pull-right">
                        <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                        <li><a href="#">Action</a> <span class="divider">/</span></li>
                        <li class="active">Add Leave Type</li>
                    </ul>
                </div> 
      <%@ include file="aimport.jsp" %>
      
     <style>
      .ui-dialog-titlebar{
      background-color: #0E90D2;
      background-image: none;
      color : #000;
      }
      </style>
       
<script>
$(document).ready(function(){
	$('#dialog-form').dialog({
		autoOpen: false,
		heigt: 500,
		width: 500,
		modal: true,
		show: {
			effect : "blind",
			duration: 200
		},
		hide: {
			effect: "explode",
			duration:200
		}
	});
});

function addUser() {
	var formdata = $("#springForm").serialize();
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/addLeaveTypeTodb",
		type : "post",
		data: formdata,
		success: function(results){
			
			$( "#users" ).append( "<tr>" +
					"<td>" + $("#leaveType").val() + "</td>" +
					"<td>" + $("#description").val() + "</td>" +
					"<td>" + results + "</td>" +
					"<td>" + results + "</td>" +
					"<td>" + "Rama" + "</td>" +		
					"</tr>" );
					    $("#dialog-form").dialog( "close" );
		}
	});
	
    
}

function formPopup(){
	$("#dialog-form").dialog('open');
	 
}
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  -->
 <style type="text/css">
    .bs-example{
    	margin: 3px;
    }
</style> 
    
</head>
<body>
 
 


<div id="div1" style="width:80px;height:20px;display:none;background-color:orange;"></div><br>
<div id="div2" style="width:80px;height:30px;display:none;background-color:silver;"></div><br>
<div id="div3" style="width:80px;height:40px;display:none;background-color:green;"></div>


<!--Header-->
      <%@ include file="aheader.jsp" %>
    <!-- /header -->

    <section class="title">
        <div class="container">
            <div class="row-fluid">
                <div class="span6">
                    <h3>Add Leave Type</h3>
                </div>
                <!-- <div class="span6">
                    <ul class="breadcrumb pull-right">
                        <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                        <li><a href="#">Pages</a> <span class="divider">/</span></li>
                        <li class="active">Portfolio</li>
                    </ul>
                </div> -->
            </div>
        </div>
    </section>

 <section id="portfolio" class="container main">   

	<div id="dialog-form" title="Add Leave Type">
  	
  	<ff:form role="form" class="form-horizontal" 
					commandName="leaveTypeForm"  id="springForm">
    <fieldset>
    <div class="form-group">
      <label for="name" class="control-label col-xs-4">Leave Type</label>
      <div class="col-xs-6">
      <ff:input type="text" path="leaveType" id="leaveType" placeholder="Leave Type" class="form-control"/>
      </div></div>
      <div class="form-group">
      <label for="email" class="control-label col-xs-4">Description</label>
      <div class="col-xs-6">
      <ff:textarea class="form-control" path="description" rows="3" id="description"></ff:textarea>
      <!-- <input type="text" name="description" id="description" placeholder="Description" class="form-control"/> -->
       </div></div>
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <button type="button" class="btn btn-primary" onclick="addUser()">Add Leave</button>
      <!-- <button type="button" class="btn btn-primary" onclick="closedialog()">Close</button> -->
    </fieldset>
  </ff:form>
  </div>
  
  <div id="users-contain" class="ui-widget">
  <h4>Leave Types:</h4>
   
    
  <!-- <button id="create-user"><span class="glyphicon glyphicon-pencil"></span></button> -->
  <div class="bs-example">
    <form>
        <!-- <button type="submit"  class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> </button> -->
        <!-- <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> </button> -->
		 
    </form>
</div>
  <table  class="table table-bordered table-hover" width="100%" id="users">
    <thead>
      <tr class="ui-widget-header ">
        <th><h5>Leave Type</h5></th>
        <th><h5>Description</h5></th>
        <th><h5>Date of Entry</h5></th>
        <th><h5>Date of Modification</h5></th>
        <th><h5>Entry By</h5></th>
        <th><button type="button" id="create-user" onclick="formPopup()"><span class="glyphicon glyphicon-plus"></span></button></th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach var="item" items="${listOfLeaveType}" varStatus="status">
       <tr>
        <td align="left" valign="middle">${item.leaveType}</td>
        <td>${item.description}</td>
        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${item.doe}" /></td>
        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${item.dom}" /></td>
        
        <td>${item.entryBy }</td>
        <td><button type="submit" id="pd" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> </button></td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
</div>

  
	<%-- <ff:form action="${pageContext.request.contextPath}/admin/addLeaveTypeTodb"
					method="post" commandName="designation"  id="springForm">
					<fieldset>
						<legend style="color: blue; font-weight: bold;" align="left">
							<b><font color="darkblue">Add Leave Type</font></b>
						</legend>
						<br />
						<table width="630" border="0" align="left"
							style="background-image: url(${pageContext.request.contextPath}/images/nhbg.jpg);">
							
							<!-- <tr bgcolor="#66CCFF" style="color: #000000; font-weight: bold;">
								<td>Designation Id</td>
								<td><input  type="text" id="designationId" name="designationId"
										size="10" style="height: 15px"></input>
										  
										</td> -->
										<tr bgcolor="#66CCFF" style="color: #000000; font-weight: bold;">
								<td>leaveType</td>
								<td><input  type="text" id="leaveType" name="leaveType"
										size="10" style="height: 15px" class="text ui-widget-content ui-corner-all"></input>
										  
										</td>
							</tr>
							<tr bgcolor="#66CCFF" style="color: #000000; font-weight: bold;">
								<td>Description</td>
								<td><input  type="text" id="description" name="description"
										size="10" style="height: 15px"class="text ui-widget-content ui-corner-all" ></input>
										  
										</td>
										 
										<!-- <tr bgcolor="#66CCFF" style="color: #000000; font-weight: bold;">
								<td>Date of entry</td>
								<td><input  type="text" id="doe" name="doe"
										size="10" style="height: 15px"></input>
										  
										</td>
							</tr>
							<tr bgcolor="#66CCFF" style="color: #000000; font-weight: bold;">
								<td>Date of modification</td>
								<td><input  type="text" id="dom" name="dom"
										size="10" style="height: 15px"></input>
										  
										</td>
							</tr> -->
							<tr bgcolor="#66CCFF" style="color: #000000; font-weight: bold;">
								<td>Entry By</td>
								<td><input  type="text" id="entryBy" name="entryBy"
										size="10" style="height: 15px" class="text ui-widget-content ui-corner-all"></input>
										  
										</td>
							</tr>
							
							<tr bgcolor="white" style="color: #000000; font-weight: bold;">
								<td><input type="submit" class=#5C5C99 size="30" value="AddLeaveType" ></input></td>
							</tr>
						</table>
					</fieldset>
				</ff:form>
 --%>				
</section>
 
<div id="panel"></div>
<script>$(function(){$("#flip").css({color:'red',fontweight:'bold'})});</script>
<script scr="/Users/ramakrishna/Documents/jquery-2.1.4.min.js"></script>

<footer id="footer">
    <div class="container">
        <div class="row-fluid">
            <div class="span5 cp">
                &copy; 2013 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>. All Rights Reserved.
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
                <a id="gototop" class="gototop pull-right" href="#"><i class="icon-angle-up"></i></a>
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
        <form class="form-inline" action="index.html" method="post" id="form-login">
            <input type="text" class="input-small" placeholder="Email">
            <input type="password" class="input-small" placeholder="Password">
            <label class="checkbox">
                <input type="checkbox"> Remember me
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

