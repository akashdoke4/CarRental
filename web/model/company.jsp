<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Company companyObj = new Company();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("company_id",request.getParameter("company_id"));
		results.put("company_name",request.getParameter("company_name"));
		results.put("company_description",request.getParameter("company_description"));

		if((request.getParameter("company_id")).equals(""))
		{
			out.println(companyObj.saveCompany(results));
			response.sendRedirect("../report-company.jsp?emp_id="+emp_id+"&msg=Company Saved Successfully");
		}
		else
		{
			results.put("company_id",request.getParameter("company_id"));
			out.println(companyObj.updateCompany(results));
			response.sendRedirect("../report-company.jsp?emp_id=0&msg=Company Updated Successfully");
		}
	}
%>
