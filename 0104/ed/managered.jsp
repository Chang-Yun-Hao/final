<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    try {
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
          if(session.getAttribute("mID")!=null)
            {
              sql="use `ourweb`";
              con.createStatement().execute(sql);
              String sqlman = "SELECT * FROM manager WHERE manaId = '"+session.getAttribute("mID")+"'";
              ResultSet rsman = con.createStatement().executeQuery(sqlman);
              String name="";
              while(rsman.next())
              {
                name = rsman.getString("manaName");
              }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>manager</title>
  <script src="https://kit.fontawesome.com/cd611e0502.js" crossorigin="anonymous"></script>
</head>
<link rel="icon" href="../images/logo_ok.ico" />
<style>
  /*字型*/
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@500;600&display=swap');

  * {
    font-family: 'Noto Serif TC', serif;
  }

  html,
  body {
    background-color: whitesmoke;
    background-image: url(/images/bg_img.png);
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
    width: 1200px;
    margin-left: auto;
    margin-right: auto;
    background-image: url(/images/text_bg.png);
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
    columns: 2;
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

  table {
    font-size: 20px;
    margin: auto;
  }

  .h1_w {
    font-size: 40px;
  }

  .c_w {
    font-size: 20px;
  }


  td {
    width: 150px;
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
          <a href="about.jsp" class="link" style="border-right: 1px #B2ACAC solid">關於我們</a>
          <a href="manager.jsp" class="link">賣場管理</a>
        </div>

        <div class="head_icon">
          <a href="singin&register.jsp"><img src="images/會員_ok.png" title="會員登入"></a>
          <a href="shopping-cart.jsp"><img src="images/購物車_ok.png" title="購物車"></a>
        </div>
      </div>
    </div>
  </div>

  <!--會員登入-->
  <div class=" content">
    <div class=" insideleft">
      <p>
        <h1 class=" h1_w">管理者登入</h1>
      </p>
      <hr class="hr1">
      <div class=" c_w">
        <%=name%> 您好！歡迎登入！
        <%
if(session.getAttribute("ID")!= null || session.getAttribute("mID")!= null)
          {
            out.println("<a href='logout.jsp'>登出</a>");
          }
          %>
        <br>
      </div>

      <div>
        <table border="1" style="text-align: center;">

          <thead style="text-align: center;">
          <tr>
          <td>品牌</td>
          <td>型號</td>
          <td>品名</td>
          <td>庫存</td>
          <td>價格</td>
          <td>操作</td>
          </tr>
<%
        sql = "SELECT pdId, pdBrand, pdKind, pdName, pdStock, pdPrice FROM product";
        ResultSet rs = con.createStatement().executeQuery(sql);
        int i=0;
        while(rs.next())
        {
          i+=1;
          out.println("<form action='add_pd_change.jsp' method='post' id='"+i+"'>");//參考shopping_cart.jsp的第284行
          out.println("<input type='hidden' value='"+rs.getString("pdId")+"' name='changeId'>");
          out.println("<tr>");
          out.println("<td class='td_1'>"+rs.getString("pdBrand")+"</td>");
          out.println("<td class='td_2'>"+rs.getString("pdKind")+"</td>");
          out.println("<td class='td_3'><input name='changeName' value='"+rs.getString("pdName")+"'></td>");
          out.println("<td class='td_4'><input name='changeStock' value='"+rs.getString("pdStock")+"'></td>");
          out.println("<td class='td_5'><input name='changePrice' value='"+rs.getString("pdPrice")+"'></td>");
          out.println("<td>");
          out.println("</form>");
          out.println("<button name='cancel' type='submit' form='"+i+"' class=' c_w_text1'>修改</button>");
          out.println("<button name='cancel' class=' c_w_text1'>刪除</button>");
          out.println("</td>");
          out.println("</tr>");

        }
%>
            <%-- <tr>
              <td class="td_1">NO.1</td>
              <td class="td_2">Pista GP RR</td>
              <td class="td_3">1</td>
              <td class="td_4">16,500</td>
              <td class="td_5">16,500</td>
              <td>
                <button name="cancel" class=" c_w_text1" onclick="window.location.href = 'manager_change.jsp';">修改</button>
                <button name="cancel" class=" c_w_text1">刪除</button>
              </td>
            </tr> --%>

          </thead>
        </table>
        <hr class="hr1">
        <div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>
<%
    con.close();
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