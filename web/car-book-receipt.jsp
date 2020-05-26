<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Booking bookingDetails = new Booking();
	int booking_id = Integer.parseInt(request.getParameter ("booking_id"));
	HashMap Values =  bookingDetails.getBookingDetails(booking_id);	
	String pickUp = Values.get("booking_pickup").toString();
	String dropOff = Values.get("booking_drop").toString();
%>
<style>
label {
	font-size:14px;
	font-weight:bold;
	color:#000000;
}
.half_width {
	color:#000000;
}
</style>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Enter your details for booking</h2>
        <form action="model/booking.jsp" method="post">
		  <div class="half_width">
            <label for="email">Name<span>*</span></label>
			<% out.print(Values.get("booking_name")); %>
          </div> 
		  <div class="half_width">
            <label for="email">No of Passengar<span>*</span></label>
			<% out.print(Values.get("booking_no_passengar")); %>
          </div>	
          <div class="half_width">
            <label for="email">Email<span>*</span></label>
			<% out.print(Values.get("booking_email")); %>
          </div>	  
          <div class="half_width">
            <label for="email">Contact Number<span>*</span></label>
			<% out.print(Values.get("booking_mobile")); %>
          </div>	  
          <div class="half_width">
            <label for="email">From Date<span>*</span></label>
			<% out.print(Values.get("booking_from_date")); %>
          </div>	  
           <div class="half_width">
            <label for="email">To Date<span>*</span></label>
			<% out.print(Values.get("booking_to_date")); %>
          </div>
		   <div class="half_width">
            <label for="email">Pick Up Address<span>*</span></label>
			<% out.print(pickUp.replaceAll("\n", "<br>")); %>
          </div>
		   <div class="half_width">
            <label for="email">Drop Address<span>*</span></label>
			<% out.print(dropOff.replaceAll("\n", "<br>")); %>
          </div>
		  <div class="block clear"></div>
          <div>
            <input name="submit" type="button" value="Print Receipt" onClick="window.print()">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="booking_car_id" value="1"/>
		  <input type="hidden" name="booking_user_id" value="2"/>
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
