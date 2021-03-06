<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <!-- Nav Bar Section -->
    <nav class="navbar navbar-expand-lg navbar-light justify-content-center" style="background-color: #fbbf5d;">
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto d-flex align-items-center justify-content-center">
          <li class="nav-item active">
            <a class="nav-link" href="/index">Home<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/about">About Me</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              My Links
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="/resources/static/documents/Alexander_Alvonellos_Resume.docx">Download Resume</a>
              <a class="dropdown-item" href="https://www.linkedin.com/in/alexander-alvonellos-1584a040/">Linked In</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="https://www.github.com/alvonellos">GitHub</a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- End Nav Bar -->

    <style>
        html {
          background: url('/resources/static/img/background-about.png') no-repeat center center fixed;
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
        }
    </style>
	<head>
	<link rel="shortcut icon" type="image/png" th:href="@{/resources/static/img/favicon.ico}"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<title>alvonellos.com | about </title>
	</head>
	<body onload="document.forms['statistics'].submit()">
        <iframe name="dummy" id="dummy" style="display: none;"></iframe>
        <form method="POST" action="/statistics" name="statistics" target="dummy"/>
            <input type="hidden" name="userAgent" value="<%= request.getHeader("user-agent") %>"/>
            <input type="hidden" name="method" value="<%=request.getMethod()%>"/>
            <input type="hidden" name="requestURI" value="<%=request.getRequestURI()%>"/>
            <input type="hidden" name="protocol" value="<%= request.getProtocol() %>"/>
            <input type="hidden" name="remoteHost" value="<%= request.getRemoteHost() %>"/>
            <input type="hidden" name="remoteAddr" value="<%= request.getRemoteAddr() %>"/>
        </form>
    </body>
</html>