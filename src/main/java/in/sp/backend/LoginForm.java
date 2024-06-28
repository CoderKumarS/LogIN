package in.sp.backend;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/LoginForm")
public class LoginForm extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Login.jsp");
    	rd.forward(req, res);
	}
}
