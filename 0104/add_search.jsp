<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
            sql="use `ourweb`";
            con.createStatement().execute(sql);
            String new_search=new String(request.getParameter("search").getBytes("ISO-8859-1"),"UTF-8");
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
    sql = "SELECT * FROM product WHERE CONCAT(IFNULL(`pdBrand`,''),IFNULL(`pdKind`,''),IFNULL(`pdName`,'')) LIKE '%"+new_search+"%' GROUP BY pdKind";  
    ResultSet rs =con.createStatement().executeQuery(sql);
    boolean flag = true;


    while(rs.next())
    {
        flag = false;
        out.println("<div class='photo-card'>");
        out.println("<a href='pd_pages/"+rs.getString("pdKind")+".jsp'><img src='images/products/" + rs.getString("pdBrand") + rs.getString("pd_img_path") + "' title='點擊查看商品'></a>");

        out.println("<div class='img-description'>");
        out.println("<p class='goods-name'>"+"品牌："+rs.getString("pdBrand")+"<br>"+rs.getString("pdKind")+"</p>");
        out.println("<p class='goods-price'>NT$ "+rs.getString("pdPrice")+"</p>");
        out.println("</div>");
        out.println("</div>");

    }
    if(flag){
            out.println("<SCRIPT LANGUAGE='JavaScript'>");
            out.println("alert('查無資料')");
            out.println("history.back();");
            out.println("</SCRIPT>");
            con.close();
         }
%>
</div>

      </div>
    </div>

    <!--所有產品結束-->


    <!--分頁開始-->
    <%-- <div class="pagination">
      <a href="store_1.jsp"><i class="fas fa-angle-double-left"></i></a>
      <a href="store_1.jsp">1</a>
      <a href="store_2.jsp">2</a>
      <a href="store_2.jsp"><i class="fas fa-angle-double-right"></i></a>
    </div> --%>
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
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
          //response.sendRedirect("signin&register.jsp");
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