<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="doctor.Doctor" %>
    <%@page import="appontmnt.AppointmentDAO" %>
    <%@page import="java.util.List" %>
    <%@page import="appontmnt.Appointment" %>
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
<c:if test="${empty doctobj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>
<div class="container p-3">
<div class="row">
<div class="col-md-12">
<div class="card paint-card">
<div class="card-body">
<p class="fs-3 text-center">Patient Detail's</p>
<c:if test="${not empty sucMsg}">
    <p class="text-center text-success fs-4">${sucMsg}</p>
    <c:remove var="sucMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsg}">
    <p class="text-center text-danger fs-4">${errorMsg}</p>
    <c:remove var="errorMsg" scope="session"/>
</c:if>

<table class="table">
<thead> 
<tr>
<th scope="col">Full Name</th>
<th scope="col">Gender</th>
<th scope="col">Age</th>
<th scope="col">Appointment Date</th>
<th scope="col">Email</th>
<th scope="col">Mob No</th>
<th scope="col">Diseases</th>
<th scope="col">Status</th>
<th scope="col">Action</th>
</tr>
</thead>
<tbody>

<%
Doctor d = (Doctor)session.getAttribute("doctobj");
AppointmentDAO dao = new AppointmentDAO();
List<Appointment> list= dao.getAllAppointmentByDoctorLogin(d.getId());
for(Appointment ap:list)
{%>
<tr>
<th><%=ap.getFullName() %></th>
<td><%=ap.getGender() %></td>
<td><%=ap.getAge() %></td>
<td><%=ap.getAppoinDate() %></td>
<td><%=ap.getEmail() %></td>
<td><%=ap.getPhNo() %></td>
<td><%=ap.getDiseases() %></td>
<td><%=ap.getStatus() %></td>
<td>
<%
if("pending".equals(ap.getStatus()))
{%>
 <a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm">Comment</a>
	<%}else{%>
		<a href="#" class="btn btn-success btn-sm disabled">Comment</a>
	<%}
%>

</td>
</tr>
	<%}
%>

<tr>
<th></th>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>

</body>
</html>