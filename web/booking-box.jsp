<%
	Booking bookingDetails = new Booking();
%>
<style>
.booking_box {
    background-color: #d71921;
    border: 1px solid #d71921;
    color: #ffffff;
    float: left;
    font-size: 11px;
    font-weight: bold;
    margin-right: 30px;
    padding: 8px;
	margin-top:-16px;
	border-radius:5px;
}
.booking_box input select{
	color:#d71921;
}
</style>
<div id="comments" class="booking_box">
<form action="movie-order-summary.jsp" method="post" id="Form">
  <div style="margin-bottom:5px;">
	<label for="email">Select Movie<span>*</span></label>
	<select style="height:30px;width:210px; color:#d71921; font-weight:bold" name= "booking_movie_id" id = "booking_movie_id" required>
		<% out.print(bookingDetails.getMovieOption(0)); %>
	</select>
  </div>
  <div style="margin-bottom:5px;">
	<label for="email">Select Date<span>*</span></label>
	<input type="text" name="booking_date" id="booking_date" size="22" required style="height:30px; width:210px;color:#d71921; font-weight:bold">
  </div>
  <div style="margin-bottom:5px;">
	<label for="email">Select Show<span>*</span></label>
	<select style="height:30px;width:210px;color:#d71921; font-weight:bold" name= "booking_show_id" id = "booking_show_id" required>
		<% out.print(bookingDetails.getShowOption(0)); %>
	</select>
  </div>
  <div style="margin-bottom:5px;">
	<label for="email">Number of Seats<span>*</span></label>
	<select style="height:30px;width:210px;color:#d71921; font-weight:bold" name= "booking_seat_no" id = "booking_seat_no" required>
		<% for(int i=1; i<=6; i++) {
			out.print("<option value='"+i+"'>"+i+"</option>");					
		}
		%>
	</select>
  </div>		  
  <div class="block clear"></div>
  <div>
	<input name="submit" type="submit" value="Book Ticket" style="border-radius:5px; border:3px solid; width:100%">
  </div>
  <input type="hidden" name="act" value="Save" />
  <input type="hidden" name="sal_id" />
</form>
</div>