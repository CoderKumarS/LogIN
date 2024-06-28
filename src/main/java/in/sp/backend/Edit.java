package in.sp.backend;

import java.io.*;
import java.sql.*;

import in.sp.database.*;
import in.sp.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/edit")
public class Edit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
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
            
            String query = "UPDATE User SET name = ?, password = ?, gender = ?, dob = ?, city = ? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setString(3, gender);
            ps.setString(4, dob);
            ps.setString(5, city);
            ps.setString(6, email);
            
            int count = ps.executeUpdate();
            
            if (count > 0) {
                res.setContentType("text/html");
                out.println("<h3 class='right'>User Updated Successfully</h3>");
                User user = new User();
            	user.setName(name);
            	user.setEmail(email);
            	user.setGender(gender);
            	user.setPassword(password);
            	user.setDob(dob);
            	user.setCity(city);
            	HttpSession session = req.getSession();
            	session.setAttribute("session_user", user);
                RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Profile.jsp");
                rd.include(req, res);
            } else {
                res.setContentType("text/html");
                out.println("<h3 class='wrong'>User Updation Failed</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Profile.jsp");
                rd.include(req, res);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            res.setContentType("text/html");
            out.println("<h3 class='wrong'>Exception Occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Profile.jsp");
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
