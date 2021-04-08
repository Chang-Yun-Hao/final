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

          String counter="";
          counter="select * from counter";
			    ResultSet rc=con.createStatement().executeQuery(counter);

%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>

</head>
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');
  @import url(css/slide-show.css);
  @import url(css/class.css);
  @import url(css/head.css);
  @import url(css/animation.css);
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
          <%
          if(session.getAttribute("mID")== null)
          {
            out.println("<a href='about.jsp' class='link'>關於我們</a>");
          }
          if(session.getAttribute("mID")!= null)
          {
            out.println("<a href='manager.jsp' class='link'>賣場管理</a>");
          }
          %>
        </div>

        <div class="head_icon">
          <a href="singin&register.jsp"><img src="images/會員_ok.png" title="會員登入" style="margin-right: 15px;"></a>
          <a href="shopping-cart.jsp"><img src="images/購物車_ok.png" title="購物車"></a>
          <%
          if(session.getAttribute("ID")!= null || session.getAttribute("mID")!= null)
          {
            out.println("<span class='signout'><i class='fas fa-sign-out-alt'><a href='logout.jsp' style='text-decoration:none;color:white;'>登出</a></i></span>");
          }
        %>
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
         <a href="https://www.cycu.edu.tw/" target="_blank">https://www.cycu.edu.tw/</a>
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
          <li><a href="products/K1.jsp">K1</a></li>
          <li><a href="products/K3SV.jsp">K3SV</a></li>
          <li><a href="products/K5.jsp">K5</a></li>
          <li><a href="products/Pista GP RR.jsp">Pista GP RR</a></li>
        </ul>

        <ul>
          <h2>SHOEI</h2>
          <li><a href="products/x14.jsp">x14</a></li>
          <li><a href="products/RF-1200.jsp">RF-1200</a></li>
          <li><a href="products/GT-Air II.jsp">GT-Air II</a></li>
        </ul>
        <ul>
          <h2>Shark</h2>
          <li><a href="products/Skwal 2.jsp">Skwal 2</a></li>
          <li><a href="products/Spartan.jsp">Spartan</a></li>
          <li><a href="products/Race R Pro.jsp">Race R Pro</a></li>
        </ul>
        <ul>
          <h2>SOL</h2>
          <li><a href="products/SF-2.jsp">SF-2</a></li>
          <li><a href="products/SF-3.jsp">SF-3</a></li>
          <li><a href="products/SF-6.jsp">SF-6</a></li>
          <li><a href="products/68SII.jsp">68SII</a></li>
        </ul>

        <ul>
          <h2>騎士配件</h2>
          <li><a href="products/recoder.jsp">行車紀錄器</a></li>
          <li><a href="products/earphone.jsp">耳機</a></li>
          <li><a href="products/raincoat.jsp">雨衣</a></li>
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