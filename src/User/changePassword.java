package User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/changePassword")
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		userDAO dao = new userDAO();
		HttpSession session = request.getSession();
		if(dao.checkOldPassword(uid, oldpassword))
		{
			if(dao.changePassword(uid, newpassword)){
				session.setAttribute("sucMsg", "password change successfully");
				response.sendRedirect("change_password.jsp");
			}else{
				session.setAttribute("errorMsg", "Some thing wrong on server");
				response.sendRedirect("change_password.jsp");
			}
			
		}else
		{
			session.setAttribute("errorMsg", "old password is incorrect");
			response.sendRedirect("change_password.jsp");
		}
		
	}

}
