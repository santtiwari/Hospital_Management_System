<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="max.DBConnect"%>
	<%@ page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index page</title>
<%@include file="Component/Allcss.jsp"%>
<style type="text/css">
.point-card{
     box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

</style>

</head>
<body>
	<%@include file="Component/Navbar.jsp"%>
	
	
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hos.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hos2.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hos3.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="container p-3">
	<p class="text-center fs-2">key features of our hospital</p>
	<div class="row">
	<div class="col-md-8 p-5">
	<div class="row">
	<div class="col-md-6">
	<div class="card point-card">
	<div class="card-body">
	<p class="fs-5">100% sefety</p>
	<p>Loren ipsum dolor sit amet, consectetur adipisicing elit.
	voluptatem, inventore</p>
	</div>
	</div>
	</div>
	
	<div class="col-md-6">
	<div class="card point-card">
	<div class="card-body">
	<p class="fs-5">Clean Environment</p>
	<p>Loren ipsum dolor sit amet, consectetur adipisicing elit.
	voluptatem, inventore</p>
	</div>
	</div>
	</div>
	
	<div class="col-md-6 mt-2">
	<div class="card point-card">
	<div class="card-body">
	<p class="fs-5">Friendly Doctor</p>
	<p>Loren ipsum dolor sit amet, consectetur adipisicing elit.
	voluptatem, inventore</p>
	</div>
	</div>
	</div>
	
	<div class="col-md-6 mt-2">
	<div class="card point-card">
	<div class="card-body">
	<p class="fs-5">Medical Reserach</p>
	<p>Loren ipsum dolor sit amet, consectetur adipisicing elit.
	voluptatem, inventore</p>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="col-md-4">
	<img src="img/doc4.jpg" width="250px" height="400px">
	</div>
	
	</div>
	</div>
	
	<hr>
	<div class="container p-2">
	<p class="text-center fs-2"> Our Team</p>
	<div class="row">
	<div class="col-md-3">
	<div class="card-point-card">
	<div class="card-body text-center">
	<img src="img/doc2.jpg" width="250px" height="300px">
	<p class="fw-bold fs-5">Sanuani simi</p>
	<p class="fs-7">(CEO & Chairman)</p>
	</div>
	</div>
	</div>
	
	<div class="col-md-3">
	<div class="card-point-card">
	<div class="card-body text-center">
	<img src="img/doc3.jpg" width="250px" height="300px">
	<p class="fw-bold fs-5">Dr. Shiva Kumar</p>
	<p class="fs-7">(Chief Doctor)</p>
	</div>
	</div>
	</div>
	
	<div class="col-md-3">
	<div class="card-point-card">
	<div class="card-body text-center">
	<img src="img/doc4.jpg" width="250px" height="300px">
	<p class="fw-bold fs-5">Dr. Niuise paule</p>
	<p class="fs-7">(Chief Doctor)</p>
	</div>
	</div>
	</div>
	
	<div class="col-md-3">
	<div class="card-point-card">
	<div class="card-body text-center">
	<img src="img/doc5.jpg" width="250px" height="300px">
	<p class="fw-bold fs-5">Dr. Mathue paule</p>
	<p class="fs-7">(Chief Doctor)</p>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%@include file="Component/footer.jsp"%>
</body>
</html>