package appontmnt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
		int userId = Integer.parseInt(request.getParameter("userid"));
		String fullname = request.getParameter("fullname");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String appoint_date = request.getParameter("appoint_date");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		String diseases = request.getParameter("diseases");
		int doctor_id = Integer.parseInt(request.getParameter("doct"));
		String address = request.getParameter("address");
		
		Appointment ap = new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, 
				doctor_id, address, "pending");
		
		AppointmentDAO dao = new AppointmentDAO(); 
		HttpSession session = request.getSession();
		if(dao.addAppointment(ap))
		{
			session.setAttribute("sucMsg", "Appointment Successfully");
			response.sendRedirect("user_appointment.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "something wrong on server");
			response.sendRedirect("user_appointment.jsp");
		}
		} catch (NumberFormatException e) {
	        HttpSession session = request.getSession(); // Moved inside the catch block
	        session.setAttribute("errorMsg", "Invalid input for user ID or doctor ID.");
	        response.sendRedirect("user_appointment.jsp");
	    } catch (Exception e) {
	        HttpSession session = request.getSession(); // Moved inside the catch block
	        session.setAttribute("errorMsg", "Something went wrong on the server.");
	        response.sendRedirect("user_appointment.jsp");
	    }
		
	}

}
