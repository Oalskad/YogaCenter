<%-- 
    Document   : header
    Created on : Jun 7, 2023, 10:21:18 AM
    Author     : devli
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- basic -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- mobile metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1">
  <!-- site metas -->
  <title>Yogasan</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- bootstrap css -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- style css -->
  <link href="css/style.css" rel="stylesheet" type="text/css"/>
  <!-- Responsive-->
  <link rel="stylesheet" href="css/responsive.css">
  <!-- fevicon -->
  <link rel="icon" href="images/fevicon.png" type="image/gif" />
  <!-- Scrollbar Custom CSS -->
  <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
  <!-- Tweaks for older IEs-->
  <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
  <!-- owl stylesheets -->
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
    media="screen">
</head>
  <!-- header section start -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="logo"><a href="home.jsp"><img src="images/logo.png"></a></div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
      aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-item nav-link" href="home.jsp">Home</a>
        <a class="nav-item nav-link" href="about.html">About</a>
        <a class="nav-item nav-link" href="classes.html">Classes</a>
        <a class="nav-item nav-link" href="schedule.html">Schedule</a>
        <a class="nav-item nav-link" href="trainer.html">Trainer</a>
        <a class="nav-item nav-link" href="contact.html">Contact us</a>
        <c:if test = "${sessionScope.user == null}">
            <a class="nav-item nav-link" href="<%=url%>/Authentication/signin.jsp">Login</a>              
        </c:if>
        <c:if test = "${sessionScope.user != null}">
            <div class="btn-group btn-user-menu">
                  <button style=" margin-left: 100px; background: #be2532 " class=" btn btn-secondary btn-sm dropdown-toggle btn-user" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                  
                  <span>${sessionScope.user.username}</span>
                  </button>
                  <div class="dropdown-menu btn-menu">
                       <a class="dropdown-item btn-menu-item" href="profile.jsp">Profile</a>
                                                    <a class="dropdown-item btn-menu-item" href="changePassword.jsp">Change password</a>
                                                    <a class="dropdown-item btn-menu-item" href="<%=url%>/ScheduleController">View my schedule</a>
                                                    <a class="dropdown-item btn-menu-item" href="<%=url%>/LoginController/signup?action=logout">
                                                          <b style="color: black">Logout</b>
                                                    </a>
                  </div>
            </div>               
        </c:if>
        <a class="nav-item nav-link" href="#"><img src="images/search-icon.png"></a>
      </div>
    </div>
  </nav>
  <!-- header section end -->

</html>
