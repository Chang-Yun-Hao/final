<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%
int count;
String countString;
try {
	Class.forName("com.mysql.jdbc.Driver");
	try {	
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		String sql="";
		Connection con=DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.println("連線失敗");
		else {
			sql="use ourweb";
			con.createStatement().execute(sql);
			sql="select * from counter";
			ResultSet rs=con.createStatement().executeQuery(sql);
			
			if (rs.next()){
				countString = rs.getString(1);
				count = Integer.parseInt(countString);
				if (session.isNew())
				{
					count++;
					sql="UPDATE counter SET counter = " + count ;
				}
				out.println("您是第"+count+"位訪客");
			}

			con.close();
			
		}
	}
	catch (SQLException sExec) {
			out.println("SQL錯誤"+sExec.toString());
	}
}
catch (ClassNotFoundException err) {
	out.println("class錯誤"+err.toString());
}
%>

