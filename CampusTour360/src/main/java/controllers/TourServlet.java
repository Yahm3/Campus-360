package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 * @author Yahm3
 */
@WebServlet(name = "TourServlet", urlPatterns = {"/tour"})
public class TourServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        int locationId = (idParam != null) ? Integer.parseInt(idParam) : 1;

        String locationName = "Unknown Location";
        String imagePath = "";

        String dbUrl = "jdbc:derby://localhost:1527/CampusTourDB";
        String dbUser = "app";
        String dbPass = "123";

        try {
            // Load Derby driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass); PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Location WHERE id = ?")) {

                stmt.setInt(1, locationId);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    locationName = rs.getString("name");
                    imagePath = rs.getString("image_path");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("DATABASE ERROR: " + e.getMessage());
        }

        request.setAttribute("locationName", locationName);
        request.setAttribute("imagePath", imagePath);

        int nextId = (locationId >= 3) ? 1 : locationId + 1;
        request.setAttribute("nextId", nextId);

        request.getRequestDispatcher("viewer.jsp").forward(request, response);
    }
}
