<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
 
if(request.getParameter("Email") !="" && request.getParameter("Password") != "")
{
      
    
    //sql = "SELECT * FROM `members` WHERE` memEmail`=" +request.getParameter("Email") + 
	  //    "'  AND memPwd='" + request.getParameter("Password") + "'"  ; 
    sql = "SELECT * FROM members WHERE memId=? AND pwd=?";
	//' OR 1=1; #
	//out.println(sql);
	//out.close();//程式結束
    PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("Email"));
    pstmt.setString(2,request.getParameter("Password"));
	
	ResultSet paperrs = pstmt.executeQuery();
	//ResultSet paperrs =con.createStatement().executeQuery(sql);
    
    if(paperrs.next()){            
        session.setAttribute("Email",request.getParameter("Password"));
		con.close();//結束資料庫連結
        response.sendRedirect("member profile.jsp") ;
    }
    else{
        con.close();//結束資料庫連結
	    out.println("密碼帳號不符 !! <a href=singin&register.jsp'>按此</a>重新登入") ;
	}
}

%>