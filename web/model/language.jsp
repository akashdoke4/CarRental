<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Language languageObj = new Language();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("language_id",request.getParameter("language_id"));
		results.put("language_name",request.getParameter("language_name"));
		results.put("language_description",request.getParameter("language_description"));

		if((request.getParameter("language_id")).equals(""))
		{
			out.println(languageObj.saveLanguage(results));
			response.sendRedirect("../report-language.jsp?emp_id="+emp_id+"&msg=Language Saved Successfully");
		}
		else
		{
			results.put("language_id",request.getParameter("language_id"));
			out.println(languageObj.updateLanguage(results));
			response.sendRedirect("../report-language.jsp?emp_id=0&msg=Language Updated Successfully");
		}
	}
%>
