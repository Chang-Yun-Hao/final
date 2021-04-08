<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
              if(session.getAttribute("ID")!=null)
              {
                      con.createStatement().execute("USE `ourweb`");
                      String sql = "SELECT * FROM `member` WHERE `memId`='"+session.getAttribute("ID")+"'";
                      ResultSet rs = con.createStatement().executeQuery(sql);
                      String NAME = "", EMAIL = "", DATE = "", ADDRESS = "";
                      while(rs.next())
                      {
                        NAME = rs.getString("memName");
                        EMAIL = rs.getString("memEmail");
                        DATE = rs.getString("memDate");
                        ADDRESS = rs.getString("memAddress");
                      }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Member profile</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');
  @import url(css/member_profile.css);
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
          <a href="class.jsp" class="link" style="border-right: 1px #B2ACAC solid">安駕小教室</a>
          <a href="about.jsp" class="link">關於我們</a>
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

  <!--表單-->
  <div class=" content">
    <div class=" insideleft">
      <div class=" textinside">
        <h1 class="h1_w">
          會員資料
        </h1>
        <div class=" c_w">
          <p>
            名稱：
            <span style="margin-left: 30px;"><%=NAME%></span>
          </p>
        </div>
        <div class=" c_w">
          E-mail：
          <span><%=EMAIL%></span>

        </div>
        <div class="c_w">




          <p>
            生日：
            <span style="margin-left: 40px;"><%=DATE%></span>
          </p>

          <p>
            居住地：
            <span style="margin-left: 10px;"><%=ADDRESS%></span>
          </p>
        </div>
        <div class=" c_w">
          <p>
            消費紀錄：
            <table class="pay-goods">
              <tr style="background-color: lightgray;">
                <td class=" pay-t1">訂單商品</td>
                <td class="pay-t2">單價</td>
                <td class="pay-t3">數量</td>
                <td class="pay-t4">總額</td>
              </tr>
              <%
              sql = "SELECT *, product.pdPrice FROM order_form JOIN product ON order_form.pdName = product.pdName WHERE memId = '"+session.getAttribute("ID")+"'";
              ResultSet rs1 = con.createStatement().executeQuery(sql);
              while(rs1.next())
              {
                out.println("<tr>");
                out.println("<td class='pay-t1'>"+rs1.getString("pdName")+"</td>");
                out.println("<td class='pay-t2'>"+rs1.getString("pdPrice")+"</td>");
                out.println("<td class='pay-t3'>"+rs1.getString("number")+"</td>");
                out.println("<td class='pay-t4'>"+rs1.getString("totalPrice")+"</td>");
                out.println("</tr>");
              }
              %>
              <%-- <tr>
                <td class="pay-t1">SF-3</td>
                <td class="pay-t2">3300</td>
                <td class="pay-t3">1</td>
                <td class="pay-t4">3300</td>
              </tr> --%>

            </table>
          </p>

          <p>

            <form>
              <fieldset>
                <legend>評論評分紀錄</legend>
                <%
                sql = "SELECT *, member.memName FROM message JOIN `member` ON message.memId = member.memId WHERE message.memId='"+session.getAttribute("ID")+"'ORDER BY message.msgId DESC;";
                ResultSet rs2 = con.createStatement().executeQuery(sql);
                while(rs2.next())
                {
                  out.println("<div>");
                  out.println("<div class='msg'>");
                  out.println("<div class='msg_img'>");
                  out.println("</div>");
                  out.println("<div class='mag__body'>");
                  out.println("<div class='msg__info'>");
                  out.println("<span class='msg__author'>"+rs2.getString("memName")+"</span>");
                  out.println("<span class='msg__time'>"+rs2.getString("msgDate")+"");
                  out.println("<span style='color: gold;'><i class='fas fa-star'></i><i class='fas fa-star'></i>");
                  out.println("<i class='fas fa-star ''></i><i class='fas fa-star ''></i><i class='fas fa-star'></i></span></span>");
                  out.println("</div>");
                  out.println("<p class='msg__content'>");
                  out.println(""+rs2.getString("msgContent")+"");
                  out.println("</p>");
                  out.println("</div>");
                  out.println("</div>");
                  out.println("</div>");
                }
                %>
                <%-- <div>
                  <div class="msg">
                    <div class="msg_img">
                    </div>
                    <div class="mag__body">
                      <div class="msg__info">
                        <span class="msg__author">巴巴</span>
                        <span class="msg__time">2020-12-26
                          <span style="color: gold;"><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            <i class="fas fa-star "></i><i class="fas fa-star "></i><i class="fas fa-star"></i></span></span>
                      </div>
                      <p class="msg__content">
                        咪咪咪！
                      </p>

                    </div>
                  </div>
                </div> --%>

              </fieldset>
            </form>
          </p>


          <button onclick="window.location.href='member profile_change.jsp'" class=" c_w_text" name="data"
            style="border-radius: 90px;">
            修改資料</button>



          <button onclick="window.location.href='password_change.jsp'" class=" c_w_text" name="password"
            style="border-radius: 90px;margin-left: 30px;">更改密碼</button>


          <button onclick="window.location.href='member profile.jsp'" class=" c_w_text" name="notchange"
            style="border-radius: 90px; margin-left: 300px;">
            送出更動</button>



        </div>
      </div>
    </div>
    <footer>
      <div>
        <img src="images/logo_index.png"
          style="width: 100px;height: 80px;float: left;margin-left: 20px; padding: 35px;">
        <div style="text-align: center; float: left;margin-top: 35px;margin-left: 290px;padding: 35px;">
          頭戴安全帽，安全有一套
        </div>
        <div style="text-align: center; float: right;margin-top: 5px;margin-right: 20px; padding: 35px;">
          中原大學資訊管理學系<br>
          320桃園市中壢區中原大學<br>
          Tel: 03 265 9999<br>
          <a href="https://www.cycu.edu.tw/" target="_blank">https://www.cycu.edu.tw/</a>
        </div>
      </div>
    </footer>
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