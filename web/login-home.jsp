<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
	    <div style="width: 70%; float:left; margin-right:30px" id="login-home">
		  <h2>Welcome to Car Rental Administration Panel</h2>
		  
		  <!-- Dashboard For Employee Section -->
		  <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("4")) { %>		
		  <ul>
			<li><a href="booking.jsp">Book Car</a></li>
			<li><a href="report-booking.jsp">My Bookings</a></li>
			<li><a href="customer.jsp?customer_id=<%=session.getAttribute("customer_id")%>">My Account</a></li>
			<li><a href="contact-us.jsp">Contact Us</a></li>
			<li><a href="model/customer.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
		 <!-- Dashboard For Super Admin Section -->
		 <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
		  <ul>
		  	<li><a href="car.jsp?car_id=0">Add New Car</a></li>
			<li><a href="company.jsp?company_id=0">Add New Company</a></li>
			<li><a href="type.jsp?type_id=0">Add New Car Type</a></li>
			<li><a href="report-car.jsp">Car Report</a></li>
            <li><a href="report-company.jsp">Car Company Report</a></li>
			<li><a href="report-type.jsp">Car Type Report</a></li>
			<li><a href="report-customer.jsp">Customer Report</a></li>
			<li><a href="report-booking.jsp">Booking Report</a></li>
			<li><a href="report-employee.jsp">Employee Report</a></li>
			<li><a href="change-password.jsp">Change Password</a></li>
			<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
		</div>
		<div style="float: left">
			<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
			<div><img src="images/save_2.jpg" style="width: 250px"></div>
		</div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
