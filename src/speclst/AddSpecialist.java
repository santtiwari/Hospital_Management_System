package speclst;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.userBeen;


@WebServlet("/AddSpecialist")
public class AddSpecialist extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String specName = request.getParameter("specName");
		SpecialistDao dao = new SpecialistDao();
		boolean f = dao.addSpecialist(specName);
		HttpSession session = request.getSession();
		if(f)
		{
			session.setAttribute("sucMsg", "Specialist Added");
			response.sendRedirect("admin/index.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "something wrong on server");
			response.sendRedirect("Admin_login.jsp");
		}
	}

}
