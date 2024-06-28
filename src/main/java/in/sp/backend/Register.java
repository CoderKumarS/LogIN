package in.sp.backend;

import java.io.*;
import java.sql.*;

import in.sp.database.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/register")
public class Register extends HttpServlet 
{
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String dob = req.getParameter("date");
        String city = req.getParameter("city");
        
        Connection con = null;
        try {
        	Database data = new Database();
            String dbUser = data.getDbUser();
            String dbPass = data.getDbPass();
            String db = data.getDb();
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, dbUser, dbPass);
            
            String query = "INSERT INTO User (name, email, password, gender, dob, city) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, gender);
            ps.setString(5, dob);
            ps.setString(6, city);
            
            int count = ps.executeUpdate();
            if(count > 0) {
                res.setContentType("text/html");
                out.println("<h3 class='right'>User Registered Successfully</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Login.jsp");
                rd.include(req, res);
            } else {
                res.setContentType("text/html");
                out.println("<h3 class='wrong'>User Registration Failed</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Register.jsp");
                rd.include(req, res);
            }
        } catch(Exception e) {
            e.printStackTrace();
            res.setContentType("text/html");
            out.println("<h3 class='wrong'>Exception Occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Register.jsp");
            rd.include(req, res);
        } finally {
            try {
                if(con != null) {
                    con.close();
                }
            } catch(Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
