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

<div class="col-md-4 offset-md-4">
<div class="card point-card">
<div class="card-body">
<p class="fs-3 text-center">Edit Doctor Detail's</p>
<c:if test="${not empty sucMsg}">
    <p class="text-center text-success fs-3">${sucMsg}</p>
    <c:remove var="sucMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsg}">
    <p class="text-center text-danger fs-3">${errorMsg}</p>
    <c:remove var="errorMsg" scope="session"/>
</c:if>

<%
int id= Integer.parseInt(request.getParameter("id"));
DoctorDao dao2=new DoctorDao();
Doctor d = dao2.getDoctorByid(id);
%>

<form action="../UpdateDoctor" method="post">

<div class="mb-3">
<label class="form-label">Full Name</label><input type="text"
required name="fullname" class="form-control" value="<%=d.getFullName()%>">
</div>

<div class="mb-3">
<label class="form-label">DOB</label><input type="date"
required name="dob" class="form-control" value="<%=d.getDob()%>">
</div>

<div class="mb-3">
<label class="form-label">Qualification</label><input required
name="qulification" type="text" class="form-control" value="<%=d.getQualification()%>">
</div>

<div class="mb-3">
<label class="form-label">Specialist</label><select name="spec"
 required class="form-control" >
 <option><%=d.getSpecialist()%></option>
 <% 
 SpecialistDao dao = new SpecialistDao(); 
 List <Specialist> list  = dao.getAllSpecialist();
 for(Specialist s:list)
 {%>
	 <option><%=s.getSpecialistName()%></option>
 <%}
 %>
 
 
 </select>
</div>

<div class="mb-3">
<label class="form-label">Email</label> <input type="text" 
required name="email"  class="form-control" value="<%=d.getEmail()%>">
</div>

<div class="mb-3">
<label class="form-label">Mob No</label> <input type="text" 
required name="mobno"  class="form-control" value="<%=d.getMobNo()%>">
</div>

<div class="mb-3">
<label class="form-label">Password</label> <input required
 name="password" type="text" class="form-control" value="<%= d.getPassword()%>">
</div>

<div>
<input type="hidden" name="id" value="<%=d.getId() %>">
</div>

<button type="submit" class="btn btn-primary col-md-12">Update</button>

</form>
</div>
</div>
</div>



</div>
</div>

</body>
</html>