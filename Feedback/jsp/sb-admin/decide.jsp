<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="codes.Update"%>
<%
    int i;
    String[] q=new String[15];
    String user=(String)session.getAttribute("user");
    if(user==null)
    {	response.setStatus(response.SC_MOVED_TEMPORARILY);
   	 response.setHeader("Location", "../index.jsp");
    
    }
    //String feedbackname= (String)session.getAttribute("feedbackname");
    String course=request.getParameter("course");
    String faculty=request.getParameter("faculty");
    //System.out.println("hi"+feedbackname);
    session.setAttribute("user",user);
    int flag=0;
    for(i=1;i<=15;i++)
    { 
    	q[i-1]=request.getParameter("q"+i);
   		System.out.println(q[i-1]);
    	
    } 	
    String suggestions=request.getParameter("text");
   	System.out.println(suggestions);
    	//String query1="Delete from "+feedbackname+" where student='"+user+"'";
    	Update object4 =new Update();
		String ip=request.getRemoteAddr();
    	 //object4.setupdates(query1);
    	String query="Insert into feedbackinfo values(default,'"+course+"','"+user+"','"+faculty+"','"+ip+"',default,";
    	int[] que=new int[15];
    	for(i=1;i<=15;i++)
    	{	
    		if(q[i-1]!=null)
    		 que[i-1]=Integer.parseInt(q[i-1]);	
    		 
    		if(q[i-1]==null)
    			query+="null"+",";
    		else
    			 query+=que[i-1]+",";	 
    	}
    	query+="'"+suggestions+"')";
    	System.out.println(query);
    	Update object1 =new Update();
    	object1.setupdates(query);
    	//query="UPDATE feedbackinfo SET status='OK' WHERE feedbackname='"+feedbackname+"'";
    	//System.out.println(query);
    	//Update object2 =new Update();
    	//object2.setupdates(query);
    	
    	response.setStatus(response.SC_MOVED_TEMPORARILY);
    	response.setHeader("Location","homepage.jsp");
    
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=user %>
</body>
</html>