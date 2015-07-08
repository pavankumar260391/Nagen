 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="ff"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Attendance | LMS</title>
     <%@include file="aimport.jsp" %>
</head>

<body>

    <!--Header-->
     <%@include file="aheader.jsp" %>
    <!-- /header -->

    <section class="title">
        <div class="container">
            <div class="row-fluid">
                <div class="span6">
                    <h3>Holiday Calendar</h3>
                </div>
                <div class="span6">
                    <ul class="breadcrumb pull-right">
                        <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                        <li><a href="#">Pages</a> <span class="divider">/</span></li>
                        <li class="active">Holiday Calendar</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- / .title -->     

    <section id="portfolio" class="container main">    
          
          	<div class="alert alert-info fade in" id="myAlert">
		    <a href="#" class="close" data-dismiss="alert">&times;</a>
    				<strong></strong> ${message}	
		</div>

          	<ff:form
					action="${pageContext.request.contextPath}/admin/holidayEntry"
					method="post" commandName="holidayEntryForm" id="holidayForm">
        		<table border="0"  style="width: 100%"  class="table">
      			 	 <tr>
					     <td  style="width:30%;text-align: right;">
					       <b>Date Of Holiday <font color="red">*</font>&nbsp; :</b> 
					     </td>
					     <td colspan="1" >
					        <input  type="text" name="holidayDate"  id="doh"  style="width: 20%"  class="datepicker"/>
					     </td>
					      <td colspan="1" align="left" valign="top" rowspan="9">
					    <!--   <img src="${pageContext.request.contextPath}/images/userReg.png"/> -->
					     </td>
					   </tr>
					   
					    <tr height="25px" >
					     <td colspan="1" style="width: 30%;text-align: right;">
					       <b>Working&nbsp; :</b> 
					     </td>
					     <td>
					         <select name="working" style="width: 20%" class="form-control">
					       			<option>Yes</option>  
					       			<option>No</option>
					         </select>
					       
					     </td>
					   </tr>
					   
					     <tr height="25px" >
					     <td colspan="1" style="width: 30%;text-align: right;">
					       <b>Holiday <font color="red">*</font>&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					        <select name="holiday" style="width: 20%" class="form-control">
					       			<option>Yes</option>  
					       			<option>No</option>
					         </select>
					     </td>
					   </tr>
					   
					     <tr height="25px" >
					     <td colspan="1"  style="width: 30%;text-align:right;">
					       <b>Weekend&nbsp; :</b> 
					     </td>
					     <td colspan="1" align="left" valign="bottom" >
					       <select name="weekend" style="width: 20%" class="form-control">
					       			<option>Yes</option>  
					       			<option>No</option>
					         </select>
					     </td>
					   </tr>
					   
					    <tr height="25px" >
					     <td colspan="1"  style="width: 10%;text-align:right;">
					       <b>Description <font color="red">*</font>&nbsp; :</b> 
					     </td>
					     <td colspan="1">
					         	<textarea rows="3" cols="200"  class="form-control" name="description" style="width:400px;"></textarea>
					     </td>
					   </tr>
					   </tr>
					   
					    <tr height="25px"  >
					     <td colspan="2" style="text-align: center;">
					        <input type="submit" value="Add Holiday"  class="btn btn-info" id="userRegistrationBt"/>
					     </td>
					   </tr>
					 </table>
        			</ff:form>
        
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
<script src="${pageContext.request.contextPath}/js/BeatPicker.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.datepicker').datepicker();
		$("input[type='text'][id='doh']").click(function(){
				$("#myAlert").alert();
		});
	});
</script>

</body>
</html>
