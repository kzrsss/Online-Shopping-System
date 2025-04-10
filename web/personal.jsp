<%@ page import="model.entity.User" %>
<%@ page import="model.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <style>
        /*body{*/
        /*    background-color: #619ac3;*/
        /*}*/
        .c1{
            width: 200px;
            height: 200px;
            border: 3px solid white;
            border-radius: 50%;
            overflow: hidden;
        }
        img{
            width: 100%;
        }
    </style>
</head>
<body>
    <div>

        <center>
            <div class="c1">
                <img src=<%=UserDao.Get_icon_url((String) session.getAttribute("name"))%> alt="">
            </div>
            <h1>
                <%=session.getAttribute("name") %>
            </h1>

        </center>
    </div>
</body>
</html>
