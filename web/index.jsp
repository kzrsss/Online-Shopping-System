<%@ page import="model.entity.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="model.dao.GoodsDao" %>
<%@ page import="model.dao.UserDao" %>
<%@ page import="model.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script charset="utf-8" type="text/javascript" src="./js/index.js"></script>
<html>
  <head>
    <title>零食购物系统</title>

  <style>
      body {
          font-family: Arial, sans-serif;
          background-color: #f4f4f4;
          margin: 0;
          padding: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
          background-image: url('image/1.png'); /* 背景图片路径 */
      }
      .container {
          background-color: white;
          padding: 40px;
          border-radius: 8px;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          width: 400px; /* 设置容器宽度 */
          max-width: 100%; /* 确保容器在小屏幕上也能适应 */
      }
      .form-group {
          margin-bottom: 20px;
      }
      .form-group label {
          display: block;
          margin-bottom: 5px;
          font-weight: bold;
      }
      .form-group input {
          width: 100%;
          padding: 15px;
          border: 1px solid #ddd;
          border-radius: 4px;
      }
      .form-group button {
          width: 100%;
          padding: 15px;
          border: none;
          border-radius: 4px;
          background-color: #5cb85c;
          color: white;
          font-size: 16px;
          cursor: pointer;
      }
      .form-group button:hover {
          background-color: #4cae4c;
      }
      .form-group a {
          display: block;
          margin-top: 10px;
          color: #337ab7;
          text-align: center;
          text-decoration: none;
          font-size: 14px;
      }
  </style>
  </head>
  <body>
  <div class="container">
      <h2>零食购物系统</h2>
      <div>
          <form action="LoginPost" method="post" onSubmit="return denglu(this)" id="loginForm" name="loginForm">
              <div class="form-group">
                  <input  type="text" name="name" placeholder="请输入用户名" ><br>
                  <br>
              </div>
              <div class="form-group">
                  <input type="password" name="pwd" placeholder="请输入密码"><br>
                  <br>
              </div>
              <div class="form-group">
                  <button type="submit">登陆</button>
              </div>
              <div class="form-group">
                  <a href="#" onclick="displayWindow()">没有账号？去注册</a>
              </div>
          </form>
      </div>
      <div id="registerForm" style="display:none;">
          <form>
              <div class="form-group">
                  <label for="registerNumber">电话</label>
                  <input type="text" id="registerNumber" name="number" required>
              </div>
              <div class="form-group">
                  <label for="registerUsername">用户名</label>
                  <input type="text" id="registerUsername" name="username" required>
              </div>
              <div class="form-group">
                  <label for="registerPassword">密码</label>
                  <input type="password" id="registerPassword" name="password" required>
              </div>
              <div class="form-group">
                  <button type="submit">登陆</button>
              </div>
              <div class="form-group">
                  <button onclick="displayWindow()">注册</button>
              </div>
          </form>
      </div>
  </div>



<%--  注册弹窗--%>
    <!--悬浮窗口-->
    <div id="window" class="window_css" style="text-align:center;">
        <form action="Registered" onSubmit="return zhuce(this)" enctype="multipart/form-data" method="post">
            账&emsp;&emsp;号：<input type="text" name="re_name"><br><br>
            密&emsp;&emsp;码：<input type="password" name="re_pwd"><br><br>
            确认密码：<input type="password" name="re_rpwd"><br><br>
            电话号码：<input type="text" name="re_tel"><br><br>
            所在省份：<input type="text" name="re_address"><br><br>
            详细地址：<input type="text" name="re_address_all"><br><br>
            快递收件人：<input type="text" name="re_address_who"><br><br>
            <%--上传头像--%>
            头像上传：<input type="file" name="file1" id="file1"><br><br>
            <button type="submit">提交注册</button>
        </form>
        <button onclick="hideWindow()">取&emsp;消</button>

    </div>
    <!--出现悬浮窗口后,背景变暗-->
    <div id="shadow" class="shadow_css"></div>


  </body>
  <script type="text/javascript">
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
      };

      function denglu(form){
      if(form.name.value==""){
        alert("用户名不能为空！！");
        form.name.focus();
        return false;
      }
      if(form.pwd.value==""){
        alert("密码不能为空！！");
        form.pwd.focus();
        return false;
      }
    }
    function zhuce(form) {
        if(form.re_name.value==""){
            alert("账号不能为空！！");
            form.re_name.focus();
            return false;
        }
        if(form.re_pwd.value==""){
            alert("密码不能为空！！");
            form.re_pwd.focus();
            return false;
        }
        if(form.re_rpwd.value==""){
            alert("请输入两次密码！！");
            form.re_rpwd.focus();
            return false;
        }
        if(form.re_tel.value==""){
            alert("电话不能为空！！");
            form.re_tel.focus();
            return false;
        }
        if(form.re_address.value==""){
            alert("地址不能为空！！");
            form.re_address.focus();
            return false;
        }
        if(form.re_address_all.value==""){
            alert("详细地址不能为空！！");
            form.re_address_all.focus();
            return false;
        }
        if(form.re_address_who.value==""){
            alert("收件人不能为空！！");
            form.re_address_who.focus();
            return false;
        }
        if(form.re_pwd.value!=form.re_rpwd.value){
            alert("两次输入密码不同！！");
            form.re_rpwd.focus();
            return false;
        }
    }
  </script>


<%--  /*注册弹窗的样式*/--%>

  <style>
      .shadow_css {
          display: none;
          position: absolute;
          top: 0%;
          left: 0%;
          width: 100%;
          height: 100%;
          background-color: black;
          z-index: 10;
          /* 为mozilla firefox 设置透明度  */
          -moz-opacity: 0.6;
          /* 设置透明度 */
          opacity: .60;
          /* 为IE 设置透明度  */
          filter: alpha(opacity=66);
      }

      .window_css {
          display: none;
          position: absolute;
          top: 20%;
          left: 25%;
          width: 50%;
          height: 60%;
          border: 3px solid honeydew;
          background-color: aliceblue;
          z-index: 11;
      }
  </style>

</html>
