<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Car carDetails = new Car();
	int typeID = 0;
	ArrayList allCar = carDetails.getAllCar(typeID);
%>
<script>
  jQuery(function() {
    jQuery( "#drop_off_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-0:+1",
       dateFormat: 'yy-mm-dd'
    });
	jQuery( "#pick_up_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-0:+1",
       dateFormat: 'yy-mm-dd'
    });
  });
</script>
<style>
#comments li {
    background-color: #ffffff;
    color: #192e4b;
    font-weight: bold;
}
tr:nth-child(odd), #comments li:nth-child(odd) {
    color: inherit;
    background-color: #FFFFFF;
	color: #192e4b;
}
</style>
<div class="wrapper row3"> 	
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Book Your Car</h2>
        <form action="#" method="post">
		  <div id="empl_id">
            <label for="email">Pick Up Date<span>*</span></label>
            <input type="text" name="pick_up_date" id="pick_up_date" size="22" style="width:300px;" required>
          </div>
		  <div id="empl_id">
            <label for="email">Drop Off Date<span>*</span></label>
            <input type="text" name="drop_off_date" id="drop_off_date" size="22" style="width:300px;" required>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Search Car">
            &nbsp;
            <input name="reset" type="reset" value="Reset">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="booking_id"/>
        </form>
		<div class="cartsecs" style="clear:both; width:98%">
			<ul>
			<% 
			if(request.getParameter ("pick_up_date") != null)
			for(int i=0;i<allCar.size();i++) 
			{ 
				HashMap CarDetails = new HashMap();
				CarDetails = (HashMap)allCar.get(i);
			%>
			
				<li>
					<div class="thumb">
						<a href="#"><img src="carImages/<% out.print(CarDetails.get("car_image")); %>" alt="" style="width:92px; height:78px"></a>
					</div>
					<div class="conts">
						<a href="#" class="black bold"><% out.print(CarDetails.get("car_name")); %></a>
						<p>Company : <% out.print(CarDetails.get("company_name")); %></p>
						<p class="bold">Seats : <% out.print(CarDetails.get("car_seats")); %></p>
						<p class="bold">Price Per Day : <% out.print(CarDetails.get("car_price_per_day")); %></p>
					</div>
					<div style="float:right; padding:20px 57px 20px 100px; border-left:1px solid #cccccc">
						<a href="car-details.jsp?car_id=<% out.print(CarDetails.get("car_id")); %>&pick_up=2016-08-26&drop_off=2016-08-27" class="simplebtn left">Book Your Car Now</a>
					</div>
				</li>
		<% } %>
			</ul>
		</div>
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