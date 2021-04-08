<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("ID") == null)
{
%>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Signin/Register</title>
      <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
    </head>
    <link rel="icon" href="/images/logo_ok.ico" />
    <style>
      /*字型*/
      @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');

      * {
        font-family: 'Noto Serif TC', serif;
      }

      html,
      body {
        background-color: whitesmoke;
        background-image: url(images/bg_img.png);
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
        width: 100%;
        height: 100vh;
      }

      .page {
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      .head {
        display: flex;

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

      /*祐晨用的css*/
      /*版面配置*/
      .content {
        width: 600px;
        height: 250px;
        margin-left: auto;
        margin-right: auto;
        background-image: url(images/text_bg.png);
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
        border-radius: 90px;
        text-align: center;
      }

      .insideleft {
        width: auto;
        height: auto;
      }

      footer {
        width: 1200px;
        text-align: center;
        color: white;
        float: left;

      }

      /*圖片*/
      .bgimg {
        /*背景圖片*/
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        width: 600px;
        height: 300px;
        margin-left: 300px;
        padding: 20px;
      }

      .bgimg2 {
        /*背景圖片*/
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        width: 400px;
        height: 270px;

      }

      hr {
        background-color: black;
        width: 1000px;
      }

      .body_text {
        /*登入/註冊分行*/
        column-rule: silver solid 1px;
        position: relative;
        margin-left: 100px;
        margin-right: 100px;
        margin-top: 25px;
        column-gap: 90px;
      }

      /* .box_bg {
        background-image: url(/images/text_bg.png);
        width: 1200px;
        height: auto;
        margin-top: 25px;

      }*/

      /*字形設定*/
      .singin_w {
        /*登入字型*/
        font-size: 48px;
        font-weight: bold;
        font-style: oblique;
      }

      button {
        column-span: all;
      }

      .e_w {
        /*英文字*/
        font-size: 32px;
      }

      .e_w_text {
        /*text內文字*/
        font-size: 25px;
        text-align: center;
      }

      /*幻燈片*/
      .list {
        list-style: none;
        border-radius: 80px;
        position: relative;
        margin-top: 10px;
        margin-bottom: 10px;
        float: left;
        margin-left: 20px;
        width: 400px;
        /*600px*/
        height: 180px;
        overflow: hidden;
      }

      .list li {
        width: 400px;
        /*600px*/
        height: 180px;
        position: relative;
        animation: myfirst 7s infinite;
        background-position: center;
      }

      @keyframes myfirst {
        0% {
          background-image: url(images/home_1.jpg);
          background-position: center;
          background-repeat: no-repeat;
          background-size: 100%;
          top: 0px;
        }

        25% {
          background-image: url(images/home_1.jpg);
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
          top: -0px;
        }

        50% {
          background-image: url(images/products/SHARK/Spartan/shark_spartan_7.jpg);
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
          top: -0px;
        }

        75% {
          background-image: url(images/products/SHOEI/x14/shoei_x14_5.jpg);
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
          top: -0px;
        }

        100% {
          background-image: url(images/home_2.jpg);
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
          top: -0px;
        }
      }
    </style>

    <body>
      <div class="page">
        <!--header_store-->
        <div class="head">

          <div class="head_logo">
            <a href="/store_1.jsp"><img src="images/logo.png" title="開始帽險"></a>
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
      </div>

      <!--會員登入-->
      <div class="content">
        <div class="insideleft">
          <div class="box_bg">
            <div class="body_text">
              <!--登入畫面-->
              <div class="singin_w ">
                Sign in 登入
              </div>
              <form action="man_logincheck.jsp" method="post" id="form3">
              <p>
                <input class="e_w_text " type="text" placeholder="Id" size="20" autocomplete="off" name="Email">
              </p>
              <p>
                <input class="e_w_text " type="password" placeholder="Password" autocomplete="off" name="Password">
              </p>
              </form>
              <p>
                <button type="submit" form="form3" name="singin">管理者登入</button>
              </p>
          </div>
        </div>
      </div>
    </div>



    </body>

    </html>


<%
}
%>