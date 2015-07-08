<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Portfolio | Nova</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sl-slide.css">

    <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-57-precomposed.png">
    
    <style type="text/css">
    	.input-large {
  			width: 410px;
 			 height: 24px !important;
  			margin-bottom: 10px !important;
 					 line-height: 30px !important;
  padding: 11px 19px !important;
  font-size: 17.5px !important;
  -webkit-border-radius: 6px;
     -moz-border-radius: 6px;
          border-radius: 6px;
}

.input-large[class=input-large] {
    width: 400px;
}
    
    </style>
 
    
</head>

<body style="background-color:#f5f5f5;">

    <!--Header-->
      <%@include file="/cheader.jsp" %>
    <!-- /header -->

    <section class="title">
        <div class="container">
            <div class="row-fluid">
                <div class="span6">
                    <h4>Credit Card Application Status</h4>
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

    <section id="portfolio" class="container" style="background-color:#f5f5f5;">     
    		<h4   style="margin-left:20px;">
    		Credit Card Application Status
    			<img src="${pageContext.request.contextPath}/images/credit-card/success_credit.png" width="80" height="30" class="sepia">  
    		</h4>
    			<div class="alert alert-info fade in" id="messageHeader" style="display:none">
    				<a href="#" class="close" data-dismiss="alert">&times;</a>
					    <strong>Note!</strong> <b>Sorry this application number is not valid!</b>.
				</div>
    		
    	    <table class="table" style="margin-left:20px;color:black;">
        <tbody>
        
        	<tr>
                <td style="text-align:right;font-size: 14px;">Enter Application Number&nbsp;&nbsp;&nbsp;&nbsp;</td>
             	 <td><input type="text" placeholder="XXX-XXX-XXXX" name="applicationNumber" style="width:220px;height:1px;"></input></td>
            </tr> 
            
           
             <tr>
                <td>&nbsp;</td>
                <td>
              <button type="button" id="creditCardStatusId"  class="btn btn-primary btn-sm">Credit Card Status</button>
                <td>
            </tr>
        </tbody>
    </table>
    
    <div id="hideTable" style="display:none">
    <table class="table" style="margin-left:50px;color:black;">
    		 <tr>
                  <td colspan="4">
	                  <img src="" width="100" height="100" class="img-thumbnail" id="cphoto" style="margin-left:100px">
                  </td>
            </tr>
            <tr>
                <td style="text-align:right;font-size: 14px;">First Name&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td><input type="text" name="firstName" style="width:220px;height:1px;" readonly="readonly"></input></td>
                   <td style="text-align:left;font-size: 14px;width:100px;">Last Name&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td><input type="text" name="lastName" style="width:220px;height:1px;" readonly="readonly"></input></td>
            </tr>
            <tr>
                <td style="text-align:right;font-size: 14px;">Email&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td><input type="text" name="email" style="width:220px;height:1px;" readonly="readonly"></input></td>
                   <td style="text-align:left;font-size: 14px;">Application Status&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td><input type="text" name="applicationStatus" style="width:220px;height:1px;" readonly="readonly"></input></td>
            </tr>
    </table>
    </div>
    </section>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/><br/><br/>
    <!--Bottom-->
<!--/bottom-->

<!--Footer-->
 <%@include file="/cfooter.jsp" %>
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
 <script src="${pageContext.request.contextPath}/js/credit/credit-card.js"></script> 
 <script type="text/javascript">
        var contextPath="${pageContext.request.contextPath}"; 
  		$(document).ready(function(){
  			creditCardInit();
  		});//end of the ready
  </script>
 
</body>
</html>
