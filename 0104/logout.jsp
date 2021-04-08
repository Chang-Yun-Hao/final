<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<% 
session.removeAttribute("ID");
session.removeAttribute("mID");
out.println("<SCRIPT LANGUAGE='JavaScript'>");
out.println("alert('您已成功登出！')");
out.println("window.document.location.href='singin&register.jsp';");
out.println("</SCRIPT>");
%>