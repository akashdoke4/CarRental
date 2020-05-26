<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	CarType typeObj = new CarType();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("type_id",request.getParameter("type_id"));
		results.put("type_name",request.getParameter("type_name"));
		results.put("type_description",request.getParameter("type_description"));

		if((request.getParameter("type_id")).equals(""))
		{
			out.println(typeObj.saveCarType(results));
			response.sendRedirect("../report-type.jsp?emp_id="+emp_id+"&msg=Car Type Saved Successfully");
		}
		else
		{
			results.put("type_id",request.getParameter("type_id"));
			out.println(typeObj.updateCarType(results));
			response.sendRedirect("../report-type.jsp?emp_id=0&msg=Car Type Updated Successfully");
		}
	}
%>
