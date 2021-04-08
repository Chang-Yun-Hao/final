<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    try{
        String sql="";
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
            out.println("連線建立失敗");
        else
        {   
            if(session.getAttribute("ID")!=null)
            {
              con.createStatement().execute("USE `ourweb`");
              sql = "SELECT * FROM `member` WHERE memId = '"+session.getAttribute("ID")+"'";
              ResultSet rsa = con.createStatement().executeQuery(sql);
              String address = "";
              if(rsa.next())
              {
                address = rsa.getString("memAddress");
              }

              sql = "SELECT sum(sumPrice) FROM shoppingcart WHERE memId = '"+session.getAttribute("ID")+"'";
              ResultSet rsP = con.createStatement().executeQuery(sql);
              String price = "";
              if(rsP.next())
              {
                price = rsP.getString("sum(sumPrice)");
              }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');
  @import url(../css/pay\ bill.css);


  /*header_class*/
  * {
    font-family: 'Noto Serif TC', serif;
  }

  .page {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .head {
    display: flex;
    background-color: #6C6C6C;
    width: 1200px;
    position: fixed;
  }


  .head_menu {
    display: flex;
    text-align: center;
    align-items: center;
  }

  .head_link {
    padding: 0 30px 0 30px;
    letter-spacing: 2px;
    font-size: 20pt;
  }

  .link {
    color: white;
    text-decoration: none;
  }

  .link:hover {
    text-decoration: underline white 3px;
  }


  .head_icon {
    float: right;
    margin-left: 400px;
  }

  .content {
    width: 1000px;
    margin-left: auto;
    margin-right: auto;
  }

  footer {
    width: 1200px;
    text-align: center;
    color: black;
    float: left;
    background-color: gray;
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
          <a href="singin&register.jsp"><img src="images/會員_ok.png" title="會員登入"></a>
          <a href="shopping-cart.jsp"><img src="images/購物車_ok.png" title="購物車"></a>
        </div>

      </div>

    </div>


    <!--結帳清單-->
    <div class="pay-bill-main">
      <p class="pay-txt">結帳</p>


      <button onclick="window.location.href='shopping-cart.jsp'" class="back-btn"><i
          class="fas fa-angle-left"></i>返回購物車</button>
      <hr>
      <%
        sql = "SELECT shoppingcart.pdName, product.pdPrice, number, sumPrice FROM shoppingcart JOIN product ON shoppingcart.pdId = product.pdId WHERE memId = '"+session.getAttribute("ID")+"'";
        ResultSet rs = con.createStatement().executeQuery(sql);

      %>
      <div>
        <h2 style="text-align: center;">訂單商品</h2>
        <table class="pay-goods">
          <tr style="background-color: lightgray;">
            <td class="pay-t1">訂單商品</td>
            <td class="pay-t2">單價</td>
            <td class="pay-t3">數量</td>
            <td class="pay-t4">總額</td>
          </tr>
        <%
        while(rs.next())
        {
          out.println("<tr>");
          out.println("<td class='pay-t1'>"+rs.getString("pdName")+"</td>");
          out.println("<td class='pay-t2'>"+rs.getString("pdPrice")+"</td>");
          out.println("<td class='pay-t3'>"+rs.getString("number")+"</td>");
          out.println("<td class='pay-t4'>"+rs.getString("sumPrice")+"</td>");
          out.println("</tr>");
        }
        %>
          <%-- <tr>
            <td class="pay-t1">Pista GP RR</td>
            <td class="pay-t2">16,500</td>
            <td class="pay-t3">1</td>
            <td class="pay-t4">16,500</td>
          </tr> --%>

        </table>


        <h2 style="text-align: center;">寄送資訊</h2>
        <div class="pay-ways">


<form action="add_order.jsp" method="post">
          <div class="way1">
            <p>付款方式：</p>
            <select name="payment" style="margin-left: 10px;">
              <option value="貨到付款">貨到付款</option>
              <option value="信用卡">信用卡</option>
              <option value="ATM轉帳繳費">ATM轉帳繳費</option>
              <option value="全家代碼繳費">全家代碼繳費</option>
              <option value="11代碼繳費">7-11代碼繳費</option>
            </select>
          </div>

          <div class="way2">
            <p>運送方式：</p>

            <select name="delivery" style="margin-left: 10px;">
              <option value="7-11">7-11</option>
              <option value="全家">全家</option>
              <option value="萊爾富">萊爾富</option>
              <option value="OK MART">OK MART</option>
              <option value="黑貓宅急便">黑貓宅急便</option>
            </select>
          </div>
          <div class="location">
            <p>地址：</p><input name="address" type="text" style="margin-left: 34px;" value="<%=address%>">
          </div>
        </div>
        <hr>
        <div class="pay-total">
          <table>
              <%
                int j = Integer.parseInt(price);

                if(j >= 20000 && j < 30000)
                {
                  j*=0.9;
                  out.println("<tr>");
                    out.println("<td width='195px'>小計：</td>");
                    out.println("<td>$<s>"+price+"</s></td>");
                  out.println("</tr>");
                  out.println("<tr>");
                    out.println("<td></td>");
                    out.println("<td align='right'>$&nbsp;<font color = 'red'>"+j+"</font></td>");
                  out.println("</tr>");
                }

                if(j >= 30000)
                {
                  j*=0.8;
                  out.println("<tr>");
                    out.println("<td width='193px'>小計：</td>");
                    out.println("<td>$&nbsp;<s>"+price+"</s></td>");
                  out.println("</tr>");
                  out.println("<tr>");
                    out.println("<td></td>");
                    out.println("<td align='right'>$&nbsp;<font color = 'red'>"+j+"</font></td>");
                  out.println("</tr>");
                }

                else
                {
                  out.println("<tr>");
                    out.println("<td width='193px'>小計：</td>");
                    out.println("<td>$&nbsp;"+price+"</td>");
                  out.println("</tr>");
                }

              %>   

            <tr>
              <td>運費：</td>
              <td align="right">$&nbsp;80</td>
            </tr>
            <tr>
              <td>總付款金額：</td>
              <%
              int k = j + 80;
              out.println("<td align='right'>$&nbsp;"+k+"</td>");
              %>
              <input type="hidden" name="tPrice" value="<%=k%>">
            </tr>
          </table>
          <hr>
          <button type="submit" class="pay-btn">我要下單</button>
</form>

        </div>
      </div>


    </div>

  </div>

  <!--頁尾-->
  <div class="page">
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
          https://www1.cycu.edu.tw/

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