package doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String dob = request.getParameter("dob");
		String qulification = request.getParameter("qulification");
		String spec = request.getParameter("spec");
		String email = request.getParameter("email");
		String mobno = request.getParameter("mobno");
		int id = Integer.parseInt(request.getParameter("id"));
		
		Doctor d = new Doctor();
		d.setFullName(fullname);
		d.setDob(dob);
		d.setQualification(qulification);
		d.setSpecialist(spec);
		d.setEmail(email);
		d.setMobNo(mobno);
		
		d.setId(id);
		
		DoctorDao dao = new DoctorDao();
		HttpSession session = request.getSession();
		if(dao.editDoctorProfile(d))
		{
			Doctor updateDoctor = dao.getDoctorByid(id);
			session.setAttribute("sucMsgd", "Doctor Updated Successfully");
			session.setAttribute("doctobj", updateDoctor);
			response.sendRedirect("doctor/edit_profile.jsp");
		}
		else
		{
			session.setAttribute("errorMsgd", "Something wrong on server");
			response.sendRedirect("doctor/edit_profile.jsp");
		}
	}
	




	}

