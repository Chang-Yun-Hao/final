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
      String new_pdid=request.getParameter("pdid");//接收前端傳來的商品ID
      String new_number=request.getParameter("number");//接收前端傳來的商品數量
      sql = "SELECT * FROM product WHERE pdId = '"+new_pdid+"'";
      ResultSet rs = con.createStatement().executeQuery(sql);
      String new_pdprice="", new_stock="", new_pdname="";
      while(rs.next())
      {
        new_pdprice = rs.getString("pdPrice");
        new_stock = rs.getString("pdStock");
        new_pdname = rs.getString("pdName");
      }
      int stock = Integer.parseInt(new_stock);
      int no = Integer.parseInt(new_number);
      int pr = Integer.parseInt(new_pdprice);


        if(session.getAttribute("ID")!=null)
        {
          if(no <= stock)
          {
            int sum = no*pr;
            sql="INSERT `shoppingcart` (`memId`, `pdId` , `pdName`, `number`, `sumPrice`)";
            sql+="VALUE ('"+session.getAttribute("ID")+"', ";
            sql+="'"+new_pdid+"', ";
            sql+="'"+new_pdname+"', ";     
            sql+="'"+new_number+"', ";
            sql+="'"+sum+"') ";
            con.createStatement().execute(sql);
            out.println("<SCRIPT LANGUAGE='JavaScript'>");
            out.println("alert('已加入購物車！')");
            out.println("history.back();");
            out.println("</SCRIPT>");

            con.close();
          }
          else
          {
            out.println("<SCRIPT LANGUAGE='JavaScript'>");
            out.println("alert('庫存數量不足！')");
            out.println("history.back();");
            out.println("</SCRIPT>");
          }
        }

        else
        {
          con.close();
          out.println("<SCRIPT LANGUAGE='JavaScript'>");
          out.println("alert('請先登入！')");
          out.println("history.back();");
          out.println("</SCRIPT>");
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