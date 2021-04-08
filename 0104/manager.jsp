<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    try {
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
          if(session.getAttribute("mID")!=null)
            {
              sql="use `ourweb`";
              con.createStatement().execute(sql);
              String sqlman = "SELECT * FROM manager WHERE manaId = '"+session.getAttribute("mID")+"'";
              ResultSet rsman = con.createStatement().executeQuery(sqlman);
              String name="";
              while(rsman.next())
              {
                name = rsman.getString("manaName");
              }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manager</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');
  @import url(css/manager.css);
  @import url(css/animation.css);

  * {
    font-family: 'Noto Serif TC', serif;
  }
</style>

<body>
  <div class="page">
    <!--header_store-->
    <div class="head">

      <div class="head_logo">
        <a href="store_1.jsp"><img src="images/logo.png" title="開始帽險"></a>
      </div>

      <div class="head_menu">
        <div class="head_link">

          <a href="store_1.jsp" class="link" style="border-right: 1px #B2ACAC solid">進入賣場</a>
<%
          if(session.getAttribute("mID")== null)
          {
            out.println("<a href='class.jsp' class='link' style='border-right: 1px #B2ACAC solid'>安駕小教室</a>");
          }
          if(session.getAttribute("mID")== null)
          {
            out.println("<a href='about.jsp' class='link'>關於我們</a>");
          }
          if(session.getAttribute("mID")!= null)
          {
            out.println("<a href='manager.jsp' class='link' style='border-right: 1px #B2ACAC solid'>賣場管理</a>");
          }
          if(session.getAttribute("mID")!= null)
          {
            out.println("<a href='check_order.jsp' class='link'>追蹤訂單</a>");
          }
%>
        </div>

        <div class="head_icon">
          <a href="singin&register.jsp"><img src="images/會員_ok.png" title="會員登入" style="margin-right: 15px;"></a>
          <a href="shopping-cart.jsp"><img src="images/購物車_ok.png" title="購物車"></a>
        </div>
        <%
          if(session.getAttribute("ID")!= null || session.getAttribute("mID")!= null)
          {
            out.println("<span class='signout'><i class='fas fa-sign-out-alt'><a href='logout.jsp' style='text-decoration:none;color:white;'>登出</a></i></span>");
          }
        %>
      </div>
      
    </div>
  </div>

  <!--會員登入-->
  <div class=" content">
    <div class=" insideleft">
      <p>
        <h1 class=" h1_w">管理者登入</h1>
      </p>
      <hr class="hr1">
      <div class=" c_w">
        <%=name%> 您好！歡迎登入！
        <br>
      </div>

      <div>
        <table border="1" style="text-align: center;">

          <thead style="text-align: center;">
            <tr>
              <td class="td_1">品牌</td>
              <td class="td_2">型號</td>
              <td class="td_3">品名</td>
              <td class="td_4">庫存</td>
              <td class="td_5">價格</td>
              <td>操作</td>
              <%
                sql = "SELECT pdId, pdBrand, pdKind, pdName, pdStock, pdPrice FROM product";
                ResultSet rs = con.createStatement().executeQuery(sql);
                int i=0;
                while(rs.next())
                {
                i+=1;
                out.println("<form name=tt action='add_pd_change.jsp' method='post' id='"+i+"'>");//參考shopping_cart.jsp的第284行  name可以刪
                out.println("<input type='hidden' value='"+rs.getString("pdId")+"' name='changeId'>");
                out.println("<tr>");
                out.println("<td class='td_1'>"+rs.getString("pdBrand")+"</td>");
                out.println("<td class='td_2'>"+rs.getString("pdKind")+"</td>");
                out.println("<td class='td_3'><input name='changeName' value='"+rs.getString("pdName")+"'></td>");
                out.println("<td class='td_4'><input name='changeStock' value='"+rs.getString("pdStock")+"'></td>");
                out.println("<td class='td_5'><input name='changePrice' value='"+rs.getString("pdPrice")+"'></td>");
                out.println("<td>");
                out.println("</form>");
                out.println("<button name='cancel' type='submit' form='"+i+"' class=' c_w_text1'>修改</button>");
                out.println("<button name='delete' type='submit' class=' c_w_text1'>刪除</button>");

                out.println("</td>");
                out.println("</tr>");

                }
              %>
          </thead>
        </table>
        <hr class="hr1">
        <div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
<%
    con.close();
    }
    else
            {
              con.close();
              out.println("<SCRIPT LANGUAGE='JavaScript'>");
              out.println("alert('請先登入！')");
              out.println("history.back();");
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