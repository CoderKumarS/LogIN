package in.sp.backend;

import java.io.*;
import java.sql.*;

import in.sp.database.Database;
import in.sp.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/forgot")
public class Forgot extends HttpServlet
{
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        String name = req.getParameter("name");
        String dob = req.getParameter("date");
        
        Connection con = null;
        try {
        	Database data = new Database();
            String dbUser = data.getDbUser();
            String dbPass = data.getDbPass();
            String db = data.getDb();
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, dbUser, dbPass);
            
            String query = "SELECT * FROM User WHERE email = ? AND dob = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, dob);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
            	User user = new User();
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            	user.setGender(rs.getString("gender"));
            	user.setPassword(rs.getString("password"));
            	user.setDob(rs.getString("dob"));
            	user.setCity(rs.getString("city"));
            	HttpSession session = req.getSession();
            	session.setAttribute("session_user", user);
            	
            	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Edit.jsp");
            	rd.forward(req, res);
            }else {
            	res.setContentType("text/html");
            	out.print("<h3 class= 'wrong'>Email and Date of Birth did not match</h3>");
            	
            	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Login.jsp");
            	rd.include(req, res);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            res.setContentType("text/html");
            out.println("<h3 class='wrong'>Exception Occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Login.jsp");
            rd.include(req, res);
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
}
