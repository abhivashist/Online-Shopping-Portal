<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
//int id = Integer.parseInt(request.getParameter("id"));
String email=request.getParameter("email");
String status="cancel";
try
{
 Connection con=ConnectionProvider.getCon();
 Statement st=con.createStatement();
 String query = "update cart set status= 'cancel' where product_id='"+id+"' and email='"+email+"' and address is not NULL";
//String query = "update cart set status = 'cancel' where product_id='"+id+"' and email='"+email+"' ";
int result =  st.executeUpdate(query);

 response.sendRedirect("ordersReceived.jsp?msg=cancel");
 }
catch(Exception e)
{
	System.out.println(e);
	 response.sendRedirect("ordersReceived.jsp?msg=wrong");	
}
%> 