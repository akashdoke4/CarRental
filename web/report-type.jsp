<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	CarType typeDetails = new CarType();
	ArrayList allCarType = typeDetails.getAllCarType();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Car Type Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
               
              <th>Car Type Name</th>
              <th>Description</th>
                <th>Action</th>
                 <th> company name</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allCarType.size();i++) 
			{ 
				HashMap CarTypeDetails = new HashMap();
				CarTypeDetails = (HashMap)allCarType.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(CarTypeDetails.get("type_name")); %></td>
				  <td><% out.print(CarTypeDetails.get("type_description")); %></td>
				  <td> 
					<a href="type.jsp?type_id=<% out.print(CarTypeDetails.get("type_id")); %>">edit</a>
				  </td>
                                   <td style="text-align:center;"><% out.print(CarTypeDetails.get("company_name")); %></td>
				
                                </tr>
			<%
			}
			if(allCarType.size() == 0) 
			{
			%>
				<tr>
					<td colspan="5">No Records Found !!!</td>
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
