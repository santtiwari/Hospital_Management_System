package doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		DoctorDao dao = new DoctorDao();
		HttpSession session = request.getSession();
		if(dao.deleteDoctor(id))
		{
			session.setAttribute("sucMsg", "Doctor Deleted Successfully");
			response.sendRedirect("admin/view_doctor.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("admin/view_doctor.jsp");
		}
	}

}
