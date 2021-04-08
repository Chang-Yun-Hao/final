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
            <tr style="background-color:lightgray;">
              <td class="td_1">時間</td>
              <td class="td_2">姓名</td>
              <td class="td_3">地址</td>
              <td class="td_4">付款方式</td>
              <td class="td_5">7-11</td>
              <td class="td_6">商品</td>
              <td class="td_7">數量</td>
              <%-- <td class="td_8">確認</td> --%>

<%   // time receiverName  receiverAddress payWay delivery pdName number
                sql = "SELECT time, receiverName, receiverAddress, payWay, delivery, pdName, number FROM order_form ORDER BY order_form.oId DESC;";
                ResultSet rs = con.createStatement().executeQuery(sql);
                int i=0;
                while(rs.next())
                {
                i+=1;
                out.println("<tr>");
                out.println("<td class='td_1'>"+rs.getString("time")+"</td>");
                out.println("<td class='td_2'>"+rs.getString("receiverName")+"</td>");
                out.println("<td class='td_3'>"+rs.getString("receiverAddress")+"</td>");
                out.println("<td class='td_4'>"+rs.getString("payWay")+"</td>");
                out.println("<td class='td_5'>"+rs.getString("delivery")+"</td>");
                out.println("<td class='td_6'>"+rs.getString("pdName")+"</td>");
                out.println("<td class='td_7'>"+rs.getString("number")+"</td>");
               // out.println("<td>");
               // out.println(" <input type='checkbox' class='c_w_text1' name='check_box'> 確認");
               // out.println("</td>");
                out.println("</tr>");

                }
%>              

            <%-- <tr>
              <td class="td_1">2021-01-05</td>
              <td class="td_2">巴巴</td>
              <td class="td_3">巴巴星球巴巴窩巴巴路巴巴巷巴巴號巴巴樓</td>
              <td class="td_4">貨到付款</td>
              <td class="td_5">7-11</td>
              <td class="td_6">Pista GP RR賽事款-暗藍</td>
              <td class="td_7">1000</td>

              <td>
                <input type="checkbox" class="c_w_text1" name="check_box"> 確認
              </td>
            </tr> --%>

            </tr>
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