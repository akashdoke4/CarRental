<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Car carDetails = new Car();
	int typeID = 0;
	ArrayList allCar = carDetails.getAllCar(typeID);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Car Report</h2>
		<div class="msg">
			<%=request.getSession().getAttribute("errorMessage")%>
		</div>
		<% if(request.getParameter("message") != null) { %>
		<div class="msg">
			<%=request.getParameter("message")%>
		</div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Image</th>
              <th>Type</th>
              <th>City</th>
              <th>Company</th>
              <th>Price Per Day</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allCar.size();i++) 
			{ 
				HashMap CarDetails = new HashMap();
				CarDetails = (HashMap)allCar.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(CarDetails.get("car_name")); %></td>
				  <td>
					<a href="car-details.jsp?car_id=<% out.print(CarDetails.get("car_id")); %>">
						<img src="carImages/<% out.print(CarDetails.get("car_image")); %>" style="height:80px; width:80px;">
					</a>
				  </td>
				  <td><% out.print(CarDetails.get("type_name")); %></td>
				  <td><% out.print(CarDetails.get("city_name")); %></td>
				  <td><% out.print(CarDetails.get("company_name")); %></td>
				  <td><% out.print(CarDetails.get("car_price_per_day")); %></td>
				  <td> <a href="car.jsp?car_id=<% out.print(CarDetails.get("car_id")); %>">Edit</a> </td>
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
