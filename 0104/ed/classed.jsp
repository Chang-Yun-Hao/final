<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');


  /*header_class*/
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

  /*側邊選單*/
  .stay-left {
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    z-index: 3;
  }

  * {
    margin: 0;
    padding: 0;
    list-style: none;
    font-family: 'Noto Serif TC', serif;
  }

  html,
  body {
    height: auto;
    background-color: whitesmoke;
  }

  .side-menu {
    width: 300px;
    height: 100%;
    padding: 20px 0;
    box-sizing: border-box;
    background-color: lightgray;
    display: flex;
    flex-direction: column;
    box-shadow: 5px 0px 10px gray;
    position: relative;

    /*被移動出去*/
    transform: translate(-100%);
  }

  .side-menu form {
    display: flex;
    margin: 0 30px 50px;
    border-radius: 100px;
    border: 3px solid white;

  }

  .side-menu form input,
  .side-menu form button {
    border: none;
    background-color: transparent;
    color: white;
    padding: 5px;
  }

  .side-menu form input {
    width: 230px;
  }

  .side-menu form button {
    width: 50px;

  }

  .side-menu form input:focus,
  .side-menu form button:focus {
    outline: none;

  }

  .side-menu label {
    position: absolute;
    width: 40px;
    height: 80px;
    color: white;
    background-color: black;
    border-radius: 0 10px 10px 0;


    /*絕對定位垂直置中*/
    right: -40px;
    top: 0;
    bottom: 0;
    margin: auto;

    line-height: 80px;
    text-align: center;
    font-size: 30px;

    /*整個選單移動動畫*/
    transition: .5s;
  }

  /*check box 被消失*/
  #side-menu-switch {
    position: absolute;
    opacity: 0;
    z-index: -1;
  }

  /*menu移動進來*/
  #side-menu-switch:checked+.side-menu {
    transform: translateX(0);
  }

  /*箭頭動畫*/
  #side-menu-switch:checked+.side-menu label .fa-angle-right {
    transform: scale(-1);
  }

  .nav a {
    display: block;
    padding: 10px;
    color: black;
    text-decoration: none;
    position: relative;

  }

  /*白線位置*/
  .nav li+li a::before {
    content: '';
    position: absolute;
    border-bottom: white 2px solid;
    left: 5px;
    right: 20px;
    top: 0;
  }


  /*Q&A*/
  h1 {
    text-align: center;
    font-size: 50px;
    margin-bottom: 20px;
  }

  .accordion {
    width: 1200px;
    color: black;
    background-color: whitesmoke;
    cursor: pointer;
    padding: 18px;

    display: flex;
    align-items: center;
    border: none;
    outline: none;
    font-size: 30px;
    text-align: left;
    transition: 0.4s;
  }


  .panel {
    display: none;
    background-color: lightgray;
    overflow: hidden;
    font-size: 25px;
    width: 1200px;
  }

  .panel iframe {
    margin: 10px 50px 10px 50px;
  }

  .active,
  .accordion:hover {
    background-color: lightgray;
  }
</style>

