<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="doctor.DoctorDao" %>
    <%@page import="doctor.Doctor" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
.point-card{
     box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

</style>
<%@include file="../Component/Allcss.jsp" %>
</head>
<body>

<c:if test="${empty doctobj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>
<p class="text-center fs-3">Doctor DashBoard</p>
<%
Doctor d = (Doctor)session.getAttribute("doctobj");
DoctorDao dao = new DoctorDao();
%>
<div class="container p-5">
<div class="row">
<div class="col-md-4 offset-md-2">
<div class="card paint-card">
<div class="card-body text-center text-success">
<i class="fas fa-user-md fa-3x"></i><br>
<p class="fs-4 text-center">
Doctor<br><%=dao.countDoctor() %>
</p>
</div>
</div>
</div>
<div class="col-md-4">
<div class="card paint-card">
<div class="card-body text-center text-success">
<i class="far fa-calendar-check fa-3x"></i><br>
<p class="fs-4 text-center">
Total Appointment<br>
<%= dao.countAppointmentByDoctorId(d.getId())%>
</p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>