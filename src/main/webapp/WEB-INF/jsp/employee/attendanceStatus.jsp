 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="ff"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Attendance | LMS</title>    
     <%@include file="eimport.jsp" %>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    
    <script>
  function ajaxCall(option){
        $.ajax({
        	url:"${pageContext.request.contextPath}/employee/retreiveEmployeeInfo/"+option,	        	
        	type: "POST",
        	dataType:'json',
        	success: function(result){	     	        		
        		$('#employeeTable').empty();	
        	        var trHTML ="";
        	        trHTML += "<tr height=\"30px\" style=\"color:black; background-color: #F1F1F1; vertical-align: middle;\" align=\"center\"> <td width=\"10px\"><b>SNO.</b></td><td width=\"250px\"><b>Att Date</b></td><td><b>In Time</b></td><td><b>Out Time</b></td><td><b>In Status</b></td><td><b>Out Status</b></td><td><b>Status</b></td><td><b>Present</b></td></tr>";
        	        $.each(result, function (i, item) {	        	        	
        	        	var parsedDate = new Date(parseInt(item.cdate));
        	        	var month = parsedDate.getMonth() + 1;
        	        	var day = parsedDate.getDate();
        	        	var year = parsedDate.getFullYear();
        	        	var date = day + "-" + month + "-" + year;
        	            trHTML += '<tr height="25px" style="color: black; vertical-align: middle;"><td><b>' + i + '.</b></td><td>'+ date +'</td><td>' + item.intime + '</td><td>' + item.outtime + '</td><td>' + item.intimestatus + '</td><td>' + item.outtimestatus + '</td><td>' + item.status + '</td><td>' + item.present + '</td></tr>';
        	        });
        	        $('#employeeTable').append(trHTML);	        	    
        		
        	}});
    }
   
    $(document).ready(function(){ 
    	$('#monthSelect').change(function(){
    		var option = $(this).find('option:selected').val();
    		ajaxCall(option);
    	});
    });
  /*   $(document).ready(function(){
	    $('#monthSelect').change(function(){
	    	var option = $(this).find('option:selected').val();
	        $.ajax({
	        	url:"${pageContext.request.contextPath}/employee/retreiveEmployeeInfo/"+option,	        	
	        	type: "POST",
	        	dataType:'json',
	        	success: function(result){	     	        		
	        		$('#employeeTable').empty();	
	        	        var trHTML ="";
	        	        trHTML += "<tr height=\"30px\" style=\"color:black; background-color: #F1F1F1; vertical-align: middle;\" align=\"center\"> <td width=\"10px\"><b>SNO.</b></td><td width=\"250px\"><b>Att Date</b></td><td><b>In Time</b></td><td><b>Out Time</b></td><td><b>In Status</b></td><td><b>Out Status</b></td><td><b>Status</b></td><td><b>Present</b></td></tr>";
	        	        $.each(result, function (i, item) {	        	        	
	        	        	var parsedDate = new Date(parseInt(item.cdate));
	        	        	var month = parsedDate.getMonth() + 1;
	        	        	var day = parsedDate.getDate();
	        	        	var year = parsedDate.getFullYear();
	        	        	var date = day + "-" + month + "-" + year;
	        	            trHTML += '<tr height="25px" style="color: black; vertical-align: middle;"><td><b>' + i + '.</b></td><td>'+ date +'</td><td>' + item.intime + '</td><td>' + item.outtime + '</td><td>' + item.intimestatus + '</td><td>' + item.outtimestatus + '</td><td>' + item.status + '</td><td>' + item.present + '</td></tr>';
	        	        });
	        	        $('#employeeTable').append(trHTML);	        	    
	        		
	        	}});
	        });
	    }); */

    </script>
 
</head>

<body>

    <!--Header-->
     <%@include file="eheader.jsp" %>
    <!-- /header -->

    <section class="title">
        <div class="container">
            <div class="row-fluid">
                <div class="span6">
                    <h3>Attendance Status</h3>
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
    		
            <ff:form action="${pageContext.request.contextPath}/employee/retreiveEmployeeInfo" method="post" commandName="monthUtility">
          
         	    <div class="col-xs-12">
         	           	    
             				<ff:select path="month" id="monthSelect" items="${monthList}" name="selectedGroupName" class="form-control"  style="width: 300px;">
								
							</ff:select> 
							&nbsp;&nbsp;
						<!-- 	<input
								type="submit" value="Show Attendance"
								id="loadUsersId"  class="btn btn-info" style="height:30px;margin-top: -10px;"/>
            	 -->
            	</div>
           </ff:form> 
           
    	
        	<table  class="table table-bordered table-hover" id="employeeTable" width="100%" height="auto">
        					
								<tr height="30px"
									style="color:black; background-color: #F1F1F1; vertical-align: middle;"
									align="center">
									<td width="10px"><b>SNO.</b>
									</td>
									<td width="250px"><b>Att Date</b>
									</td>
									<td><b>In Time</b>
									</td>
									
									<td><b>Out Time</b>
									</td>
									<td><b>In Status</b>
									</td>
									<td><b>Out Status</b></td>
									<td><b>Status</b></td>
									<td><b>Present</b></td>
								</tr>
							
							 	<c:forEach var="item" items="${facultyAttendStatusVOlist}" varStatus="status">
									<tr height="25px" style="color: black; vertical-align: middle;">
										<td align="center"><b>${status.count}.</b>
										</td>
										<td>&nbsp;
										<fmt:formatDate pattern="dd-MM-yyyy" value="${item.cdate}" />
										</td>
										<td>&nbsp;${item.intime}</td>
												<td>&nbsp;${item.outtime}</td>
										<td align="center">&nbsp;${item.intimestatus}</td>
										<td align="center">&nbsp;
										${item.outtimestatus}
										</td>
										<td align="center">
												${item.status}
										</td>
											<td align="center">
												${item.present}
										</td>
									</tr>
							</c:forEach>
						<tr height="25px" style="color: black; vertical-align: middle;">
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										
									</tr>
									<tr height="25px" style="color: black; vertical-align: middle;">
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										
									</tr>
									
										<tr height="25px" style="color: black; vertical-align: middle;">
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										
									</tr>
									
									
										<tr height="25px" style="color: black; vertical-align: middle;">
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										
									</tr>
									
									
									
										<tr height="25px" style="color: black; vertical-align: middle;">
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										
									</tr>
									
									
										<tr height="25px" style="color: black; vertical-align: middle;">
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										
									</tr>
									
									
										<tr height="25px" style="color: black; vertical-align: middle;">
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										<td align="center">&nbsp;</td>
										
									</tr>
							</table>
        
    </section>

<!--Footer-->
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

<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/vendor/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>
