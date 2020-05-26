<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Car carDetails = new Car();
	int car_id = Integer.parseInt(request.getParameter ("car_id"));
	HashMap Values =  carDetails.getCarDetails(car_id);
%>
<script>
function openBooking(car_id) {
	window.location.href= "car-book.jsp?car_id="+car_id;
}
</script>
<style>
table, tr, th ,td {
	background-color: #ffffff;
    border: medium none;
    font-size: 12px;
    padding: 7px;
}
tr {
	border-bottom:1px solid #192e4b;
}

</style>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
        <div id="comments" style="width: 70%; float:left; margin-right:30px">
        <h2>Details of <% out.print(Values.get("car_name")); %></h2>
        <form action="model/cart.jsp" method="post">
        <div>
			<div style="float:left; border:3px solid #192e4b; padding:1px; border-radius:3px;"><img src="carImages/<% out.print(Values.get("car_image")); %>" style="height:320px; width:300px;"></div>
			<div style="float:right; width:330px;">
				<table>
					<tr>
						<td>Name</td>
						<td><% out.print(Values.get("car_name")); %></td>
					</tr>
					<tr>
						<td>Car Number</td>
						<td><% out.print(Values.get("car_number")); %></td>
					</tr>
					<tr>
						<td>Company</td>
						<td><% out.print(Values.get("company_name")); %></td>
					</tr>
					<tr>
						<td>Type</td>
						<td><% out.print(Values.get("type_name")); %></td>
					</tr>
					<tr>
						<td>Seats</td>
						<td><% out.print(Values.get("car_seats")); %></td>
					</tr>
					<tr>
						<td>Price Per Day</td>
						<td><% out.print(Values.get("car_price_per_day")); %></td>
					</tr>
					<tr>
						<td>Description</td>
						<td>
						<% out.print(Values.get("car_description")); %>
						</td>
					</tr>
				</table>
			</div>
			<div style="clear:both; float:right;">
				<input type="button" value="Book Car Now" onClick="openBooking(<% out.print(Values.get("car_id")); %>)" class="book_ticket_button" style="padding:10px 10px;">
			</div>
        </div>
        <input type="hidden" name="car_id" value="<% out.print(Values.get("car_id")); %>">
        <input type="hidden" name="car_price" value="<% out.print(Values.get("car_price")); %>">
        <input type="hidden" name="act" value="save">
		</form>
		</div>
        <div style="float: left">
			<h2 style="clear:both; margin-top:10px;"></h2>
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
