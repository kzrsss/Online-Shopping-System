<%@ page import="model.entity.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="model.dao.GoodsDao" %>
<%@ page import="model.dao.UserDao" %>
<%@ page import="model.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link id="css" rel="stylesheet" type="text/css" href="./CSS/index.css"  />
<script charset="utf-8" type="text/javascript" src="./js/index.js"></script>
<html>
<head>
    <title>零食商城</title>
          <script>
              function getQueryParam(param) {
                  const queryString = window.location.search;
                  const params = new URLSearchParams(queryString);
                  return params.get(param);
              }

              window.onload = function() {
                  const loginSuccess = getQueryParam('loginSuccess');
                  if (loginSuccess === 'false') {
                      alert("登录失败");
                  }
                  if (loginSuccess === 'true') {
                      alert("登录成功");
                  }
              };

              function click_line()
              {
                  var a='<%=session.getAttribute("name")%>';

                      var goods_name = arguments[0];
                      // alert(goods_name.toString());
                      var href = "details.jsp?product_name="+goods_name.toString();
                      window.location.href = href;

              }
          </script>
</head>
<body>
<div style="width: 100%;height: 100%;">

    <div style="float: left;width: 100%;height: 100px;background-color: ivory;">
        <img src="image/2.png" alt="" style="width: 100%;height: 100px;">
    </div>

    <div style="float: left;width: 20%;height: 1000px;background-color: aqua;">
        <!--左边栏空白占位  -->
    </div>
    <div style=" float: left;width: 60%;height: 1000px;">
        <!-- <div style="float: left;width: 100%;height: 80px;text-align:center;">
            <h1>零食选购</h1>
        </div> -->
        <div style="float: left;width: 2%;height: 1000px;">

        </div>
        <!-- 零食卡片 -->
        <div style="float: left;width: 98%;height: 1000px;">
            <%
                List<Goods> good_list = GoodsDao.allgoods_query();
                for (Goods g:good_list)
                {
                    //已下架
                    if(g.getProject_deleted().equals("1"))
                        continue;
                    String goods_name = g.getGoods_name();
            %>
            <div class="cardBox" onclick="click_line('<%=goods_name %>')">
                <div class="headerBox" style="background-image: url(<%=g.getIcon_url() %>);">
                    <%--                    <p><%=g.getGoods_name() %></p>--%>
                </div>
                <div class="bodyBox" >
                    <p><%=goods_name %></p>
                    <p>销量：<%=g.getSales() %></p>
                    <p>库存：<span style="color:green"><%=g.getNum() %></span></p>
                    <p>价格：￥<%=g.getPrice() %></p>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <div style="float: left;width: 20%;height: 1000px;background-color: hotpink;text-align:center;">
        <!--右边栏  -->
        <center>

            <div>

                <div style="">
                    <a href="myindent.jsp" >
                        查询我的订单
                    </a>
                    <br>
                    <a href="MyInfoPost">
                        查询我的信息
                    </a>
                    <br>
                    <a href="Logout">
                        注销
                    </a>
                    <br>
                </div>
                <iframe src="personal.jsp" width="100%" height="100%" frameborder="0">
                </iframe>
            </div>

        </center>
    </div>
</div>

</body>

</html>
