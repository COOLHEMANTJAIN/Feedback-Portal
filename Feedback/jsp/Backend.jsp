
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*" %>
    <%@ page import="java.io.*"%>
    
     <%@ page import="codes.Authentication"%>
	
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.io.*"%>
	
<%
	String name=request.getParameter("user");
	String pass=request.getParameter("password");
	
	System.out.println(name);
	System.out.println(pass);	
	Authentication object1 =new Authentication();
	object1.authenticator(name,pass);
 	int i=object1.flag;
	//to validate email Id and password
	//int i=1;
	System.out.println("Testing Message");
	System.out.println(i);
	String site;
	
	if(i==1&&!name.equals("admin"))					//if ok then i becomes 1 and redirected to another page
	{ 
		site ="sb-admin/homepage.jsp";
		System.out.println("hiii2");
		session.setAttribute("user",name);
	}
	else if(i==1&&name.equals("admin"))
	{
		site ="sb-admin/admin.jsp";
		System.out.println("hiii3");
		session.setAttribute("user",name);
	}
	else
	{
		site = "index.jsp";    
		//if password authentication fails then redirected to first page
	}
	// New location to be redirected
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site);
	%>
<title>Insert title here</title>
</head>
<body>

</body>
</html>