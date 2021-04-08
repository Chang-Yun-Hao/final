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
            if(session.getAttribute("mID")==null)
            {   
                if(session.getAttribute("ID")!=null)
                {
                  con.createStatement().execute("USE `ourweb`");
                  String sqlsp = "SELECT memId, sum(sumPrice) FROM ourweb.shoppingcart WHERE memId='"+session.getAttribute("ID")+"' GROUP BY memId";
                  ResultSet rssp = con.createStatement().executeQuery(sqlsp);
                  String price = "";
                  if(rssp.next())
                  {
                    price = rssp.getString("sum(sumPrice)");
                  }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shopping cart</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');
  @import url(css/head.css);
  @import url(css/shopping\ car.css);
  @import url(css/animation.css);

  .pay-total {
    float: right;
    font-size: 25px;
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

  <!--交易紀錄-->

  <div class=" content">
    <div class=" insideleft">
      <p>
        <h1 class=" h1_w"> 購物車</h1>
      </p>
      <hr class="hr1">
      <div class=" c_w">
        我的購物車如下
      </div>
      <hr class="hr1">
      <div>
        <table border="1" style="margin-left: 250px;">
          <!--2021.1.5 new-每個head都有被動過-->

          <thead>
            <tr style="background-color:lightgray;">
              <th>
                名稱
              </th>
              <th>
                數量
              </th>
              <th>
                金額
              </th>
              <th>
                總計
              </th>
              <th>
                取消
              </th>
            </tr>

            <%
            String sql = "SELECT shoppingcart.carId, shoppingcart.memId, product.pdName, shoppingcart.number, product.pdPrice, shoppingcart.sumPrice FROM shoppingcart JOIN product ON shoppingcart.pdId = product.pdId WHERE memId = '"+session.getAttribute("ID")+"'";
            ResultSet rs = con.createStatement().executeQuery(sql);

            int i=0;
           
            while(rs.next())
            {
                out.println("<form action='add_del_cart.jsp' method='post' id='"+i+"'>");
                out.println("<input type='hidden' value='"+rs.getString("carId")+"' name='CARID'>");
                out.println("<tr>");
                out.println("<td>"+rs.getString("pdName")+"</td>");
                out.println("<td>"+rs.getString("number")+"</td>");
                out.println("<td>"+rs.getString("pdPrice")+"</td>");
                out.println("<td>"+rs.getString("sumPrice")+"</td>");
                out.println("</form>");
                out.println("<td><button type='submit' form='"+i+"' name='cancel' class=' c_w_text1' style='margin-left: 15px;'>取消選購</button>");
                out.println("</td>");
                out.println("</tr>");
                i+=1;
            }
            %>


          </thead>
        </table>
        <hr>
        <div class="pay-total">
          <table>
        
        <%
        if(price !="")
        {

              int j = Integer.parseInt(price);

              if(j >= 20000 && j < 30000)
              {
                  j*=0.9;
                  int k = j + 80;
                  out.println("<tr>");
                  out.println("<td>小計：</td>");
                  out.println("<td>$<s>"+price+"</s></td>");
                  out.println("</tr>");
                  out.println("<tr>");
                  out.println("<td></td>");
                  out.println("<td>$<font color = 'red'>"+j+"</td>");
                  out.println("</tr>");
                  out.println("<tr>");
                  out.println("<td>運費：</td>");
                  out.println("<td align='right'>$80</td>");
                  out.println("</tr>");
                  out.println("<tr>");
                  out.println("<td>總付款金額：</td>");
                  out.println("<td>$"+k+"</td>");
                  out.println("</tr>");
              }

              if(j >= 30000)
              {
                  j*=0.8;
                  int k = j + 80;
                  out.println("<tr>");
                  out.println("<td>小計：</td>");
                  out.println("<td>$<s>"+price+"</s></td>");
                  out.println("</tr>");
                  out.println("<tr>");
                  out.println("<td></td>");
                  out.println("<td>$<font color = 'red'>"+j+"</td>");
                  out.println("</tr>");
                  out.println("<tr>");
                  out.println("<td>運費：</td>");
                  out.println("<td align='right'>$80</td>");
                  out.println("</tr>");
                  out.println("<tr>");
                  out.println("<td>總付款金額：</td>");
                  out.println("<td>$"+k+"</td>");
                  out.println("</tr>");
              }

              if(j < 20000)
              {
                  int k = j + 80;
                  out.println("<tr>");
                  out.println("<td>小計：</td>");
                  out.println("<td>$"+price+"</td>");
                  out.println("</tr>");
                  out.println("<tr>");
                  out.println("<td>運費：</td>");
                  out.println("<td align='right'>$80</td>");
                  out.println("</tr>");
                  out.println("<tr>");
                  out.println("<td>總付款金額：</td>");
                  out.println("<td>$"+k+"</td>");
                  out.println("</tr>");
              }
        }
        
        %> 

        

            <%-- <tr>
              <td>小計：</td>
              <td>$780</td>
            </tr>

            <tr>
              <td>折價後：</td>
              <td>$780</td>
            </tr>

            <tr>
              <td>運費：</td>
              <td>$80</td>
            </tr>

            <tr>
              <td>總付款金額：</td>
              <td>$780</td>
            </tr> --%>

          </table>
          <hr>
        </div>
        <div>

          <span>
            <button name="keep shopping" class="c_w_text1" style="margin-left: 50px;margin-top: 10px; position: absolute;" onclick="window.location.href = 'store_1.jsp';">繼續選購</button>
            <button name="pay bill" class="c_w_text1" style="margin-left: 1050px;margin-top: 20px;" onclick="window.location.href='pay bill.jsp'">前往買單</button>
          </span>
        </div>
      </div>
    </div>

    <footer>
      <div>

        <img src="images/logo_index.png"
          style="width: 100px;height: 100px;float: left;margin-left: 20px; padding: 35px;">
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
            else
            {
              con.close();
              out.println("<SCRIPT LANGUAGE='JavaScript'>");
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