<%@page import="Innov.Innovision_App"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="Innov.Innovision_App"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Innovision</title>
</head>
<body>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");


	Configuration cfg=new Configuration();
	cfg.configure("Innov/hibernate.cfg.xml");
	cfg.addAnnotatedClass(Innov.Innovision_App.class);
	SessionFactory factory=cfg.buildSessionFactory();
	Session s=factory.openSession();
	
	Innovision_App i=new Innovision_App(name,email);
	s.merge(i);
	s.beginTransaction().commit();
	
	s.close();
	factory.close();

	
	response.sendRedirect("index.html");
	System.out.println("ok");
%>
	</body>
</html>