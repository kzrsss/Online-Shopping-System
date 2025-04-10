<%@ page import="model.entity.Indent" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dao.IndentDao" %>
<%@ page import="model.entity.Goods" %>
<%@ page import="model.dao.GoodsDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
    <link id="css" rel="stylesheet" type="text/css" href="./CSS/myindent.css" />
</head>
<body>
<div style="float: left;width: 100%;height: 100px;background-color: ivory;">
    <img src="image/2.png" alt="" style="width: 100%;height: 100px;">
</div>
<div style="float: left;width: 20%;height: 1000px;background-color: aqua;">
    <!--左边栏空白占位  -->
</div>
<div style="float: left;width: 60%;height: 1000px;">
    <%
        String name = (String) session.getAttribute("name");
        if (name != null) {
            List<Indent> list = IndentDao.all_indent_query(name);
            if (list != null) {
                for (Indent indent : list) {
    %>
    <br><br>
    <div class="orderList normal">
        <div class="title">
            <p class="orderNum">
                订单号：
                <span><%=indent.getIndent_id()%></span>
            </p>
            <p class="orderTime">
                下单时间：
                <span><%=indent.getCreate_time()%></span>
            </p>
            <p class="orderTime">
                订单状态：<span style="color: #c40000">已支付</span>
            </p>
        </div>
        <ul class="orderInfo">
            <%
                String goods_lis = indent.getGoods_kind();
                String num_lis = indent.getGoods_num();
                if (goods_lis != null && num_lis != null) {
                    String[] goods_li = goods_lis.split(" ");
                    String[] num_li = num_lis.split(" ");
                    int temp = 0;
                    for (int i = 0; i < goods_li.length; i++) {
                        String goods_name_li = goods_li[i];
                        Goods goods_l = GoodsDao.goods_query(goods_name_li);
                        if (goods_l != null) {
            %>
            <li>
                <img src=<%=goods_l.getIcon_url()%> />
                <div class="info">
                    <p class="productName">
                        <%=goods_name_li%>
                    </p>
                    <p class="count">
                                    <span class="unitPrice">
                                        &yen;<%=goods_l.getPrice()%>
                                    </span>
                        <span class="number">
                                        &times;<%=num_li[temp]%>
                                    </span>
                    </p>
                </div>
            </li>
            <%
                            temp++;
                        }
                    }
                }
            %>
        </ul>
        <div class="orderPrice clearfix">
            <div class="detail">
                <p class="amount">
                    订单金额：
                    <span>
                        &yen;<%=indent.getMoney()%>
                    </span>
                </p>
            </div>
        </div>
    </div>
    <%
                }
            }
        }
    %>
</div>
<div style="float: left;width: 20%;height: 1000px;background-color: hotpink;">
</div>
</body>
</html>