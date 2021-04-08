<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> manager_change</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous">
  </script>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="../images/logo_ok.ico" />
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
    color: white;
    float: left;
    background-color: gray;
  }

  /*文字css*/
  .h1_w {
    font-size: 36px;
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
  }

  .word1 {
    /*內文文字：價錢*/
    font-size: 30px;
    color: teal;
  }

  .word2 {
    /*內文文字：產品說明*/
    font-size: 30px;
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
    background-image: url(/images/會員_ok.png);
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
        <a href="store_1.html"><img src="../images/logo.png" style="height: 100px;width: 100px;" title="首頁"></a>
      </div>

      <div class="head_menu">
        <div class="head_link">
          <a href="store_1.html" class="link" style="border-right: 1px #B2ACAC solid">進入賣場</a>
          <a href="class.html" class="link" style="border-right: 1px #B2ACAC solid">安駕小教室</a>
          <a href="about.html" class="link">關於我們</a>
        </div>

        <div class="head_icon">
          <a href="singin&register.html"><img src="../images/會員_ok.png" title="會員登入"></a>
          <a href="shopping-cart.html"><img src="../images/購物車_ok.png" title="購物車"></a>
        </div>
      </div>
    </div>
  </div>

  <!--商品資訊-->
  <div class="content">
    <div class="insideleft">
      <div>
        <div>
          <img class="thum-img" src="../images/products/AGV/K1/agvk1_B.jpg">
        </div>
      </div>
      <div style="padding-top: 30px;">
        <input type="text" name="products_name" size="10" class="h1_w" placeholder="K1">
        <p>
          <input type="text" name="products_price" size="10" class="word1" placeholder=" NT$ 7,800">
        </p>
        <p>
          <input type="text" name="products_c" size="10" class="word1" placeholder="黑色">
        </p>

        <p>
          <input type="text" name="products_stock" size="10" class="word1" placeholder="庫存：99">
        </p>

        <p>
          <div>
            <button class="button_w" name="rechangechange"
              onclick="window.location.href = 'manager.html';">確定修改</button>
          </div>
        </p>
        <br><br><br><br>
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
          <textarea style="width: 1100px;height: 200px; margin-left: 50px;" name="msg" rows="5"></textarea>

        </p>
      </div>

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