package admin;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.userBeen;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String Password = request.getParameter("Password");
		HttpSession session = request.getSession();
		
		if("admin@gmail.com".equals(email)&& "admin".equals(Password))
		{
			session.setAttribute("adminobj", new userBeen());
			response.sendRedirect("admin/index.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "invalid email & password");
			response.sendRedirect("Admin_login.jsp");
		}
	}

}
