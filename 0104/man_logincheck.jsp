<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    try{
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
          out.println("連線建立失敗");
        else
        {
            con.createStatement().execute("USE `ourweb`");
            String sql = "SELECT * FROM `manager`" ;
            con.createStatement().execute(sql);
            if(request.getParameter("Email") !="" && request.getParameter("Password") != "")
                {
                    sql = "SELECT * FROM `manager` WHERE `manaId`='" +request.getParameter("Email")+"'AND `manaPwd`='"+request.getParameter("Password")+"'";
                    ResultSet rs =con.createStatement().executeQuery(sql);
                    if(rs.next())
                    {
                  	    session.setAttribute("mID",rs.getString("manaId"));
                        response.setHeader("Refresh","0;manager.jsp");
                    }
                    else
                    {
                        out.println("<SCRIPT LANGUAGE='JavaScript'>");
                        out.println("alert('帳號密碼錯誤！')");
                        out.println("window.document.location.href='mansingin.jsp';");
                        out.println("</SCRIPT>");
                    }
                }
            else
            {
                out.println("<SCRIPT LANGUAGE='JavaScript'>");
                out.println("alert('請輸入帳號密碼！')");
                out.println("window.document.location.href='mansingin.jsp';");
                out.println("</SCRIPT>");
            }
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