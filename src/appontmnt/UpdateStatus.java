package appontmnt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id= Integer.parseInt(request.getParameter("id"));
		int did= Integer.parseInt(request.getParameter("did"));
		String comm= request.getParameter("comm");
		AppointmentDAO dao=new AppointmentDAO();
		HttpSession session = request.getSession();
		if(dao.updateCommentStatus(id, did, comm))
		{
			session.setAttribute("sucMsg", "Comment status updated successfully");
			response.sendRedirect("doctor/patient.jsp");
		}else
		{
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("doctor/patient.jsp");
		}
	}

}
