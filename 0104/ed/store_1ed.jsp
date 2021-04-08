<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
    try
    {
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
            out.println("連線建立失敗");
        else
        {
          con.createStatement().execute("USE `ourweb`");
          String sql = "SELECT * FROM product GROUP BY pdKind";
          ResultSet rs = con.createStatement().executeQuery(sql);

          String counter="";
          counter="select * from counter";
			    ResultSet rc=con.createStatement().executeQuery(counter);

          Random ran=new Random();
          int current_adid=ran.nextInt(3)+1;
          sql="SELECT * FROM `randad` WHERE `adid`= " + current_adid;
          rs=con.createStatement().executeQuery(sql);
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" type="text/css" href="css/ad.css" />
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');

  /*header_store*/
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
    z-index: 2;
    height: 100px;
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

  /*商品選單*/
  .allmenu {
    width: 1100px;
    background-color: whitesmoke;
  }

  .menubox {
    width: 1100px;
    background-color: #3C3C3C;
    border-radius: 50px;
    margin: auto;
  }


  h1 {
    color: white;
    text-align: center;

  }

  .photo-container-1 {
    display: flex;
    flex-direction: row;

  }

  .photo-card {
    margin: 2em;
    width: 300px;
  }

  .img-description {
    color: white;
    letter-spacing: 1px;
    font-size: 18pt;
    padding-top: 10px;
  }

  .check-btn,
  .add-to-cart-btn {
    color: black;
    background-color: #F2E6E6;
    border: solid #F2E6E6;
    outline: none;
    cursor: pointer;
    font-size: 16pt;
  }

  .check-btn:hover,
  .add-to-cart-btn:hover {
    background-color: gray;
  }

  /*分頁*/
  .pagination {

    width: 1200px;
    background-color: whitesmoke;
    text-align: center;
    padding: 0 0 5px;
  }

  .pagination a {

    color: #804040;
    padding: 5px 5px;
    text-decoration: none;
    font-size: 20pt;
    font-family: Show fantasy font;
    border-radius: 10px;
    transition: background-color .3s;
  }

  .pagination a:hover {

    border-radius: 10px;
    background-color: #ddd;
  }


  /*照片輪播*/

  * {
    box-sizing: border-box;
  }

  .myslides {
    display: none;
  }

  img {
    vertical-align: middle;
  }

  /* Slideshow container */
  .slideshow-container {
    max-width: 1200px;
    position: relative;
    margin: auto;
  }

  /* Caption text */
  .text {
    color: #f2f2f2;
    font-size: 15px;
    padding: 8px 12px;
    position: absolute;
    bottom: 8px;
    width: 100%;
    text-align: center;
  }

  /* Number text (1/3 etc) */
  .numbertext {
    color: #f2f2f2;
    font-size: 12px;
    padding: 8px 12px;
    position: absolute;
    top: 0;
  }

  /* The dots/bullets/indicators */
  .dot {
    height: 15px;
    width: 15px;
    margin: 10px 10px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
  }

  .active {
    background-color: #717171;
  }

  /* Fading animation */
  .fade {
    -webkit-animation-name: fade;
    -webkit-animation-duration: 1.5s;
    animation-name: fade;
    animation-duration: 1.5s;
  }

  @-webkit-keyframes fade {
    from {
      opacity: .4
    }

    to {
      opacity: 1
    }
  }

  @keyframes fade {
    from {
      opacity: .4
    }

    to {
      opacity: 1
    }
  }

  /* On smaller screens, decrease text size */
  @media only screen and (max-width: 300px) {
    .text {
      font-size: 11px
    }
  }
</style>

<body>
  <!--進入賣場頁面-->

  <div class="page">
    <!--上方導航開始-->
    <div class="head">

      <div class="head_logo">
        <a href="index.jsp"><img src="images/logo.png" title="點擊進入帽險王首頁"></a>
      </div>

      <div class="head_menu">
        <div class="head_link">
          <a href="#goodgoods" class="link" style="border-right: 1px #B2ACAC solid">進入賣場</a>
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
    <!--上方導航結束-->

    <!--動態廣告 開始-->

    <div class="slideshow-container" style="margin-top: 120px">

      <div class="myslides fade">
        <div class="numbertext"></div>
        <img src="images/home_1.jpg " style=" width:100%">
        <div class="text">人氣商品第一名</div>
      </div>

      <div class="myslides fade">
        <div class="numbertext"></div>
        <img src="images/home_2.jpg" style="width:100%">
        <div class="text">人氣商品第二名</div>
      </div>

      <div class="myslides fade">
        <div class="numbertext"></div>
        <img src="images/home_1.jpg" style="width:100%">
        <div class="text">人氣商品第三名</div>
      </div>

    </div>
    <br>
    <!-- The dots/circles -->


    <!--動態廣告JS-->
    <script>
      var slideIndex = 0;
      showSlides();

      function showSlides() {
        var i;
        var slides = document.getElementsByClassName("myslides"); /*抓有mySlides*/

        for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none"; /*讓圖片消失*/
        }

        slideIndex++;
        if (slideIndex > slides.length) {
          slideIndex = 1
        } /*讓圖片循環*/
        slides[slideIndex - 1].style.display = "block"; /*顯示圖片*/
        setTimeout(showSlides, 4000); // Change image every 4 seconds
      }
    </script>
    <!--動態廣告 結束-->


    <!--所有產品開始-->

    <div class="allmenu">

      <div class="menubox">
        <h1><a id="goodgoods">
            所有商品
          </a></h1>

<div class="photo-container-1">
<%



    String sql1 = "SELECT * FROM product WHERE pdId<8 GROUP BY pdKind";
    ResultSet rs1 = con.createStatement().executeQuery(sql1);
    while(rs1.next())
    {
              out.println("<div class='photo-card'>");
              out.println("<a href='pd_pages/"+rs1.getString("pdKind")+".jsp'><img src='images/products/" + rs1.getString("pdBrand") + rs1.getString("pd_img_path") + "' title='點擊查看商品'></a>");

              out.println("<div class='img-description'>");
              out.println("<p class='goods-name'>"+"品牌："+rs1.getString("pdBrand")+"<br>"+rs1.getString("pdKind")+"</p>");
              out.println("<p class='goods-price'>NT$ "+rs1.getString("pdPrice")+"</p>");
              out.println("</div>");
              out.println("</div>");

    }
%>
</div>

<div class="photo-container-1">
<%

    String sql2 = "SELECT * FROM product WHERE pdId>=10 AND pdId<=16 GROUP BY pdKind";
    ResultSet rs2 = con.createStatement().executeQuery(sql2);
    while(rs2.next())
    {
          
          
              out.println("<div class='photo-card'>");
              out.println("<a href='pd_pages/"+rs2.getString("pdKind")+".jsp'><img src='images/products/" + rs2.getString("pdBrand") + rs2.getString("pd_img_path") + "' title='點擊查看商品'></a>");

              out.println("<div class='img-description'>");
              out.println("<p class='goods-name'>"+"品牌："+rs2.getString("pdBrand")+"<br>"+rs2.getString("pdKind")+"</p>");
              out.println("<p class='goods-price'>NT$ "+rs2.getString("pdPrice")+"</p>");
              out.println("<br>");
              out.println("</div>");
              out.println("</div>");

    }

%>
</div>

<div class="photo-container-1">
<%

    String sql3 = "SELECT * FROM product WHERE pdId>=18 AND pdId<=24 GROUP BY pdKind";
    ResultSet rs3 = con.createStatement().executeQuery(sql3);
    while(rs3.next())
    {
          
          
              out.println("<div class='photo-card'>");
              out.println("<a href='pd_pages/"+rs3.getString("pdKind")+".jsp'><img src='images/products/" + rs3.getString("pdBrand") + rs3.getString("pd_img_path") + "' title='點擊查看商品'></a>");

              out.println("<div class='img-description'>");
              out.println("<p class='goods-name'>"+"品牌："+rs3.getString("pdBrand")+"<br>"+rs3.getString("pdName")+"</p>");
              out.println("<p class='goods-price'>NT$ "+rs3.getString("pdPrice")+"</p>");
              out.println("<br>");
              out.println("</div>");
              out.println("</div>");

    }

%>
</div>
      </div>
    </div>

    <!--所有產品結束-->


    <!--分頁開始-->
    <div class="pagination">
      <a href="store_1.jsp"><i class="fas fa-angle-double-left"></i></a>
      <a href="store_1.jsp">1</a>
      <a href="store_2.jsp">2</a>
      <a href="store_2.jsp"><i class="fas fa-angle-double-right"></i></a>
    </div>
    <!--分頁結束-->

    <!--頁尾-->
    <footer>
      <div>

        <img src="images/logo_index.png" style="width: 150px;height: 150px;float: left;margin-left: 20px; padding: 35px;">
        <div style="text-align: center; float: left;margin-top: 35px;margin-left: 290px;padding: 35px;">
          頭戴安全帽，安全有一套
          <%
          if(session.getAttribute("ID")!= null || session.getAttribute("mID")!= null)
          {
            out.println("<a href='logout.jsp'>登出</a>");
          }
          %>
          <br>
<%

            if (rc.next()){
                String countString = rc.getString(1);
                int count = Integer.parseInt(countString);
                if (session.isNew())
                {
                    count++;
                    counter="UPDATE counter SET counter = " + count ;
                    con.createStatement().execute(counter);
                }
            out.println("您是第"+count+"位訪客！！");
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

        <%

        while (rs.next()) //只有一筆資料
        {
          out.println("<a href='https://"+rs.getString(4)+"' target='_blank'>");
          out.println("<img src='"+rs.getString(2)+"/"+rs.getString(3)+"'");
          out.println(" alt='"+rs.getString(5)+"'></a>");
        }

        %>


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
<%
    con.close();
}
	}
    catch (SQLException sExec)
    {
        out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err)
{
   out.println("class錯誤"+err.toString());
}
%>