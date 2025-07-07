<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="../Component/Allcss.jsp" %>

<style type="text/css">
.point-card{
     box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

</style>
</head>
<body>

<%@include file="Component/Navbar.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="User_login.jsp"></c:redirect>
</c:if>
<div class="container p-4">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card paint-card">
<p class="text-center fs-3">change password</p>
<div class="card-body">
<c:if test="${not empty sucMsg}">
    <p class="text-center text-success fs-3">${sucMsg}</p>
    <c:remove var="sucMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsg}">
    <p class="text-center text-danger fs-5">${errorMsg}</p>
    <c:remove var="errorMsg" scope="session"/>
</c:if>
<form action="changePassword" method="post">
<div class="mb-3">
<label>Enter New Password</label><input type="text"
name="newpassword" class="form-control" required>
</div>

<div class="mb-3">
<label>Enter Old Password</label><input type="text"
name="oldpassword" class="form-control" required>
</div>
<input type="hidden" value="${userobj.id}" name="uid">
<button class="btn btn-success col-md-12">Change Password</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>