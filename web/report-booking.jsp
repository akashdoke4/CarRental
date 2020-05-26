<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Booking bookingDetails = new Booking();
	String customerID = "0";
	if(session.getAttribute("login_level").equals("4")) {
		customerID = session.getAttribute("customer_id").toString();
	}
	ArrayList allBooking = bookingDetails.getAllBooking(customerID);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Booking Report</h2>
		
		<% if(request.getParameter("message") != null) { %>
		<div class="msg">
			<%=request.getParameter("message")%>
		</div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Mobile</th>
              <th>Email</th>
			  <th>From Date</th>
			  <th>To Date</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allBooking.size();i++) 
			{ 
				String payment = "Not Done";
				HashMap BookingDetails = new HashMap();
				BookingDetails = (HashMap)allBooking.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(BookingDetails.get("booking_id")); %></td>
				  <td><% out.print(BookingDetails.get("booking_name")); %></td>
				  <td><% out.print(BookingDetails.get("booking_mobile")); %></td>
				  <td><% out.print(BookingDetails.get("booking_email")); %></td>
				  <td><% out.print(BookingDetails.get("booking_from_date")); %></td>
				  <td><% out.print(BookingDetails.get("booking_to_date")); %></td>
				  <td> <a href="car-book-receipt.jsp?booking_id=<% out.print(BookingDetails.get("booking_id")); %>">View Details</a> </td>
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
