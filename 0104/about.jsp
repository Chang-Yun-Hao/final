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
  <title>About us</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');
  @import url(css/slide-show.css);
  @import url(css/contact-us.css);
  @import url(css/about.css);
  @import url(css/animation.css);
  /*header_about*/

  * {
    font-family: 'Noto Serif TC', serif;
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

     <!--關於我們開始-->
    <!--2021.1.9-->
    <div class="content">
      <div class="body">
        <div class="photo-container-1">

          <div class="photo-card">

            <img src="images/10844111.jpg" class="img_sb ">
            <div class="img-description">
              <p class="goods-name">邱祐晨</p>
              <p class="goods-price">
                <div class="d4">
                  <div class="card">
                    <div class="front">
                      透過了此次的專案，我理解光鮮亮麗的網站背後注入了多少心血，可能會發生口角爭執只因每個人都有不同的想法都為了讓網頁看得更加實用、互動性高、版面配置的精美度。製作者們不斷的摩合、討論，得出了最完美的作品。
                      我相信此次的專案是我大學四年都忘不了的回憶，每一步步都是通往成功的基石。
                    </div>
                  </div>
                </div>
              </p>
              <a href="https://www.instagram.com/chiuyc_" target="_blank">
                <img class=" imgIG1" src="images/instagram.png">
              </a>
              <br>
            </div>



          </div>

          <div class="photo-card">

            <img src="images/10840147.jpg" class="img_sb">
            <div class="img-description">
              <p class="goods-name"> 陳薇如</p>
              <p class="goods-price">
                <div class="d4">
                  <div class="card">
                    <div class="front">
                      這學期裡我學到了很多，也很充實，從一開始完全不了解網頁的架構到現在我已經能夠打出超過四百多行的程式，並拚出一個簡單的網頁，這讓我很有成就感。雖然如此，還是有地方需要加強與精進。
                      像是在做期末專案時，如果沒有老師新給的那些參考資料的話，我根本也想不到有那麼多的方式可以運用及呈現
                    </div>
                  </div>
                </div>
              </p>
              <a href="https://www.instagram.com/weiru_1009/" target="_blank">
                <img class=" imgIG1" src="images/instagram.png">
              </a>
              <br>
            </div>

          </div>
        </div>
        <br>
        <br>
        <div class="photo-container-1">

          <div class="photo-card">
            <img src="images/10844205.jpg" class="img_sb">
            <div class="img-description">
              <p class="goods-name"> 王安琦</p>
              <p class="goods-price">
                <div class="d4">
                  <div class="card">
                    <div class="front">
                      網路程式設計這堂課學到的並不侷限於書本知識裡，而是透過許多練習並且搭配上課所教導的觀念來整合，做出這次的期末網站。除此之外，我認為更重要的是團隊溝通，
                      如果沒有合作的能力，再多的想法都只是空談而已。從第一次開會紀錄到期末專案的報告，我覺得從無到有是一個很令人感動的事情，很謝謝老師的教導以及隊友們的努力。
                    </div>
                  </div>
                </div>
              </p><a href="https://www.instagram.com/wang77n/" target="_blank">
                <img class=" imgIG1" src="images/instagram.png">
              </a>
              <br>
            </div>
          </div>

          <div class="photo-card">
            <img src="images/10844222.jpg" class="img_sb">
            <div class="img-description">
              <p class="goods-name"> 張允澔</p>
              <p class="goods-price">
                <div class="d4">
                  <div class="card">
                    <div class="front">
                     網程這堂課可以說是大二的重頭戲，要學會寫網頁的後端就必須連前端也看得懂，還記得第一次拉介面畫表格，怎麼嘗試都不斷失敗，到後來的可以前端程式一丟來就能馬上修改調整，
                     那種成就感令人感到興奮。期中後接觸到資料庫，學了很多sql語法，其中不少都是靠自己上網查，這堂課真正考驗的是自學的能力。
                    </div>
                  </div>
                </div>
              </p>
              <a href="https://www.instagram.com/stud_0802/" target="_blank">
                <img class=" imgIG1" src="images/instagram.png">
              </a>
              <br>
            </div>
          </div>

        </div>


      </div>
    </div>
    <!--2021.1.9-->
    <!--關於我們結束-->

    <!--聯絡我們結束-->
<form action="add_contact.jsp" method="post">
    <div class="contact-container">
      <p class="contact-txt">Contact us</p>

      <label>Name</label>
      <input type="text" placeholder="Your name..." name="name">

      <label>E-mail</label>
      <input type="email" placeholder="Your e-mail..." name="email">

      <label>Suggestions/Opinions</label>
      <textarea placeholder="Write something..." name="sug"></textarea>

      <button type="submit" class="contact-btn">Submit</button>
    </div>
</form>


    <!--頁尾開始-->
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