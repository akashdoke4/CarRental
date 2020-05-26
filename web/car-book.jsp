<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Booking bookingDetails = new Booking();
	if(session.getAttribute("login_level") == null) {
		response.sendRedirect("customer-login.jsp?msg=Login to your account for booking the car.");
		return;
	}
%>
<script>
  jQuery(function() {
    jQuery( "#booking_from_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "+0:+1",
       dateFormat: 'd MM,yy'
    });
	jQuery( "#booking_to_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "+0:+1",
       dateFormat: 'd MM,yy'
    });
  });
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Enter your details for booking</h2>
        <form action="model/booking.jsp" method="post">
		  <div class="half_width">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="booking_name" id="booking_name" size="22" required style="width:250px">
          </div> 
		  <div class="half_width">
            <label for="email">No of Passengar<span>*</span></label>
            <input type="text" name="booking_no_passengar" id="booking_no_passengar" size="22" required style="width:250px">
          </div>	
          <div class="half_width">
            <label for="email">Email<span>*</span></label>
            <input type="text" name="booking_email" id="booking_email" size="22" required style="width:250px">
          </div>	  
          <div class="half_width">
            <label for="email">Contact Number<span>*</span></label>
            <input type="text" name="booking_mobile" id="booking_mobile" size="22" required style="width:250px">
          </div>	  
          <div class="half_width">
            <label for="email">From Date<span>*</span></label>
            <input type="text" name="booking_from_date" id="booking_from_date" size="22" required style="width:250px">
          </div>	  
           <div class="half_width">
            <label for="email">To Date<span>*</span></label>
            <input type="text" name="booking_to_date" id="booking_to_date" size="22" required style="width:250px">
          </div>
		   <div class="half_width">
            <label for="email">Pick Up Address<span>*</span></label>
            <textarea type="text" name="booking_pickup" id="booking_pickup" required style="width:250px; height:100px;"></textarea>
          </div>
		   <div class="half_width">
            <label for="email">Drop Address<span>*</span></label>
            <textarea type="text" name="booking_drop" id="booking_drop" required style="width:250px;  height:100px;"></textarea>
          </div>
		  <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Book My Car">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="booking_car_id" value="<% out.print(request.getParameter ("car_id")); %>"/>
		  <input type="hidden" name="booking_user_id" value="<% out.print(session.getAttribute("customer_id")); %>"/>
        </form>
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
