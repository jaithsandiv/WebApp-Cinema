<%@ page import="com.mycompany.webapp.cinema.model.Seat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="jsp/header.jsp">
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="seatBooking.css" />
    <jsp:param name="activePage" value="seatCTL" />
</jsp:include>
<div class="theater">
    <h1>Select Your Seats</h1>
    <br>
    <div class="seats">
        <%
    int rows = 15;
    int cols = 15;
    char rowLetter = (char) ('A' + rows - 1); // Start with the bottom-most letter
    Map<String, Object> seatStatusMap = new HashMap<>();
    if (request.getAttribute("seatDetails") != null) {
        List<Seat> seatDetails = (List<Seat>) request.getAttribute("seatDetails");
        if (!seatDetails.isEmpty()) {
            for (Seat seat : seatDetails) {
                seatStatusMap.put(seat.getSeatNumber(), seat);
            }
        }
    }
    for (int i = 1; i <= rows; i++, rowLetter--) { // Start from bottom row and move upwards
        out.print("<div class='row'>");
        for (int j = cols; j >= 1; j--) { // Numbers start from right to left
            String seatNumber = rowLetter + String.valueOf(j); // Combine letter and column number
            Seat details = (Seat) seatStatusMap.get(seatNumber);
            if (details != null) {
                if (details.getSeatNumber().equals(seatNumber) && (details.getSeatStatus().equals("Booked") || details.getSeatStatus().equals("Temp Booked"))) {
                    out.print("<div disabled class='seat booked non-clickable' id='" + seatNumber + "' onclick='toggleSeat(this)'>");
                } else {
                    out.print("<div class='seat' id='" + seatNumber + "' onclick='toggleSeat(this)'>");
                }
            } else {
                out.print("<div class='seat' id='" + seatNumber + "' onclick='toggleSeat(this)'>");
            }
            out.print(seatNumber);
            out.print("</div>");
        }
        out.print("</div>");
    }
        %>

    </div>
    <br>
    <center><div class="screen">Screen</div></center>
    <br><br>
    <div class="ticket-info">
        <div class="row justify-content-center mb-3">
            <div class="col-auto">
                <label class="me-2">Adults:</label>
                <select class="form-select form-select-sm d-inline-block w-auto custom-textarea" id="adults" name="adults" onchange="handleDropdownChange()">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
            </div>
            <div class="col-auto">
                <label class="me-2">Children:</label>
                <select class="form-select form-select-sm d-inline-block w-auto custom-textarea" id="children" name="children" onchange="handleDropdownChange()">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
            </div>
        </div>
        <p>Ticket Price: $11.00  (Adult), $8.00 (Child)</p>
    </div>
    <p id="seatCount" class="seat-count">0 ticket(s) selected.</p>
    <div class="buttons d-flex justify-content-center">
            <button class="btn btn-outline btn-sm" style="width: 108px;" onclick="history.back()">Back</button>
            <form id="seatForm" action="seat-selection" method="POST">
                <input type="hidden" id="selectedSeatsInput" name="selectedSeats" />
                <input type="hidden" id="totalPriceInput" name="totalPrice" />
                <input type="hidden" id="showtimeIdInput" name="showtime_id" value="<%= request.getParameter("showtime_id") %>" />
                <button class="btn btn-outline btn-sm" style="width: 108px;" type="submit" id="continueButton" onclick="submitSeats()" disabled>Continue</button>
            </form>
    </div>
</div>

<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="seatBooking.js" />
</jsp:include>