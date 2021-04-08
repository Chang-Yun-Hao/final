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
            String sqlP = "SELECT * FROM product WHERE pdKind = 'Skwal 2' GROUP BY pdKind";
            ResultSet rsP = con.createStatement().executeQuery(sqlP);
            String ID="" ,PRICE="" ,NAME="";
            while(rsP.next())
            {
              ID = rsP.getString("pdId");
              PRICE = rsP.getString("pdPrice");
              NAME = rsP.getString("pdKind");
            }

            String sqlS1 = "SELECT * FROM product WHERE pdId = '24' ";
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
  <title>Skwal 2</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous">
  </script>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="/images/logo_ok.ico" />
<style>
  .page {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .head {
    display: flex;
    background-color: #6C6C6C;
    width: 1200px;

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

  .side-menu {
    width: 300px;
    height: auto;
    display: flex;
    flex-direction: column;
    background-color: gray;
  }

  nav {
    display: block;
    padding: 10px;
    color: black;
  }

  /*內容的css*/
  .content {
    width: 1200px;
    margin-left: auto;
    margin-right: auto;
  }

  .box1 {
    width: 1200px;
    height: 500px;
    background-color: rgba(0, 0, 0, 0.89);
  }


  .insideleft {
    /*裡面的排版*/
    width: auto;
    height: auto;
  }

  footer {
    width: 1200px;
    text-align: center;
    font-family: 微軟正黑體;
    color: white;
    float: left;
    background-color: gray;
  }

  /*文字css*/
  .h1_w {
    font-size: 36px;
    font-family: 微軟正黑體;
    font-weight: bold;
  }

  .button_w {
    font-size: 30px;
    text-align: center;
    margin-top: 20px;
  }

  .word {
    /*內文文字：顏色選取*/
    font-size: 30px;
    font-family: 微軟正黑體;
  }

  .word1 {
    /*內文文字：價錢*/
    font-size: 30px;
    font-family: 微軟正黑體;
    color: teal;
  }

  .word2 {
    /*內文文字：產品說明*/
    font-size: 30px;
    font-family: 微軟正黑體;
    text-align: center;
  }

  .star {
    /*星星*/
    color: gold;
    margin-left: 50px;
  }

  .button_ddd {
    /*按鈕+-的排版*/
    margin-left: 10px;

  }

  .button_pay {
    /*按鈕直接買的排版*/
    margin-left: 50px;

  }

  /*留言板*/
  .msg {
    margin: 20px 0;
    min-height: 70px;
    display: flex;
  }

  .msg_img {
    min-width: 50px;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    background: #e4f0fb;
    background-image: url(/images/user.png);
    background-position: center;
    background-size: 100px;
  }

  .msg__body {
    margin-left: 10px;
  }

  .msg__content {
    margin-top: 10px;
    max-width: 100%;
    font-size: 18px;
    margin-left: 15px;
  }

  .msg__author {
    color: #5c9edc;
    font-weight: bold;
    font-size: 28px;
    margin-left: 15px;
  }

  .msg__time {
    color: #a0a0a0;
    font-size: 28px;
  }

  /*彈跳視窗*/
  #modal {
    display: none;
  }

  .modal {
    margin-left: 250px;
    width: 700px;
    height: 600px;
    z-index: 1;
  }

  .modal img {
    animation-name: zoom;
    animation-duration: 0.6s;
    padding: 10px;
    margin: auto;
    max-width: 100%;
    max-height: 100%;
    box-shadow: 0 2px 6px rgb(0, 0, 0, 0.2), 0 10px 20px rgb(0, 0, 0, 0.2);
    border-radius: 12px;
    border: 1px solid black;
  }

  @keyframes zoom {
    from {
      transform: scale(0.1)
    }

    to {
      transform: scale(1)
    }
  }

  .thum-img {
    float: left;
    width: 400px;
    height: 400px;
    margin-right: 50px;
    float: left;
  }

  /*點擊按鈕更換圖片*/

  .box2 {
    width: 400px;
    height: 400px;
    position: absolute;
    margin-right: 50px;
    float: left;
    display: none;
  }

  div:target {
    display: block;
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
          <a href="../singin&register.jsp"><img src="../images/會員_ok.png" title="會員登入"></a>
          <a href="../shopping-cart.jsp"><img src="../images/購物車_ok.png" title="購物車"></a>
        </div>
      </div>
    </div>
  </div>

  <!--商品資訊-->
  <div class="content">
    <div class="insideleft">
      <div>
        <!--點擊商品會放大-->
        <div style="position:fixed;width:100%;height:100%;z-index: 2;" id="modal">
          <div class="modal" id="modalw">
            <img id="bgImg" />
          </div>
        </div>
<%
    String sql1 = "SELECT * FROM product WHERE pdId=24 GROUP BY pdKind";
    ResultSet rs1 = con.createStatement().executeQuery(sql1);
    while(rs1.next())
    {
      out.println("<div>");
      out.println("<img onclick='showBgImg(this)' class='thum-img' src='../images/products/" + rs1.getString("pdBrand") + rs1.getString("pd_img_path")+ "'>");
      out.println("</div>");
    }

    String sql2 = "SELECT * FROM product WHERE pdKind=' Skwal 2'";
    ResultSet rs2 = con.createStatement().executeQuery(sql2);
    int i=1;
    while(rs2.next())
    {
      out.println("<div class='box2' id='img"+i+"'><img src='../images/products/" + rs2.getString("pdBrand") + rs2.getString("pd_img_path") + "' class='thum-img' onclick='showBgImg(this)' />");
      out.println("</div>"); 
      i+=1;
    }
%>
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
            <i class="fas fa-star star"> 4.9</i>
          </div>

        </p>
        <p>
          <div class="word">顏色選取：
            <a href="#img1"> <button name=" Skwal 2" class="button_w" disabled>Logo款</button></a>
          </div>
        </p>
        <p>
          <div class="word">
<form action="../add_shopping-cart.jsp" method="post"> 
          數量：<input type="number" name="number" min="1" value="1" style="width: 10%;" class="button_w button_ddd " />
          剩餘數量：<span style="color: red;margin-left: 20px;font-size: 30px;" id="Stocknumber"><%=STOCK1%></span>
          </div>
<input type="hidden" name="pdid" value="<%=ID%>">
        </p>
        <p>
          <div>
            <button class="button_w" type="submit" name="add to Shopping Cart">加入購物車</button> 
            <button class="button_w button_pay" name="Checkout">直接結帳</button>
</form>

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
            <p>
              <img src="/AGV/K1/agvk1_W.jpg" class="thum-img" style="height: 300px;width: 300px;">
            </p>

            <div class="word" style="background-color:white">白色的帽帽恩....要一起想產品說明的文案呀?</div>
          </div>



        </p>
      </div>
      <div class="insideleft">
        <form action="../add_message.jsp" method="post" >
        <input type="hidden" name="PDID" value="<%=ID%>">  <!--傳到後端-->
          <fieldset>
            <legend class="h1_w">留言板</legend>
            <textarea style="width: 1100px;height: 200px;" name="msg" rows="5"></textarea><br>
            <button type="submit" name="output" class="button_w">留言</button>
            </form>
          </fieldset>
          <hr>

<%
        String sqlm = "SELECT message.msgId, member.memName, message.msgContent, message.msgDate FROM message JOIN `member` ON message.memId = member.memId WHERE pdId = '24' ORDER BY message.msgId DESC;";
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

      <%--<div>
            <div class="msg">
              <div class="msg_img">
              </div>
              <div class="mag__body">
                <div class="msg__info">
                  <span class="msg__author">巴巴</span>
                  <span class="msg__time">2020-12-26 </span>
                </div>
                <p class="msg__content">
                  咪咪咪！
                </p>
              </div>
            </div>
          </div> --%>

      </div>
    </div>    

    <footer>
      <div>

        <img src="../images/logo_index.png" style="width: 80px;height: 80px;float: left;margin-left: 20px;">
        <div style="text-align: center; float: left;margin-top: 35px;margin-left: 430px;">
          我愛貓貓，貓貓愛我
        </div>
        <div style="text-align: center; float: right;margin-top: 5px;margin-right: 20px;">
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
		}
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>