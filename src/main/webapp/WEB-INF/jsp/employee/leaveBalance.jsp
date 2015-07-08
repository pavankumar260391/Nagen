<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Leave Balance| Nova</title>
   <%@include file="eimport.jsp" %>
</head>

<body>

    <!--Header-->
     <%@include file="eheader.jsp" %>
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
                        <li><a href="#">Pages</a> <span class="divider">/</span></li>
                        <li class="active">Leave Balance</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- / .title -->     

    <section id="portfolio" class="container main"> 
    <legend style = "font-size: 14px; text-align: left;"><b>Total Leave Balance</b></legend>   
        <table id="myTable" width="70%" border="1"
                        align="center"
                        style= "margin-top:0px;margin-bottom: 10px; margin-left: 0px; background-image: url(${pageContext.request.contextPath}/images/bgcolor.png);"
                        cellpadding="2px" cellspacing="8px">
                        <thead>
<!--                             <tr bgcolor="#6495ED" style="color: #000000; height: 20px; font-weight: bold;"> -->
								<tr bgcolor="FFFFFF" style="color: #000000; height: 20px; font-weight: bold;"> 
                                <td>CL</td>
                                <td>SL</td>
                                <td>EL</td>
                                <td>OD</td>
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
               </section>
               <section>
                    <table id = "legend" width = 25% border = "1"
                    align = "left" style = "margin-top: 20px; margin-left: 100px; backgorund-image: url(${pagecontext.request.contextPath}/images/bgcolor.png);"
                    cellpadding = "2px" cellspacing = "5 px">
                    <thead>
                    	<tr bgcolor = "FFFFFF" style = "color:#000000; height:20 px; font-weight: bold;">
                    	<th colspan = "2">Legend</th>
                    	</tr>
                    	<tr bgcolor = "FFFFFF" style = "color:#000000; height:20 px; font-weight: bold;">
                    	<td>Abbreviation</td>
                    	<td>Leave Type</td>
                    	</tr>
                    </thead>
                    	<tbody>
                    	<!-- <-- for each loop for -- -->
                    	
                    		<tr bgcolor = "FFFFFF" style = "color:black;">
                    			<td>CL</td>
                    			<td>Compensatory Leave</td>
                    		</tr>
                    		<tr>
                    			<td>SL</td>
                    			<td>Sick Leave</td>
                    		</tr>
                    		<tr>
                    			<td>EL</td>
                    			<td>Early Leave</td>
                    		</tr>
                    		<tr>
                    			<td>OD</td>
                    			<td>One Day</td>
                    		</tr>
                    	</tbody>
                    </table>
        
    </section>



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
