<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	try {	
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		String sql="";
		Connection con=DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.println("連線失敗");
		else
    {
      sql="use `ourweb`";
      con.createStatement().execute(sql);

      String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");//接收前端傳來的名稱
      String new_date=request.getParameter("date");//接收前端傳來的生日
      String new_address=new String(request.getParameter("relocation").getBytes("ISO-8859-1"),"UTF-8");//接收前端傳來的地址

      sql = "SELECT * FROM `member` WHERE `memId`='"+session.getAttribute("ID")+"'"; 
			ResultSet rs =con.createStatement().executeQuery(sql);
			String NAME="", DATE="", ADDRESS="";
			while(rs.next())
      {
        NAME=rs.getString("memName");//這是資料庫裡的名稱
        DATE=rs.getString("memDate");//這是資料庫裡的生日
        ADDRESS=rs.getString("memAddress");//這是資料庫裡的地址
			}

      //判斷名稱有沒有更改
      if(!(new_name.equals("") || new_address.equals("")))
      {
          if(!(new_name.equals(NAME)) || !(new_date.equals(DATE)) || !(new_address.equals(ADDRESS)))
          {
              if(new_name.equals(NAME))
              {
                //沒有更動就不做事
              }
              else
              {
                sql = "UPDATE `member` SET `memName`='"+new_name+"' WHERE `memId`='"+session.getAttribute("ID")+"'";
                con.createStatement().execute(sql);
              }

              //判斷生日有沒有更改
              if(new_date.equals(DATE))
              {
                //沒有更動就不做事
              }
              else
              {
                sql = "UPDATE `member` SET `memDate`='"+new_date+"' WHERE `memId`='"+session.getAttribute("ID")+"'";
                con.createStatement().execute(sql);
              }

              //判斷地址有沒有更改
              if(new_address.equals(ADDRESS))
              {
                //沒有更動就不做事
              }
              else
              {
                sql = "UPDATE `member` SET `memAddress`='"+new_address+"' WHERE `memId`='"+session.getAttribute("ID")+"'";
                con.createStatement().execute(sql);
              }
              out.println("<SCRIPT LANGUAGE='JavaScript'>");
              out.println("alert('資料更新成功')");
              //out.println("history.back();");
              out.println("</SCRIPT>");
              response.setHeader("Refresh","0;member profile_change.jsp");
          }
          else
          {
            out.println("<SCRIPT LANGUAGE='JavaScript'>");
            out.println("alert('資料沒有更新')");
            //out.println("history.back();");
            out.println("</SCRIPT>");
            response.setHeader("Refresh","0;member profile_change.jsp");
          }
      }    
      else
			{
				out.println("<SCRIPT LANGUAGE='JavaScript'>");
				out.println("alert('資料不能為空')");
				//out.println("history.back();");
				out.println("</SCRIPT>");
        response.setHeader("Refresh","0;member profile_change.jsp");
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