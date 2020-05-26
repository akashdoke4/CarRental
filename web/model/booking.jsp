<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Booking bookingObj = new Booking();
	String booking_id = "0";
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("booking_user_id",request.getParameter("booking_user_id"));
		results.put("booking_name",request.getParameter("booking_name"));
		results.put("booking_mobile",request.getParameter("booking_mobile"));
		results.put("booking_email",request.getParameter("booking_email"));
		results.put("booking_pickup",request.getParameter("booking_pickup"));
		results.put("booking_drop",request.getParameter("booking_drop"));	
		results.put("booking_from_date",request.getParameter("booking_from_date"));	
		results.put("booking_to_date",request.getParameter("booking_to_date"));	
		results.put("booking_car_id",request.getParameter("booking_car_id"));
		results.put("booking_no_passengar",request.getParameter("booking_no_passengar"));		
		booking_id = bookingObj.saveBooking(results);		
		response.sendRedirect("../car-book-receipt.jsp?booking_id="+booking_id);
	}
%>
