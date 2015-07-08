<%@ taglib uri="http://www.springframework.org/tags/form" prefix="ff"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Add Leave Reason| BAS</title>
      <%@ include file="aimport.jsp" %>
</head>
<body>

<!--Header-->
      <%@ include file="aheader.jsp" %>
    <!-- /header -->

    <section class="title">
        <div class="container">
             <div class="row-fluid">
                <div class="span6">
                    <h3>Add Leave Reason</h3>
                </div> 
                 <div class="span6">
                    <ul class="breadcrumb pull-right">
                        <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                        <li><a href="#">Action</a> <span class="divider">/</span></li>
                        <li class="active">Add Leave Reason</li>
                    </ul>
                </div> 
            </div>
        </div>
    </section>

 <section id="portfolio" class="container main">   

	<ff:form action="${pageContext.request.contextPath}/admin/addLeaveReasontodb"
					method="post" commandName="leaveReasonForm"  id="springForm">
					<fieldset>
						<legend style="color: blue; font-weight: bold;" align="left">
							<b><font color="darkblue">Add leave Reason</font></b>
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
								<td>Leave Detail</td>
								<td><input  type="text" id="leaveDetail" name="leaveDetail"
										size="10" style="height: 15px"></input>
										  
										</td>
							</tr>
							<tr bgcolor="#66CCFF" style="color: #000000; font-weight: bold;">
								<td>Description</td>
								<td><input  type="text" id="description" name="description"
										size="10" style="height: 15px"></input>
										  
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
										size="10" style="height: 15px"></input>
										  
										</td>
							</tr>
							
							 <tr bgcolor="white"  style="color: #000000; font-weight: bold;">
							 
								<!-- <td><input type="reset" value="Clear" size="30"
									style="background-color: #4c70ba" /></td> -->
								<td><input type="submit" class="btn btn-info"   value="Add Leave Reason"
									name="buttonAction" size="30"   /></td>
									 
									
							</tr>
						</table>
					</fieldset>
				</ff:form>
</section>

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

