package User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String Password = request.getParameter("Password");
		HttpSession session = request.getSession();
		userDAO dao = new userDAO();
		userBeen user = dao.login(email, Password);
		
		if(user !=null)
		{
			session.setAttribute("userobj", user);
			response.sendRedirect("index.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "invalid email & password");
			response.sendRedirect("User_login.jsp");
		}
	}



	}


