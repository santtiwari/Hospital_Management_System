<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@page import="speclst.SpecialistDao" %>
    <%@page import="speclst.Specialist" %>
    <%@page import="java.util.List" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="../Component/Allcss.jsp" %>

<style type="text/css">
.paint-card{
     box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

</style>
</head>
<body>

<%@include file = "navbar.jsp" %>

<c:if test="${empty doctobj}">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
<div class="container p-4">
<div class="row">
<div class="col-md-4">
<div class="card paint-card">
<p class="text-center fs-3">change password</p>


<div class="card-body">	
<form action="../DoctorPasswordChange" method="post">
<div class="mb-3">
<label>Enter New Password</label><input type="text"
name="newpassword" class="form-control" required>
</div>

<div class="mb-3">
<label>Enter Old Password</label><input type="text"
name="oldpassword" class="form-control" required>
</div>
<input type="hidden" value="${doctobj.id}" name="uid">
<button class="btn btn-success col-md-12">Change Password</button>
</form>
</div>
</div>
</div>
<div class="col-md-5 offset-md-2">
<div class="card paint-card">
<p class="text-center fs-3">Edit Profile</p>
<c:if test="${not empty sucMsgd}">
    <p class="text-center text-success fs-3">${sucMsgd}</p>
    <c:remove var="sucMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsgd}">
    <p class="text-center text-danger fs-5">${errorMsgd}</p>
    <c:remove var="errorMsg" scope="session"/>
</c:if>
<div class="card-body">
<form action="../EditProfile" method="post">

<div class="mb-3">
<label class="form-label">Full Name</label><input type="text"
required name="fullname" class="form-control" value="${doctobj.fullName}">
</div>

<div class="mb-3">
<label class="form-label">DOB</label><input type="date"
required name="dob" class="form-control" value="${doctobj.dob}">
</div>

<div class="mb-3">
<label class="form-label">Qualification</label><input required
name="qulification" type="text" class="form-control" value="${doctobj.qualification}">
</div>

<div class="mb-3">
<label class="form-label">Specialist</label><select name="spec"
 required class="form-control">
 <option>${doctobj.specialist}</option>
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
<label class="form-label">Email</label> <input type="text" readonly 
required name="email"  class="form-control" value="${doctobj.email}">
</div>

<div class="mb-3">
<label class="form-label">Mob No</label> <input type="text" 
required name="mobno"  class="form-control" value="${doctobj.mobNo}">
</div>
<input type="hidden" name="id" value="${doctobj.id}">
<button type="submit" class="btn btn-primary">Update</button>

</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>