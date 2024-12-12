<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="seatBooking.css" />
    <jsp:param name="activePage" value="seatSelection" />   
</jsp:include> 

<%! 
    private List<Map<String, String>> fetchSeats(int theatreId) throws SQLException {
        List<Map<String, String>> seatList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "password")) {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT seat_row, seat_number, seat_type, status FROM seat_layout WHERE theatre_id = ?"
            );
            ps.setInt(1, theatreId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, String> seat = new HashMap<>();
                seat.put("seat", rs.getString("seat_row") + rs.getInt("seat_number"));
                seat.put("type", rs.getString("seat_type"));
                seat.put("status", rs.getString("status"));
                seatList.add(seat);
            }
        }
        return seatList;
    }
%>

<form action="seatSelection" method="post">
    <input type="hidden" name="theatreId" value="1">
    <input type="hidden" name="showtimeId" value="1001">
    <div id="seat-layout">
        <%
            try {
                List<Map<String, String>> seats = fetchSeats(1); // Example theatre_id = 1
                for (Map<String, String> seat : seats) {
                    String statusClass = seat.get("status").toLowerCase();
                    String typeClass = seat.get("type").toLowerCase();
        %>
        <button  
            type="button" 
            id="<%= seat.get("seat") %>" 
            class="seat <%= statusClass %> <%= typeClass %>" 
            onclick="toggleSeat('<%= seat.get("seat") %>')"
            value="<%= seat.get("seat") %>">
            <%= seat.get("seat") %>
        </button>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace(); // Log error (for debugging purposes only)
                out.println("<p>Error loading seat layout. Please try again later.</p>");
            }
        %>
    </div>
    <input type="hidden" name="selectedSeats" id="selectedSeats">
    <button type="submit" onclick="document.getElementById('selectedSeats').value = JSON.stringify([...document.querySelectorAll('.selected')].map(seat => seat.value))">Submit</button>
</form>

<!-- Include footer with parameters -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="seatBooking.js" />
</jsp:include>
