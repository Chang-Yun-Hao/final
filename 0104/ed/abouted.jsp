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
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');

  /*header_about*/
  .page {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .head {
    display: flex;
    background-color: #6C6C6C;
    position: fixed;
    width: 1200px;
    z-index: 10;
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

  /*關於我們*/
  .imglogo {
    width: 50px;
    height: 50px;
    float: left;
  }

  .body {
    width: 1000px;
    height: auto;
    float: left;
    margin-top: 150px;
  }

  .insideleft {
    width: auto;
    height: auto;
    float: left;

  }

  .insideright {
    width: auto;
    height: auto;
    float: right;

  }

  .sb10844111 {
    width: 250px;
    height: 250px;
    margin-top: 15px;
    margin-left: 15%;
    border-radius: 100%;
    text-align: center;
  }

  .sb10840147 {
    width: 250px;
    height: 250px;
    margin-top: 15px;
    margin-right: 10%;
    margin-left: 15%;
    border-radius: 100%;
    text-align: center;
  }

  .sb10844205 {
    width: 250px;
    height: 250px;
    margin-top: 15px;
    margin-left: 15%;
    border-radius: 100%;
    text-align: center;
  }

  .sb10844222 {
    width: 250px;
    height: 250px;
    margin-top: 15px;
    margin-right: 10%;
    margin-left: 15%;
    border-radius: 100%;
    text-align: center;
  }


  .imgIG1 {
    width: 50px;
    height: 50px;
    margin-top: 1px;
    float: left;
    position: relative;

    z-index: 0;
  }

  .w1 {
    text-align: center;

    font-weight: bold;
    font-size: 25px;
  }

  .w2 {
    text-align: center;

    font-size: 20px;
    left: 20px;
  }

  /*聯絡我們*/
  .contact-txt {
    color: black;
    font-size: 30pt;
    padding-bottom: 10px;
  }

  .contact-btn {
    background-color: lightgray;
    color: black;
    padding: 10px 20px;
    border: 1px solid black;
    border-radius: 5px;
    cursor: pointer;
    margin-left: 46%;
  }

  .contact-btn:hover {
    background-color: black;
    border: 1px solid lightgray;
    color: lightgray;
  }

  .contact-container {
    padding: 30px;
  }

  .contact-container label {
    padding: 3px;
    font-size: 20pt;
  }

  .contact-container input,
  .contact-container textarea {
    width: 1098px;
    display: flex;
    flex-direction: column;
    padding: 20px;
    border: 1px solid black;
    border-radius: 2px;
    margin-top: 5px;
    margin-bottom: 20px;
  }
</style>

<body>

  <div class="page">
    <!--header_about-->
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

    <!--關於我們開始-->
    <div class="content">
      <div class="body">
        <div class="insideleft">
          <img class="sb10844111" src="images/10844111.jpg">
          <div class="w1">
            邱祐晨
          </div>
          <a href="https://www.instagram.com/chiuyc_" target="_blank">
            <img class=" imgIG1" src="images/instagram.png">
          </a>
          <div class="w2">
            貓貓愛我，我愛貓貓，貓貓乃唯一真理。
          </div>
        </div>

        <div class="insideright">
          <img class="sb10840147" src="images/10840147.jpg">
          <div class="w1">
            陳薇如
          </div>
          <a href="https://www.instagram.com/weiru_1009/" target="_blank">
            <img class=" imgIG1" src="images/instagram.png">
          </a>
          <div class="w2">
            貓貓愛我，我愛貓貓，貓貓乃唯一真理。
          </div>
        </div>

        <div>
          <div class="insideleft">
            <img class="sb10844205" src="images/10844205.jpg">
            <div class="w1">
              王安琦
            </div>
            <a href="https://www.instagram.com/wang77n/" target="_blank">
              <img class=" imgIG1" src="images/instagram.png">
            </a>
            <div class="w2">
              貓貓愛我，我愛貓貓，貓貓乃唯一真理。
            </div>
          </div>

          <div class="insideright">
            <img class="sb10844222" src="images/10844222.jpg">
            <div class="w1">
              張允澔
            </div>
            <a href="https://www.instagram.com/stud_0802/" target="_blank">
              <img class=" imgIG1" src="images/instagram.png">
            </a>
            <div class="w2">
              貓貓愛我，我愛貓貓，貓貓乃唯一真理。
            </div>
          </div>
        </div>
      </div>
    </div>
    

    <!--聯絡我們開始-->
<form action="add_contact.jsp" method="post">
    <div class="contact-container">
      <p class="contact-txt">Contact us</p>

      <label>Name</label>
      <input type="text" placeholder="Your name..." name="name">

      <label>E-mail</label>
      <input type="email" placeholder="Your e-mail..." name="email">

      <label>Suggestions</label>
      <textarea placeholder="Write something..." name="sug"></textarea>

      <button type="submit" class="contact-btn">Submit</button>
    </div>
</form>

    <!--關於我們結束-->


    <!--頁尾開始-->
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