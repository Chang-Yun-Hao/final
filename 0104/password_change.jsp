<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
              if(session.getAttribute("ID")!=null)
              {
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>password_change</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');

  * {
    font-family: 'Noto Serif TC', serif;
  }

  html,
  body {
    background-color: whitesmoke;
  }

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


  /*祐晨用的css*/
  /*版面配置*/
  .content {
    width: 1200px;
    margin-left: auto;
    margin-right: auto;

  }

  .insideleft {
    width: auto;
    height: auto;
    background-color: rgba(208, 213, 199, 0.796);
  }

  .textinside {
    width: auto;
    height: auto;
    margin-left: 250px;
    margin-right: 250px;
    text-align: left;
    padding: 20px;
    background-color: white;
  }

  footer {
    width: 1200px;
    text-align: center;
    font-family: 微軟正黑體;
    color: white;
    float: left;
    background-color: gray;
  }

  /*圖片*/
  .bgimg {
    /*背景圖片*/
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    width: 600px;
    height: 300px;
    border-radius: 90px;
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
    border-radius: 90px;
  }

  hr {
    background-color: black;
    width: 1000px;
  }

  .body_text {
    /*登入/註冊分行*/
    columns: 2;
    column-rule: silver solid 1px;
    position: relative;
    margin-left: 100px;
    margin-right: 100px;
    margin-top: 25px;
    column-gap: 90px;
  }

  /*字形設定*/
  .singin_w {
    /*登入字型*/
    font-size: 48px;
    font-weight: bold;

    font-style: oblique;
  }

  .e_w {
    /*英文字*/
    margin-left: 10px;
    font-size: 30px;
  }

  .e_w_text {
    /*text內文字*/

    font-size: 30px;
    text-align: center;
  }

  .c_w {

    font-size: 30px;
    margin-left: 10px;
  }

  .h1_w {

    font-size: 48px;
    text-align: center;
  }

  .c_w_text {
    font-family: 微軟正黑體;
    font-size: 20px;
    text-align: center;
  }
</style>

<body>
  <div class="page">
    <!--header_store-->
    <div class="head">

      <div class="head_logo">
        <a href="store_1.jsp"><img src="images/logo.png" title="開始帽險"></a>
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

  <!--表單-->
  <div class=" content">
    <div class=" insideleft">
      <div class=" textinside">
<form action="add_password_change.jsp" method="post" id="form1">
        <h1 class="h1_w">
          更改密碼
        </h1>
        <div class=" e_w">
          <p>
            輸入舊密碼：
            <input class="e_w_text " type="password" placeholder="輸入舊密碼" autocomplete="off" name="password">
          </p>
          <p>
            輸入新密碼：
            <input class="e_w_text " type="password" placeholder="輸入新密碼" autocomplete="off" name="change_repassword">
          </p>
          <p>
            確認新密碼：
            <input class="e_w_text " type="password" placeholder="確認新密碼" autocomplete="off" name="rechange_repassword">
          </p>
        </div>
</form>
        <p>

          <button type="submit" form="form1" class=" c_w_text" name="repassword" style="border-radius: 90px; margin-left: 250px;">更改密碼</button>

        </p>

      </div>
    </div>
    <footer>
      <div>

        <img src="images/logo_index.png"
          style="width: 100px;height: 80px;float: left;margin-left: 20px; padding: 35px;">
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
          <a href="https://www.cycu.edu.tw/" target="_blank">https://www.cycu.edu.tw/</a>

        </div>

      </div>

    </footer>
  </div>
</body>

</html>

<%
            }
            else
            {
              con.close();
              out.println("<SCRIPT LANGUAGE='JavaScript'>");
              out.println("alert('請先登入！')");
              out.println("history.back();");
              out.println("</SCRIPT>");
            }
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