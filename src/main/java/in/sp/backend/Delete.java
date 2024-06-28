package in.sp.backend;

import in.sp.database.*;
import in.sp.model.User;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/delete")
public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        PrintWriter out = res.getWriter();
        Connection con = null;
        try {
        	Database data = new Database();
            String dbUser = data.getDbUser();
            String dbPass = data.getDbPass();
            String db = data.getDb();
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, dbUser, dbPass);
        	
            HttpSession session = req.getSession();
        	User user = (User) session.getAttribute("session_user");
            
            String query = "DELETE FROM User WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            
            int count = ps.executeUpdate();
            
            if (count > 0) {
        		session.invalidate();
        		
            	res.setContentType("text/html");
            	out.print("<h3 class='right'>User Deleted Successfully</h3>");
            	
            	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Login.jsp");
            	rd.forward(req, res);
            } else {
            	res.setContentType("text/html");
            	out.print("<h3 class='wrong'>Error in Deleting User</h3>");
            	
            	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Profile.jsp");
            	rd.include(req, res);
            }
        } catch (Exception e) {
        	e.printStackTrace();
        	res.setContentType("text/html");
        	out.print("<h3 class='wrong'>" + e.getMessage() + "</h3>");
        	
        	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Login.jsp");
        	rd.include(req, res);
        } finally {
        	try {
        		if (con != null) {
        			con.close();
        		}
        	} catch (SQLException ex) {
        		ex.printStackTrace();
        	}
        }
    }
}
