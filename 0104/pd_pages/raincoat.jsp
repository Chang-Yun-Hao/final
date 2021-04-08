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
            String sqlP = "SELECT * FROM product WHERE pdKind = 'raincoat' GROUP BY pdKind";
            ResultSet rsP = con.createStatement().executeQuery(sqlP);
            String ID="" ,PRICE="" ,NAME="" ,REAL=""; 
            while(rsP.next())
            {
              ID = rsP.getString("pdId");
              PRICE = rsP.getString("pdPrice");
              NAME = rsP.getString("pdKind");
              REAL = rsP.getString("pdName");
            }

            String sqlS1 = "SELECT * FROM product WHERE pdId = '50' ";
            ResultSet rsS1 = con.createStatement().executeQuery(sqlS1);
            String STOCK1="" ,STOCK2="" ,STOCK3="";
            while(rsS1.next())
            {
              STOCK1 = rsS1.getString("pdStock");
            }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>X武士斜開兩件式風雨衣</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous">
  </script>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="../images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');
  @import url(../css/head.css);
  @import url(../css/product.css);
  @import url(../css/animation.css);

  * {
    font-family: 'Noto Serif TC', serif;
  }
</style>

<body>
  <div class="page">
    <!--header_store-->
    <div class="head">

      <div class="head_logo">
        <a href="../store_1.jsp"><img src="../images/logo.png" style="height: 100px;width: 100px;" title="首頁"></a>
      </div>

      <div class="head_menu">
        <div class="head_link">
          <a href="../store_1.jsp" class="link" style="border-right: 1px #B2ACAC solid">進入賣場</a>
          <a href="../class.jsp" class="link" style="border-right: 1px #B2ACAC solid">安駕小教室</a>
          <a href="../about.jsp" class="link">關於我們</a>
        </div>

        <div class="head_icon">
          <a href="../singin&register.jsp"><img src="../images/會員_ok.png" title="會員登入"
              style="margin-right: 15px;"></a>
          <a href="../shopping-cart.jsp"><img src="../images/購物車_ok.png" title="購物車"></a>
        </div>
<%
        if(session.getAttribute("ID")!= null || session.getAttribute("mID")!= null)
        {
          out.println("<span class='signout'><i class='fas fa-sign-out-alt'><a href='../logout.jsp' style='text-decoration:none;color:white;'>登出</a></i></span>");
        }
%>
      </div>
    </div>
  </div>

  <!--商品資訊-->
  <div class="content">
    <div class="insideleft">
      <div>
        <!--點擊商品會放大-->
        <div style="position:fixed;width:100%;height:100%;z-index: 2;" id="modal" title="點擊離開預覽">
          <div class="modal" id="modalw">
            <img id="bgImg" />
          </div>
        </div>
        <div title="點擊預覽">
          <img onclick="showBgImg(this)" class="thum-img" src="../images/products/see/EX/raincoat750.jpg">
        </div>

        <script>
          var modal = document.getElementById("modal");
          var bgImg = document.getElementById("bgImg");

          function showBgImg(e) {
            modal.style.display = "block";
            bgImg.src = e.src;
          }
          bgImg.onclick = function () {
            modal.style.display = "none";
          }
        </script>
      </div>
      <div>
        <!--產品選項-->
        <h1 class="h1_w">
          <%=REAL%>
        </h1>
        <p>
          <div class="word1">
            NT$ <%=PRICE%>
            <i class="fas fa-star star"> 4.8</i>
          </div>
        </p>
        <p>
          <div class="word">顏色選取：
            <a href="#img1"> <button name=" raincoat" class="button_w">X武士兩件式雨衣</button></a>
          </div>
        </p>
        <script>
function changeId(i)
{
  document.getElementById('goodId').value = i;
}

function changeStock(s)
{
  document.getElementById("Stocknumber").innerHTML=s; //改變剩餘數量的數字
}
</script>
        <p>
          <div>
            <!--有改這邊_1/5_new-->
            <form action="../add_shopping-cart.jsp" method="post"> 
          數量：<input type="number" name="number" min="1" value="1" style="width: 10%;" class="button_w button_ddd " />
          剩餘數量：<span style="color: red;margin-left: 20px;font-size: 30px;" id="Stocknumber"><%=STOCK1%></span>
            <!--有改這邊_1/5_new-->
          </div>
          <input type="hidden" name="pdid" id="goodId" value="<%=ID%>">
        </p>
        <p>
          <div>
            <button class="button_w" type="submit" name="add to Shopping Cart">加入購物車</button> 
</form>            
			<a href="../shopping-cart.jsp"><button class="button_w button_pay" type="submit" name="Checkout">直接結帳</button></a>
          </div>
        </p>
        <br><br>
      </div>
    </div>
    <!--產品說明-->
    <!--有改這邊_1/5_new-->
    <div class="content">
      <div class="insideleft">
        <p>
          <hr>
          <h1 class="word2">
            產品說明
          </h1>
          <hr>
          <div class="box1">
            <div class="note_w">
              <div class="note_w" style="font-weight: bold;text-align: center;">
                X武士斜開兩件式風雨衣
              </div>
              背後&腋下排風口
              斜開前項
              手套型袖口
              網狀紗貼身帽
              雨褲-後片一片式剪裁
              商品重量：1kg
            </div>
            <p>
              <img class="notebox" src="../images/products/EX/raincoat1.jpg">
            </p>
          </div>


        </p>
      </div>
      <div class="insideleft">
        <form action="../add_message.jsp" method="post" >
        <input type="hidden" name="PDID" value="<%=ID%>">  <!--傳到後端-->
          <fieldset>
            <legend class="h1_w">留言板</legend>
            <textarea style="width: 1200px;height: 200px;" name="msg" rows="5"></textarea><br>
            <span class="h1_w">
              評分: <i class="far fa-star "></i> <i class="far fa-star "></i> <i class="far fa-star "></i> <i
                class="far fa-star "></i> <i class="far fa-star "></i>
            </span>
            <br>
            <button type="submit" name="output" class="button_w">留言</button>
            </form>
          </fieldset>
          <hr>
          <%
        String sqlm = "SELECT message.msgId, member.memName, message.msgContent, message.msgDate FROM message JOIN `member` ON message.memId = member.memId WHERE pdId = '50' ORDER BY message.msgId DESC;";
        ResultSet rsm = con.createStatement().executeQuery(sqlm);
        while(rsm.next())
        {
          out.println("<div>");
            out.println("<div class='msg'>");
              out.println("<div class='msg_img'>");
              out.println("</div>");
              out.println("<div class='mag__body'>");
                out.println("<div class='msg__info'>");
                  out.println("<span class='msg__author'>"+rsm.getString("memName")+"</span>");
                  out.println("<span class='msg__time'>"+rsm.getString("msgDate")+"</span>");
                out.println("</div>");
                out.println("<p class='msg__content'>");
                  out.println(rsm.getString("msgContent"));
                out.println("</p>");
              out.println("</div>");
            out.println("</div>");
          out.println("</div>");
        }
%>
    </div>

    <footer>
      <div>

        <img src="../images/logo_index.png" style="width: 80px;height: 80px;float: left;margin-left: 20px;">
        <div style="text-align: center; float: left;margin-top: 35px;margin-left: 430px;">
          頭戴安全帽，安全有一套
        </div>
        <div style="text-align: center; float: right;margin-top: 5px;margin-right: 20px;">
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
		}
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>