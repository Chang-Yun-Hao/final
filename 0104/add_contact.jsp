<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
            sql="use `ourweb`";
            con.createStatement().execute(sql);
            //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
            String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
            String new_mail=request.getParameter("email");
            String new_sug=new String(request.getParameter("sug").getBytes("ISO-8859-1"),"UTF-8");

            sql = "INSERT `contact` (`Name`, `Email`, `Suggestions`)";
            sql+="VALUE ('"+new_name+"', ";
            sql+="'"+new_mail+"', ";
            sql+="'"+new_sug+"') ";
            con.createStatement().execute(sql);
            out.println("<SCRIPT LANGUAGE='JavaScript'>");
            out.println("alert('感謝您的寶貴意見！')");
            out.println("history.back();");
            out.println("</SCRIPT>");
            
		  
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
          //response.sendRedirect("signin&register.jsp");
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