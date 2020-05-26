<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Booking bookingDetails = new Booking();
	String userID = (session.getAttribute("customer_id")).toString();
	ArrayList allBooking = bookingDetails.getAllBooking(userID);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>My Bookings</h2>
		
		<% if(request.getParameter("message") != null) { %>
		<div class="msg">
			<%=request.getParameter("message")%>
		</div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Movie</th>
              <th>Total Seats</th>
			  <th>Amount</th>
			  <th>Date</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allBooking.size();i++) 
			{ 
				String payment = "Not Done";
				HashMap BookingDetails = new HashMap();
				BookingDetails = (HashMap)allBooking.get(i);
				if(BookingDetails.get("booking_status").equals("1"))
					payment = "Done";
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(BookingDetails.get("booking_id")); %></td>
				  <td><% out.print(BookingDetails.get("movie_name")); %></td>
				  <td><% out.print(BookingDetails.get("booking_no_seats")); %></td>
				  <td><% out.print(BookingDetails.get("booking_amount")); %></td>
				  <td><% out.print(BookingDetails.get("booking_date")); %></td>			  
				</tr>
			<%
			}
			%>
			</tbody>
        </table>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
