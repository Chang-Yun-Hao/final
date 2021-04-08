<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%
try 
{
	Class.forName("com.mysql.jdbc.Driver");
	try 
    {	
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		String sql="";
		Connection con=DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.println("連線失敗");
		else
        {
            sql="use `ourweb`";
            con.createStatement().execute(sql);

            String new_changeId=request.getParameter("changeId");
            String new_changeName=new String(request.getParameter("changeName").getBytes("ISO-8859-1"),"UTF-8");
            String new_changeStock=request.getParameter("changeStock");
            String new_changePrice=request.getParameter("changePrice");

            sql = "UPDATE `product` SET `pdName`='"+new_changeName+"', `pdStock`='"+new_changeStock+"',`pdPrice`='"+new_changePrice+"' WHERE `pdId` = '"+new_changeId+"'";

            con.createStatement().execute(sql);

            out.println("<SCRIPT LANGUAGE='JavaScript'>");
            out.println("alert('修改成功！')");
            out.println("history.back();");
            out.println("</SCRIPT>");


            con.close();
        }
	}
	catch (SQLException sExec) 
    {
		out.println("SQL錯誤"+sExec.toString());
	}
}
catch (ClassNotFoundException err) 
{
	out.println("class錯誤"+err.toString());
}
%>