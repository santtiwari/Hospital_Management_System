<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@page import = "appontmnt.AppointmentDAO" %>
    <%@page import="java.util.List" %>
    <%@page import="appontmnt.Appointment" %>
    <%@page import="doctor.DoctorDao" %>
    <%@page import="doctor.Doctor" %>
    <%@page import="User.userBeen" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%@include file="Component/Allcss.jsp"%>
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
</head>
<body>

<%@include file="Component/Navbar.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="User_login.jsp"></c:redirect>
</c:if>

<div class="container-fulid backImg p-5">
<p class="text-center fs-2 text-white"></p>
</div>
<div class="container p-3">
<div class="row">
<div class="col-md-9">
<div class="card paint-card">
<div class="card-body">
<p class="fs-4 fw-bold text-center text-success">Appointment List</p>
<table class="table">
<thead>
<tr>
<th scope="col">Full Name</th>
<th scope="col">Gender</th>
<th scope="col">Age</th>
<th scope="col">Appoint Date</th>
<th scope="col">Diseases</th>
<th scope="col">Doctor Name</th>
<th scope="col">Status</th>

</tr>
</thead>
<tbody>
<%
userBeen user =(userBeen)session.getAttribute("userobj");
AppointmentDAO dao= new AppointmentDAO();
DoctorDao dao2 = new DoctorDao();
List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
for(Appointment ap:list)
{
	Doctor d= dao2.getDoctorByid(ap.getDoctorId());
%>
<tr>
<th><%=ap.getFullName()%></th>
<td><%=ap.getGender()%></td>
<td><%=ap.getAge()%></td>
<td><%=ap.getAppoinDate()%></td>
<td><%=ap.getDiseases()%></td>
<td><%=d.getFullName()%></td>
<td>
<%
if("pending".equals(ap.getStatus()))
{%>
<a href="#" class="btn btn-sm btn-warning">pending</a>
	<%}else
	{%>
		<%=ap.getStatus() %>
	<%}
%>
</td>
</tr>

	<%}
%>


</tbody>
</table>
</div>
</div>
</div>
<div class="col-md-3 p-3">
<img alt="" src="img/doctor9.jpg" class="img-fluid">
</div>
</div>
</div>
</body>
</html>