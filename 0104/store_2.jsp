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
  <title>Store</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" type="text/css" href="css/ad.css" />
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');
  @import url(css/slide-show.css);
  @import url(css/ad.css);
  @import url(css/store-menu.css);
  @import url(css/store.css);
  @import url(css/all.css);
  /*<!--2021.1.5 new-->*/

  /*header_store*/
  * {
    font-family: 'Noto Serif TC', serif;
  }

  /*右側邊選單
   <!--2021.1.6 new-->*/
  .stay-right {
    position: absolute;
    top: 100px;
    right: 500px;
    height: auto;
    z-index: 3;
  }

  .side-menu-2 {
    width: 300px;
    height: auto;
    margin-left: 180px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    box-shadow: 5px 0px 10px gray;
    position: fixed;

  }

  .btn-x {
    width: 25px;
    height: 25px;
    border-radius: 360px;
    opacity: 0.5;
    text-align: center;
    outline: none;
  }
</style>

<body>
  <!--進入賣場頁面-->

  <div class="page">
    <!--上方導航開始-->
    <div class="head">

      <div class="head_logo">
        <a href="/index.jsp"><img src="images/logo.png" title="點擊進入帽險王首頁"></a>
      </div>

      <div class="head_menu">
        <div class="head_link">
          <a href="#goodgoods" class="link" style="border-right: 1px #B2ACAC solid">進入賣場</a>
<%
          if(session.getAttribute("mID")== null)
          {
            out.println("<a href='class.jsp' class='link' style='border-right: 1px #B2ACAC solid'>安駕小教室</a>");
          }
          if(session.getAttribute("mID")== null)
          {
            out.println("<a href='about.jsp' class='link'>關於我們</a>");
          }
          if(session.getAttribute("mID")!= null)
          {
            out.println("<a href='manager.jsp' class='link' style='border-right: 1px #B2ACAC solid'>賣場管理</a>");
          }
          if(session.getAttribute("mID")!= null)
          {
            out.println("<a href='check_order.jsp' class='link'>追蹤訂單</a>");
          }
%>
        </div>

        <div class="head_icon">
          <a href="singin&register.jsp"><img src="images/會員_ok.png" title="會員登入" style="margin-right: 15px;"></a>
          <a href="shopping-cart.jsp"><img src="images/購物車_ok.png" title="購物車"></a>
        </div>
        <%
          if(session.getAttribute("ID")!= null || session.getAttribute("mID")!= null)
          {
            out.println("<span class='signout'><i class='fas fa-sign-out-alt'><a href='logout.jsp' style='text-decoration:none;color:white;'>登出</a></i></span>");
          }
        %>
      </div>
    </div>
    <!--上方導航結束-->

    <!--動態廣告 開始-->


<div class="slideshow-container" style="margin-top: 120px">

      <div class="myslides fade">
        <div class="numbertext"></div>
        <a href="pd_pages/K5.jsp">
          <img src="images/hot/4.jpg" style=" width:1000px;">
        </a>
        <!--<div class="text">人氣商品第一名</div>-->
      </div>

      <div class="myslides fade">
        <div class="numbertext"></div>
        <a href="pd_pages/Spartan.jsp">
          <img src="images/hot/5.jpg" style=" width:1000px;">
        </a>
        <!--<div class="text">人氣商品第二名</div>-->
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
            String sql1 = "SELECT * FROM product WHERE pdId>=25 AND pdId<=28 GROUP BY pdKind";
            ResultSet rs1 = con.createStatement().executeQuery(sql1);
            while(rs1.next())
            {
                out.println("<div class='photo-card'>");
                out.println("<a href='pd_pages/"+rs1.getString("pdKind")+".jsp'><img src='images/products/" + rs1.getString("pdBrand") + rs1.getString("pd_img_path") + "' title='點擊查看商品'></a>");

                out.println("<div class='img-description'>");
                out.println("<p class='goods-name'>"+"品牌："+rs1.getString("pdBrand")+"<br>"+rs1.getString("pdKind")+"</p>");
                out.println("<p class='goods-price'>NT$ "+rs1.getString("pdPrice")+"</p>");
                out.println("<br>");
                out.println("</div>");
                out.println("</div>");
            }
        %>
        </div>


        <div class="photo-container-1">
        <%
        String sql2 = "SELECT * FROM product WHERE pdId>=29 AND pdId<=30 GROUP BY pdKind";
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

        <%
        String sql3 = "SELECT * FROM product WHERE pdId=48 GROUP BY pdKind";
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
        <div class="photo-container-1">
        <%
        String sql4 = "SELECT * FROM product WHERE pdId>=49 AND pdId<=50 GROUP BY pdKind";
        ResultSet rs4 = con.createStatement().executeQuery(sql4);
        while(rs4.next())
        {
            out.println("<div class='photo-card'>");
            out.println("<a href='pd_pages/"+rs4.getString("pdKind")+".jsp'><img src='images/products/" + rs4.getString("pdBrand") + rs4.getString("pd_img_path") + "' title='點擊查看商品'></a>");

            out.println("<div class='img-description'>");
            out.println("<p class='goods-name'>"+"品牌："+rs4.getString("pdBrand")+"<br>"+rs4.getString("pdName")+"</p>");
            out.println("<p class='goods-price'>NT$ "+rs4.getString("pdPrice")+"</p>");
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
  </div>
  <!--右側邊欄開始-->
  <!--2021.1.6 new-->
  <div class="stay-right">
    <div class="side-menu-2">
    
<%
      while (rs.next()) //只有一筆資料
      {
          out.println("<img src='images/AD1.jpg' style='width: 300px;height: 150PX;'>");
          out.println("<img src='images/SALE2.gif' style='width: 300px;height: 150PX;'>");
          out.println("<a href='https://ydcrider.tw/helmets/' target='_blank'>");
          out.println("<img src='images/SHOEIAD3.jpg' style='width: 300px;height:90PX;'>");

          out.println("<a href='https://"+rs.getString(4)+"' target='_blank'>");
          out.println("<img src='"+rs.getString(2)+"/"+rs.getString(3)+"'style='width: 300px;height: 380PX;'");
          out.println(" alt='"+rs.getString(5)+"'></a>");
      }
%>

    </div>
  </div>
  <!--右側邊欄結束-->


  <!--2021.1.5 new-->
  <!--側邊欄開始-->
  <div class="stay-left">
    <!--有改這邊_1231_new-->

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