<body>
  <div class="page">
    <!--header_class-->
    <div class="head">

      <div class="head_logo">
        <a href="store_1.jsp"><img src="images/logo.png" title="開始帽險"></a>
      </div>

      <div class="head_menu">
        <div class="head_link">
          <a href="store_1.jsp" class="link" style="border-right: 1px #B2ACAC solid">進入賣場</a>
          <a href="class.jsp" class="link" style="border-right: 1px #B2ACAC solid">安駕小教室</a>
          <a href="about.jsp" class="link" style="border-right: 1px #B2ACAC solid">關於我們</a>
          <%
          if(session.getAttribute("mID")!= null)
          {
            out.println("<a href='manager.jsp' class='link'>賣場管理</a>");
          }
          %>
        </div>

        <div class="head_icon">
          <a href="singin&register.jsp"><img src="images/會員_ok.png" title="會員登入"></a>
          <a href="shopping-cart.jsp"><img src="images/購物車_ok.png" title="購物車"></a>
        </div>

      </div>



    </div>

    <!--QA時間 開始-->

    <div>

      <br>
      <br>
      <br>
      <br>
      <br>
      <div style="width: 1200px;">
        <h1>常見問題</h1>

        <button class="accordion" style="width: 100%;">Q1 :安全帽尺寸怎麼挑？</button>
        <div class="panel">

          <img src="images/class_1.jpg" style="width: 1200px;">
          <pre>
      安全帽的尺寸不只會影響包覆性，也會影響舒適度和安全性。
      尺寸過大，代表安全帽與頭部之間留有空隙，
      無法提供完整的防護性；尺寸過小則會造成頭部不適。

      影響安全帽包覆性的主要因素有三個：帽體大小，保麗龍大小以及內襯厚度。

        
      因為三者通常是配對好的，所以在大部份情況下，前兩項可以忽略，只需要注意內襯厚度即可。
      如下圖AF-1尺寸表

      在選擇內襯前，我們需要知道兩個小知識
      ① 內襯分為「頭襯 (頭頂內襯)」及 「兩頰 (兩頰內襯) 」
      ② 頭襯跟兩頰的尺寸是分開的，所以訂購時必須選擇各別的尺寸

      接下來我們只需要做三件事
      ① 測量自己的頭圍，如下圖範例
      ② 從頭圍找出自己適合的頭襯尺寸
      ③ 從尺寸表中，以自己的頭襯尺寸找出建議的兩頰尺寸。
      </pre>
          <img src="images/class_2.png" style="width: 1200px;">
          <br>
        </div>

        <button class="accordion" style="width: 100%;">Q2 :為何不賣半罩安全帽 ?</button>
        <div class="panel">
          <pre>
      我們不能預知何時出車禍，但可以選擇發生車禍時如何將傷害降到最低。
      不同於汽車有較完整的保護，機車只能仰賴穿戴人身部品，其中最基本的就是安全帽。
      許多人戴安全帽只是為了不被罰錢，而選擇最便宜的「瓜皮帽」
      但這種安全帽保護性最低，一旦發生車禍，後果不堪設想!
      </pre>

          <iframe width="1120" height="630" src="https://www.youtube.com/embed/A3l9595ZkYU" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen></iframe>
        </div>

        <button class="accordion" style="width: 100%;">Q3 :如何挑選安全帽，怎麼挑最安全？</button>
        <div class="panel">
          <pre>
      在尚未騎車上路前，我們先檢視自己準備好了沒，機車專屬的安全知識就從保護自己開始。
      那要如何保護自己呢？第一步就先從選擇合適的人身部品來保護自己的行車安全吧！
      </pre>

          <iframe width="1120" height="630" src="https://www.youtube.com/embed/ib0jMhEjk8k" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen></iframe>
        </div>

      </div>
    </div>

    <script>
      var acc = document.getElementsByClassName("accordion");
      var i;

      for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
          this.classList.toggle("active");
          var panel = this.nextElementSibling;
          if (panel.style.display === "block") {
            panel.style.display = "none";
          } else {
            panel.style.display = "block";
          }
        });
      }
    </script>
    <!--QA時間 結束-->

    <!--頁尾-->
    <footer>
      <div>

        <img src="images/logo_index.png"
          style="width: 100px;height: 100px;float: left;margin-left: 20px; padding: 35px;">
        <div style="text-align: center; float: left;margin-top: 35px;margin-left: 290px;padding: 35px;">
          頭戴安全帽，安全有一套
          <%
if(session.getAttribute("ID")!= null || session.getAttribute("mID")!= null)
          {
            out.println("<a href='logout.jsp'>登出</a>");
          }
          %>
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

  <!--側邊欄開始-->
  <div class="stay-left">

    <input type="checkbox" id="side-menu-switch">

    <div class="side-menu">
      <form action="add_search.jsp" method="post">
        <input type="search" placeholder="請輸入關鍵字" name="search" value="">
        <button><i class="fas fa-search"></i></button>
      </form>

      <ul class="nav">

        <ul>
          <h2>AGV</h2>
          <li><a href="pd_pages/K1.jsp">K1</a></li>
          <li><a href="pd_pages/K3SV.jsp">K3SV</a></li>
          <li><a href="pd_pages/K5.jsp">K5</a></li>
          <li><a href="pd_pages/Pista GP RR.jsp">Pista GP RR</a></li>
        </ul>

        <ul>
          <h2>SHOEI</h2>
          <li><a href="pd_pages/x14.jsp">x14</a></li>
          <li><a href="pd_pages/RF-1200.jsp">RF-1200</a></li>
          <li><a href="pd_pages/GT-Air II.jsp">GT-Air II</a></li>
        </ul>
        <ul>
          <h2>Shark</h2>
          <li><a href="pd_pages/Skwal 2.jsp">Skwal 2</a></li>
          <li><a href="pd_pages/Spartan.jsp">Spartan</a></li>
          <li><a href="pd_pages/Race R Pro.jsp">Race R Pro</a></li>
        </ul>
        <ul>
          <h2>SOL</h2>
          <li><a href="pd_pages/SF-2.jsp">SF-2</a></li>
          <li><a href="pd_pages/SF-3.jsp">SF-3</a></li>
          <li><a href="pd_pages/SF-6.jsp">SF-6</a></li>
          <li><a href="pd_pages/68SII.jsp">68SII</a></li>
        </ul>

        <ul>
          <h2>騎士配件</h2>
          <li><a href="pd_pages/recoder.jsp">行車紀錄器</a></li>
          <li><a href="pd_pages/earphone.jsp">耳機</a></li>
          <li><a href="pd_pages/raincoat.jsp">雨衣</a></li>
        </ul>

      </ul>

      <label for="side-menu-switch">
        <i class="fas fa-angle-right"></i>
      </label>
    </div>
  </div>
  <!--側邊欄結束-->

</body>

</html>