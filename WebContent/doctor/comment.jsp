<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="appontmnt.AppointmentDAO" %>
    <%@ page import="appontmnt.Appointment" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
.point-card{
     box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.backImg{
background: Linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
url("img/hospital-logo4.svg");
height: 20vh;
width: 100%;
background-size: cover;
background-repeat: no-repeat; 
}

</style>

<%@include file="../Component/Allcss.jsp" %>
</head>
<body>

<c:if test="${empty doctobj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp" %>
<div class="container-fulid backImg p-5">
<p class="text-center fs-2 text-white"></p>
</div>
<div class="container p-3">
<div class="row">

<div class="col-md-6 offset-md-3">
<div class="card paint-card">
<div class="card-body">
<p class="text-center fs-4">Patient Comment</p>

<%
int id = Integer.parseInt(request.getParameter("id"));
AppointmentDAO dao = new AppointmentDAO();
Appointment ap=dao.getAppointmentById(id);
%>

<form class="row" action="../UpdateStatus" method="post">
<div class="col-md-6">
<label>Paitent Name</label><input type="text" readonly value="<%=ap.getFullName() %>"
class="form-control">
</div>

<div class="col-md-6">
<label>Age</label><input type="text" readonly value="<%=ap.getAge() %>"
class="form-control">
</div>

<div class="col-md-6">
<label>Mob No</label><input type="text" readonly value="<%=ap.getPhNo() %>"
class="form-control">
</div>

<div class="col-md-6">
<label>Diseases</label><input type="text" readonly value="<%=ap.getDiseases() %>"
class="form-control">
</div>

<div class="col-md-12">
<br><label>Comment</label>
<textarea required name="comm" class="form-control" rows="3"
cols=""></textarea>
</div>

<input type="hidden" name="id" value="<%=ap.getId()%>"><input
type="hidden" name="did" value="<%=ap.getDoctorId()%>">

<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

</form>
</div>
</div>
</div>

</div>
</div>

</body>
</html>