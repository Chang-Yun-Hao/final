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
            String sqlP = "SELECT * FROM product WHERE pdKind = '68SII' GROUP BY pdKind";
            ResultSet rsP = con.createStatement().executeQuery(sqlP);
             String ID="" ,PRICE="" ,NAME="";
            while(rsP.next())
            {
              ID = rsP.getString("pdId");
              PRICE = rsP.getString("pdPrice");
              NAME = rsP.getString("pdName");
            }

            String sqlS1 = "SELECT * FROM product WHERE pdId = '27' ";
            ResultSet rsS1 = con.createStatement().executeQuery(sqlS1);
            String STOCK1="";
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
  <title>68SII</title>
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
        <a href="../store_1.jsp"><img src="../images/logo.png" title="點擊進入帽險王首頁"></a>
      </div>

      <div class="head_menu">
        <div class="head_link">
          <a href="../store_1.jsp" class="link" style="border-right: 1px #B2ACAC solid">進入賣場</a>
          <a href="../class.jsp" class="link" style="border-right: 1px #B2ACAC solid">安駕小教室</a>
          <a href="../about.jsp" class="link">關於我們</a>
        </div>

        <div class="head_icon">
          <a href="../singin&register.jsp"><img src="../images/會員_ok.png" title="會員登入" style="margin-right: 15px;"></a>
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
        <div style="position:fixed;width:100%;height:100%;z-index: 3;" id="modal" title="點擊離開預覽">
          <div class="modal" id="modalw">
            <img id="bgImg" />
          </div>
        </div>
        <div>
          <img onclick="showBgImg(this)" title="點擊預覽" class="thum-img"
            src="../images/products/see/SOL/68SII/10-1-1.jpg">
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
              <i class="fas fa-star star"> 4.6</i>
            </div>
          </p>
          <p>
            <div class="word">顏色選取：
               <a href="#img1"> <button name="68SII" class="button_w" disabled>黑色</button></a>
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
<form action="../add_shopping-cart.jsp" method="post"> 
                數量：<input type="number" name="number" min="1" value="1" style="width: 10%;" class="button_w button_ddd " />
                剩餘數量：<span style="color: red;margin-left: 20px;font-size: 30px;" id="Stocknumber"><%=STOCK1%></span>            
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
                  68SII
                </div>
                經典跑車造型鴨尾，讓安全帽升級成為時尚配件。可拆式小鼻罩，避免呼吸時的熱氣在鏡片上凝結霧氣，確保視線清晰。通過美國DOT及台灣CNS安全認證。DOT測試內容包含穿透測試、撞擊測試、視野角度測試等，為消費者的安全提供保障。扣具採用金屬雙D扣，是國際上公認最安全的扣具。市面上常見的插扣，在撞擊時容易斷裂或彈開，造成安全帽飛脫而失去保護作用。大鏡片，採用抗UV400鏡片，同樣通過DOT安全認證，護眼又安全，用腳踩也不會破。快拆式鏡片設計，不需任何工具即可自行更換大鏡片。
                D.E.V.S. 雙重排氣系統(Dual Exhaust Venting System)，分別為前額進氣及後方負壓排氣, 提升通風效率。
                </div>
                <p>
                  <img class="notebox" src="../images/products/note/68SII.jpg">
                </p>
              </div>
           
          </p>
        </div>
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
              <button  type="submit" name="output" class="button_w">留言</button>
            </form>
            </fieldset>
            <hr>

<%
        String sqlm = "SELECT message.msgId, member.memName, message.msgContent, message.msgDate FROM message JOIN `member` ON message.memId = member.memId WHERE pdId = '27' ORDER BY message.msgId DESC;";
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