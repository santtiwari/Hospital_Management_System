<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login Page</title>

<%@include file="Component/Allcss.jsp"%>
<style type="text/css">
.point-card{
     box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

</style>

</head>
<body>
<%@include file="Component/Navbar.jsp" %>

<div class="container p-5">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card point-card">
<div class="card-body">
<p class="fs-4 text-center">Admin Login</p>

<c:if test="${not empty sucMsg}">
    <p class="text-center text-success fs-3">${sucMsg}</p>
    <c:remove var="sucMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsg}">
    <p class="text-center text-danger fs-5">${errorMsg}</p>
    <c:remove var="errorMsg" scope="session"/>
</c:if>

<form action="AdminLogin" method="post">
<div class="mb-3">
<label class="form-label">Email address</label><input required 
name="email" type="email" class="form-control">
</div>

<div class="mb-3">
<label class="form-label">Password</label><input required 
name="Password" type="Password" class="form-control">
</div>

<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>