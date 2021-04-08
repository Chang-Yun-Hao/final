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
            
            String old_password=request.getParameter("password");//接收前端傳來的"舊密碼"
            String new_change_repassword=request.getParameter("change_repassword");//接收前端傳來的"新密碼"
            String new_rechange_repassword=request.getParameter("rechange_repassword");//接收前端傳來的"確認新密碼"

            sql = "SELECT * FROM `member` WHERE `memId`= '" + session.getAttribute("ID") + "' "; 
            ResultSet rs =con.createStatement().executeQuery(sql);
            String pwd="";
            while(rs.next())
            {
                pwd=rs.getString("memPwd");//這是資料庫裡的舊密碼"
            }

            //判斷"舊密碼"、新密碼"、"確認新密碼"三者是否都有輸入
            if(old_password !=null && new_change_repassword !=null && new_rechange_repassword !=null && old_password !="" && new_change_repassword !="" && new_rechange_repassword !="")
            {
                //判斷"輸入的舊密碼"和"資料庫中的舊密碼"是否相同
                if(old_password.equals(pwd))
                {
                    //判斷"新密碼"和"確認新密碼"是否相同
                    if(new_change_repassword.equals(new_rechange_repassword))
                    {
                        sql = "UPDATE `member` SET `memPwd`='"+new_change_repassword+"' WHERE `memId`='"+session.getAttribute("ID")+"'";
                        con.createStatement().execute(sql);
                        out.println("<SCRIPT LANGUAGE='JavaScript'>");
                        out.println("alert('密碼更新成功')");
                        out.println("history.back();");
                        out.println("</SCRIPT>");
                    }
                    else
                    {
                        out.println("<SCRIPT LANGUAGE='JavaScript'>");
                        out.println("alert('新密碼 與 確認密碼不符')");
                        out.println("history.back();");
                        out.println("</SCRIPT>");
                    }
                }
                else
                {
                    out.println("<SCRIPT LANGUAGE='JavaScript'>");
                    out.println("alert('舊密碼輸入錯誤')");
                    out.println("history.back();");
                    out.println("</SCRIPT>");
                }
            }
            else
            {
                out.println("<SCRIPT LANGUAGE='JavaScript'>");
                out.println("alert('請填寫正確')");
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