function displayWindow() {
    document.getElementById("window").style.display = "block";
    document.getElementById("shadow").style.display = "block";
}

function hideWindow() {
    document.getElementById("window").style.display = "none";
    document.getElementById("shadow").style.display = "none";
}

function denglu(form) {
    if (form.name.value == "") {
        alert("用户名不能为空！！");
        form.name.focus();
        return false;
    }
    if (form.pwd.value == "") {
        alert("密码不能为空！！");
        form.pwd.focus();
        return false;
    }
}

function zhuce(form) {
    if (form.re_name.value == "") {
        alert("账号不能为空！！");
        form.re_name.focus();
        return false;
    }
    if (form.re_pwd.value == "") {
        alert("密码不能为空！！");
        form.re_pwd.focus();
        return false;
    }
    if (form.re_rpwd.value == "") {
        alert("请输入两次密码！！");
        form.re_rpwd.focus();
        return false;
    }
    if (form.re_tel.value == "") {
        alert("电话不能为空！！");
        form.re_tel.focus();
        return false;
    }
    if (form.re_address.value == "") {
        alert("地址不能为空！！");
        form.re_address.focus();
        return false;
    }
    if (form.re_address_all.value == "") {
        alert("详细地址不能为空！！");
        form.re_address_all.focus();
        return false;
    }
    if (form.re_address_who.value == "") {
        alert("收件人不能为空！！");
        form.re_address_who.focus();
        return false;
    }
    if (form.re_pwd.value != form.re_rpwd.value) {
        alert("两次输入密码不同！！");
        form.re_rpwd.focus();
        return false;
    }
}