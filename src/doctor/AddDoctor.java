package doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String dob = request.getParameter("dob");
		String qulification = request.getParameter("qulification");
		String spec = request.getParameter("spec");
		String email = request.getParameter("email");
		String mobno = request.getParameter("mobno");
		String password = request.getParameter("password");
		
		Doctor d = new Doctor();
		d.setFullName(fullname);
		d.setDob(dob);
		d.setQualification(qulification);
		d.setSpecialist(spec);
		d.setEmail(email);
		d.setMobNo(mobno);
		d.setPassword(password);
		
		DoctorDao dao = new DoctorDao();
		HttpSession session = request.getSession();
		if(dao.registerDoctor(d))
		{
			session.setAttribute("sucMsg", "Doctor Added Successfully");
			response.sendRedirect("admin/doctor.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("admin/doctor.jsp");
		}
	}
	

}
