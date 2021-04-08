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
            String sqlP = "SELECT * FROM product WHERE pdKind = 'Pista GP RR' GROUP BY pdKind";
            ResultSet rsP = con.createStatement().executeQuery(sqlP);
            String ID="" ,PRICE="" ,NAME=""; 
            while(rsP.next())
            {
              ID = rsP.getString("pdId");
              PRICE = rsP.getString("pdPrice");
              NAME = rsP.getString("pdKind");
            }

            String sqlS1 = "SELECT * FROM product WHERE pdId = '10' ";
            ResultSet rsS1 = con.createStatement().executeQuery(sqlS1);
            String STOCK1="" ,STOCK2="" ,STOCK3="";
            while(rsS1.next())
            {
              STOCK1 = rsS1.getString("pdStock");
            }

            String sqlS2 = "SELECT * FROM product WHERE pdId = '11' ";
            ResultSet rsS2 = con.createStatement().executeQuery(sqlS2);             
            while(rsS2.next())
            {
              STOCK2 = rsS2.getString("pdStock");
            }

            String sqlS3 = "SELECT * FROM product WHERE pdId = '12' ";
            ResultSet rsS3 = con.createStatement().executeQuery(sqlS3);
            while(rsS3.next())
            {
              STOCK3 = rsS3.getString("pdStock");
            }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pista GP RR</title>
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
          <div>
            <img onclick="showBgImg(this)" class="thum-img"
              src="../images/products/see/AGV/Pista GP RR/agv_helmets_pista_gprr_mplk_300x300.jpg">
          </div>
          <div class="box2" id="img1"><img
              src="../images/products/see/AGV/Pista GP RR/agv_helmets_pista_gprr_mplk_300x300.jpg"
              class=" thum-img" onclick="showBgImg(this)" />
          </div>
          <div class="box2" id="img2"><img
              src="../images/products/see/AGV/Pista GP RR/agv_pista_gprr_carbon_performance_helmet_carbon_red_300x300.jpg" class=" thum-img"
              onclick="showBgImg(this)" />
          </div>
          <div class="box2" id="img3"><img
              src="../images/products/see/AGV/Pista GP RR/agv_pista_gpr_soleluna2018_helmet_300x300.jpg"
              class="thum-img" onclick="showBgImg(this)" />
          </div>
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
          <%=NAME%>
        </h1>
        <p>
          <div class="word1">
            NT$ <%=PRICE%>
            <i class="fas fa-star star"> 4.7</i>
          </div>
        </p>
        <p>
          <div class="word">顏色選取：
            <a href="#img1"> <button name="Pista GP RR_W" class="button_w" onclick = "changeId(10);changeStock(<%=STOCK1%>)">黯藍</button></a>
            <a href="#img2"> <button name="Pista GP RR_B" class="button_w" onclick = "changeId(11);changeStock(<%=STOCK1%>)">黑紅</button></a>
            <a href="#img3"> <button name="Pista GP RR_G" class="button_w" onclick = "changeId(12);changeStock(<%=STOCK1%>)">太陽</button></a>
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
            <!--有改這邊_1/2_new-->
            <form action="../add_shopping-cart.jsp" method="post"> 
          數量：<input type="number" name="number" min="1" value="1" style="width: 10%;" class="button_w button_ddd " />
          剩餘數量：<span style="color: red;margin-left: 20px;font-size: 30px;" id="Stocknumber"><%=STOCK1%></span>
            <!--有改這邊_1/2_new-->
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
    <!--有改這邊_1/2_new-->
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
              <div class="note_w" style="font-weight: bold; text-align: center;">
                Pista GP RR
              </div>
              此頂安全帽是為了MotoGP™選手專用的純種賽道帽。
              為MotoGP™賽而生的競賽帽體，與世界冠軍一模一樣的帽子。經過最高規格「FIM」安全認證，PISTA為最高安全級別的帽體。
              全帽最高級別性能，帽殼100%最高等級碳纖維，輕量化卻符合最嚴格的安全規範；五個金屬進風口與後方負壓排氣口，經過風洞實驗室與試車手賽道測試，達到通氣性與空氣力學最佳化，搭配RR版最新的PRO擾流鴨尾，高速行駛達到最小風阻與穩定性。
              護目鏡採用最高安全規格防爆鏡片，厚度5mm，有微開系統，寬闊的190度全景視野，讓您在競賽或道路皆能洞察先機。
              內襯具有360度調整系統「AF內襯調整系統」(Adaptive Fit System)，可自行調整內襯，達到任何頭型皆能服貼穩定的效果，讓騎士能專注在騎乘表現上。
              每個細節都為了追求勝利而設計
              這就是癡迷的美好。

            </div>
            <p>
              <img class="notebox" src="../images/products/note/PISTA_GP_RR.png">
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
        String sqlm = "SELECT message.msgId, member.memName, message.msgContent, message.msgDate FROM message JOIN `member` ON message.memId = member.memId WHERE pdId = '10' ORDER BY message.msgId DESC;";
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