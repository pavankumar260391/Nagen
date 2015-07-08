<header class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a id="logo" class="pull-left" href="index.html"></a>
                   <img alt="" src="${pageContext.request.contextPath}/images/bg.jpg" style="margin-top:10px;"/>
                <div class="nav-collapse collapse pull-right">
                    <ul class="nav">
                        <li><a href="index.html">Home</a></li>
                     <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Leave Management <i class="icon-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/employee/leaveEntry">Apply Leave</a></li>
                                <li><a href="${pageContext.request.contextPath}/employee/leaveHistory">Leave History</a></li>
                                <li class="divider"></li>
                                <li><a href="${pageContext.request.contextPath}/employee/leaveBalance">Leave Balance</a></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/employee/attendanceStatus">Attendance</a></li>
                        <li class="active"><a href="portfolio.html">Gallery</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="icon-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="career.html">Career</a></li>
                                <li><a href="blog-item.html">Blog Single</a></li>
                                <li><a href="faq.html">FAQ</a></li>
                                <li><a href="pricing.html">Pricing</a></li>
                                <li><a href="404.html">404</a></li>
                                <li><a href="typography.html">Typography</a></li>
                                <li><a href="registration.html">Registration</a></li>
                                <li class="divider"></li>
                                <li><a href="privacy.html">Privacy Policy</a></li>
                                <li><a href="terms.html">Terms of Use</a></li>
                            </ul>
                        </li>
                          <li><a href="blog.html">Calendar</a></li>
                            <li><a href="blog.html">Profile</a></li> 
                           <li><a href="blog.html">Setting</a></li>  
                        <li><a href="contact-us.html">Logout</a></li>
                      <li class="login">
                           <img alt="" src="${pageContext.request.contextPath}/images/user.jpg" width="40" height="40"  class="img-circle">
                           Hello Amit!
                        </li>
                    </ul>        
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </header>