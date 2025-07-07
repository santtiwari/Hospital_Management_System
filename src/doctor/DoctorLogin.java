package doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/DoctorLogin")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String Password = request.getParameter("Password");
		HttpSession session = request.getSession();
		DoctorDao dao = new DoctorDao();
		Doctor doctor = dao.login(email, Password);
		
		if(doctor !=null)
		{
			session.setAttribute("doctobj", doctor);
			response.sendRedirect("doctor/index.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "invalid email & password");
			response.sendRedirect("doctor_login.jsp");
		}
	}


}
