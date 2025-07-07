package User;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/userRegister")
public class userRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullName = request.getParameter("fullname");
		String email = request.getParameter("email");
		String password = request.getParameter("Password");
		
		userBeen u= new userBeen(fullName,email,password);
		userDAO dao = new userDAO();
		HttpSession session = request.getSession();
		boolean f = dao.userRegister(u);
		if(f==true)
		{
			session.setAttribute("sucMsg", "Register Successfull");
			response.sendRedirect("signup.jsp");
		}
		else {
			session.setAttribute("errorMsg", "something wrong on server");
			response.sendRedirect("signup.jsp");
		}
	}

}
