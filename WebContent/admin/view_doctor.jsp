<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ page import="speclst.SpecialistDao" %>
    <%@ page import="java.util.List" %>
    <%@ page import="speclst.Specialist" %>
    <%@ page import="doctor.DoctorDao" %>
    <%@ page import="doctor.Doctor" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../Component/Allcss.jsp" %>

<style type="text/css">
.point-card{
     box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container-fluid p-3">
<div class="row">

<div class="col-md-12" >
<div class="card paint-card">
<div class="card-body">
<p class="fs-3 text-center">Doctor Details</p>

<c:if test="${not empty sucMsg}">
    <p class="text-center text-success fs-3">${sucMsg}</p>
    <c:remove var="sucMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsg}">
    <p class="text-center text-danger fs-3">${errorMsg}</p>
    <c:remove var="errorMsg" scope="session"/>
</c:if>

<table class="table">
<thead>
<tr>
<th scope="col">FullName</th>
<th scope="col">DOB</th>
<th scope="col">Qualification</th>
<th scope="col">Specialist</th>
<th scope="col">Email</th>
<th scope="col">Mob No</th>
<th scope="col">Action</th>
</tr>
</thead>
<tbody>
<%
DoctorDao dao1= new DoctorDao();
List<Doctor> l = dao1.getAllDoctor();
for(Doctor d:l)
{%>
<tr>
<td><%=d.getFullName() %></td>
<td><%=d.getDob() %></td>
<td><%=d.getQualification() %></td>
<td><%=d.getSpecialist() %></td>
<td><%=d.getEmail() %></td>
<td><%=d.getMobNo() %></td>
<td>
<a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
<a href="../DeleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
</td>
</tr>
	<%}
%>
</tbody>
</table>
</div>
</div>
</div>

</div>
</div>

</body>
</html>