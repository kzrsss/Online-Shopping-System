<%@ page import="model.entity.Indent" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dao.IndentDao" %>
<%@ page import="model.entity.Goods" %>
<%@ page import="model.dao.GoodsDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }
        li:last-child {
            border-bottom: none;
        }
        .label {
            font-weight: bold;
            color: #555;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>User Information</h1>
    <ul>
        <li><span class="label">用户名:</span> ${userInfo[0]}</li>
        <li><span class="label">用户ID:</span> ${userInfo[1]}</li>
        <li><span class="label">密码:</span> ${userInfo[2]}</li>
        <li><span class="label">头像URL:</span> <img src="${userInfo[3]}" alt="头像" style="width: 100px; height: auto;"></li>
        <li><span class="label">地址:</span> ${userInfo[4]}</li>
        <li><span class="label">电话:</span> ${userInfo[5]}</li>
        <li><span class="label">详细地址:</span> ${userInfo[6]}</li>
        <li><span class="label">收件人:</span> ${userInfo[7]}</li>
    </ul>
</div>
</body>
</html>