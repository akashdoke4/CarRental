<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Car carDetails = new Car();
	int car_id = Integer.parseInt(request.getParameter ("car_id"));
	HashMap Values =  carDetails.getCarDetails(car_id);	
%>
<script>
function validImage() {
	var val = $("#car_image").val();
	var id = $("#car_id").val();
	if(id == '' || val != '')
	{
		if(val == '') {
			alert('Choose the Car Image');
			return false;
		}
		if (!val.match(/(?:gif|jpg|png|bmp)$/)) {
			// inputted file path is not an image of one of the above types
			alert("inputted file path is not an image!");
			return false;
		}
	}
	return true;
}
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Car Entry Form</h2>
		<form method="post" action="UploadCar" enctype="multipart/form-data" onsubmit="return validImage()">
          <div class="half_width">
            <label for="email">Car Name<span>*</span></label>
            <input type="text" name="car_name" id="car_name" value="<% out.print(Values.get("car_name")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">Car Type<span>*</span></label>
            <select style="height: 40px; width:300px" name = "car_type" id = "car_type" required>
            	<% out.print(carDetails.getTypeOption((Integer) Values.get("car_type"))); %>
            </select>
          </div>
            
          <div class="half_width">
            <label for="email">Car Company<span>*</span></label>
            <select style="height: 40px; width:300px" name = "car_company" id = "car_company" required>
            	<% out.print(carDetails.getCompanyOption((Integer) Values.get("car_company"))); %>
            </select>
          </div>
		  <div class="half_width">
            <label for="email">Car City<span>*</span></label>
            <select style="height: 40px; width:300px" name = "car_city" id = "car_city" required>
            	<% out.print(carDetails.getCityOption((Integer) Values.get("car_city"))); %>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Car Number<span>*</span></label>
            <input type="text" name="car_number" id="car_number" value="<% out.print(Values.get("car_number")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Number of Seats<span>*</span></label>
            <input type="text" name="car_seats" id="car_seats" value="<% out.print(Values.get("car_seats")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Price Per Day<span>*</span></label>
            <input type="text" name="car_price_per_day" id="car_price_per_day" value="<% out.print(Values.get("car_price_per_day")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both">
            <label for="email">Image<span>*</span></label>
            <input type="file" name="car_image" id="car_image" style="width:300px">
          </div>
          <div style="clear:both">
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="car_description" required><% out.print(Values.get("car_description")); %></textarea>
          </div>
          <% if(!Values.get("car_image").equals("")) { %>
          <div class="half_width">
			<img src="carImages/<% out.print(Values.get("car_image")); %>" style="height:100px; width:100px;">
          </div>
          <% } %>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Car">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("car_image")); %>" />
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="type_id" value="0" />
		  <input type="hidden" id="car_id" name="car_id" value="<% out.print(Values.get("car_id")); %>"/>
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
