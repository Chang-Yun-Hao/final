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
	  
      sql = "SELECT oNumber FROM `order_form` ORDER BY oNumber DESC LIMIT 0 , 1";
	  ResultSet rson =con.createStatement().executeQuery(sql);	  
	  int j = 0;
	  while(rson.next())
	  {
		  String a = rson.getString("oNumber");
	  	  j = Integer.parseInt(a);
		  j+=1;
	  }
	  
      String new_payment=new String(request.getParameter("payment").getBytes("ISO-8859-1"),"UTF-8");//接收前端傳來的付款方式
      String new_delivery=new String(request.getParameter("delivery").getBytes("ISO-8859-1"),"UTF-8");//接收前端傳來的運送方式
	  String new_address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
      String new_tPrice=request.getParameter("tPrice");//前端傳來的總付款金額
      java.sql.Date new_createtime=new java.sql.Date(System.currentTimeMillis());//訂單時間
	  String new_onumber ="";

      sql = "SELECT shoppingcart.memId, shoppingcart.pdName, shoppingcart.number, member.memName, product.pdStock, shoppingcart.pdId FROM shoppingcart JOIN `member` ON shoppingcart.memId = member.memId JOIN product ON shoppingcart.pdId = product.pdId WHERE shoppingcart.memId ='"+session.getAttribute("ID")+"'";
      ResultSet rs = con.createStatement().executeQuery(sql);
	  while(rs.next())
	  {
			sql="INSERT `order_form` (`memId` , `pdName`, `number`, `totalPrice`, `receiverName`, `receiverAddress`, `payWay`, `delivery`, `time`, `oNumber`)";
			sql+="VALUE ('"+session.getAttribute("ID")+"', ";
			sql+="'"+rs.getString("pdName")+"', ";
			sql+="'"+rs.getString("number")+"', ";     
			sql+="'"+new_tPrice+"', ";
			sql+="'"+rs.getString("memName")+"', ";
			sql+="'"+new_address+"', ";
			sql+="'"+new_payment+"', ";
			sql+="'"+new_delivery+"', ";
			sql+="'"+new_createtime+"', ";
			sql+="'"+j+"') ";			
			con.createStatement().execute(sql);
			
			int a = Integer.parseInt(rs.getString("number"));
			int old_stock = Integer.parseInt(rs.getString("pdStock"));
			int left_st = old_stock - a;

			sql = "UPDATE product SET pdStock = '"+left_st+"' WHERE pdId = '"+rs.getString("pdId")+"'";
			con.createStatement().execute(sql);					

			

			out.println("<SCRIPT LANGUAGE='JavaScript'>");
			out.println("alert('下單成功 感謝購買！！')");
			out.println("window.document.location.href='singin&register.jsp';");
			out.println("</SCRIPT>");
	  }

	  sql = "DELETE FROM `shoppingcart` WHERE `memId`='"+session.getAttribute("ID")+"'";
	  con.createStatement().execute(sql);
	  

	  
      
    }
    con.close();
	}
	catch (SQLException sExec) {
			out.println("SQL錯誤"+sExec.toString());
	}
}
catch (ClassNotFoundException err) {
	out.println("class錯誤"+err.toString());
}
%>