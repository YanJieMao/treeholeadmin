<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>情绪垃圾桶- 后台登录</title>

    <!-- IOS -->
    <link rel="apple-touch-icon" href="./favicon.ico">
    <meta name="HandheldFriendly" content="true">
    <meta name="apple-mobile-web-app-title" content="情绪垃圾桶">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="https://cdn.bootcss.com/mdui/0.4.0/css/mdui.min.css">
    <link rel="stylesheet" href="resource/css/admin.css">
</head>
<style>
    body {
        width: 100%;
        height: 100%;
        background: #fcfcfd;
    }
    .main {
        position: fixed;
        top: 40%;
        left: 50%;
        width: 30%;
        background: #ffffff;
        -webkit-transform: translateX(-50%) translateY(-50%);
        transform: translateX(-50%) translateY(-50%);
        box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.25);
        -webkit-box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.22);
        border-radius: 5px;
    }
    .login {
        padding: 20px;
    }
    .login h1 {
        margin: 0 0 10px;
        border-bottom: 1px solid #01aaed;
        padding-bottom: 10px;
        text-align: center;
        font-weight: normal;
    }
    @media screen and (max-width: 768px) {
        .main { width: 90%; }
    }
</style>
<body class="mdui-theme-primary-indigo mdui-theme-accent-purple">
    <div class="main">
        <div class="login">
            <form action="${pageContext.request.contextPath}/login" method="post">
                
                <h1>欢迎登录</h1>
                <td align="center"><font color="red">${requestScope.message }</font><td>
                <div class="mdui-textfield mdui-textfield-floating-label">
                    
                    <td>账号<input class="mdui-textfield-input" type="text" id="loginname" name="loginname""/><td>
                </div>
                <div class="mdui-textfield mdui-textfield-floating-label">
                    
                    <td>密码<input class="mdui-textfield-input" type="password" id="password" name="password"/></td>
                </div>
                <button class="mdui-btn mdui-btn-block mdui-color-theme-accent mdui-ripple" type="submit">登录</button>
            </form>
        </div>
    </div>
    <!-- Loading -->
    <div class="loading-shade">
        <span></span>
    </div>
</body>
    
    
</html>