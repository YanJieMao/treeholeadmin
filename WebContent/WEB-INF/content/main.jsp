<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>情绪垃圾桶 - 后台管理</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/mdui/0.3.0/css/mdui.min.css">
    <link rel="stylesheet" href="<%=basePath %>resource/css/admin.css">
    <style>
	body{background:#f6f6f6;}
	.main{width:1200px;margin: 0 auto;}
	.edit{width:1200px;background:#FFF;border:#999 1px solid;}
	
	.edit form ul li{list-style:outside none;margin:5px auto;height:30px}
	.edit form ul li span {width: 68px; float: left; padding-right: 10px;
	color: #666; height: 26px; font: normal 14px/26px arial; text-align: right;}
	.edit form ul li span b{color: #f00; padding-left:3px;}
	.edit form ul li input{width: 234px;height: 24px;border: 1px #b6b6b6 solid;
    background: #fff;line-height: 24px;padding: 0px 5px;}
	.show table{width:1200px;background:#FFF;border:#FF9 1px solid;margin-top:10px;border-collapse: collapse;}
	.show table tr{ border:1px #b6b6b6 dashed;margin:1px; padding-right: 10px;
	color: #666; height: 100px; font: normal 14px/26px arial; text-align:center;}
    </style>
    <script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
	$(function(){
		$(".delete").click(function(){ 
			
			$.ajax({
				url:'<%=path%>/main/delete',
				data:$(this).attr("v"),
				type:"GET",
				dataType: "text",
				success:function(msg){
					
				},
				error:function(msg){
					alert('error');
				}
			});
			 
			$(this).parent().parent().remove();
			return false;
		});
		
	});
</script>
</head>
<body>
<body class="mdui-appbar-with-toolbar mdui-theme-primary-indigo mdui-theme-accent-purple mdui-loaded mdui-drawer-body-left">
<header class="mdui-appbar mdui-appbar-fixed">
    <div class="mdui-toolbar mdui-color-theme">
        <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white" mdui-drawer="{target: '#main-drawer', swipe: true}"><i class="mdui-icon material-icons">menu</i></span>
        <a href="" class="mdui-typo-headline mdui-hidden-xs">情绪垃圾桶</a>
        <a href="" class="mdui-typo-title">后台管理</a>
        
        <div class="mdui-toolbar-spacer"></div>
        <a href="" class="mdui-center" >若无闲事挂心头，便是人间好时节</a>
        <a href="http://www.cnblogs.com/yanjiemao" target="_blank" class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white" mdui-tooltip="{content: '作者博客'}"><i class="mdui-icon material-icons">&#xe838;</i></a>
        <a href="http://localhost:8080/treehole/" target="_blank" class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white" mdui-tooltip="{content: '前台首页'}"><i class="mdui-icon material-icons">&#xe88a;</i></a>
        <a href="${pageContext.request.contextPath}/logout" class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white" mdui-tooltip="{content: '退出'}"><i class="mdui-icon material-icons">&#xe879;</i></a>
    </div>
</header>
<div class="mdui-drawer mdui-drawer-close" id="main-drawer">
    <div class="mdui-list" mdui-collapse="{accordion: true}" style="margin-bottom: 76px;">
        <div class="mdui-collapse-item">
            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">near_me</i>
                <div class="mdui-list-item-content">情绪垃圾管理</div>
                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-collapse-item-body mdui-list">
                <a href="" data-json="{'action': 'article'}" class="mdui-list-item mdui-ripple ">情绪垃圾列表</a>
            </div>
        </div>

       

        <div class="mdui-collapse-item">
            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-red">&#xe8b8;</i>
                <div class="mdui-list-item-content">系统设置</div>
                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-collapse-item-body mdui-list">
                <a href="" data-json="{'action': 'blacklist'}" class="mdui-list-item mdui-ripple ">系统关键字</a>
                <a href="" data-json="{'action': 'system'}" class="mdui-list-item mdui-ripple ">系统参数</a>
            </div>
        </div>
    </div>
</div>

<div class="mdui-container main animated fadeInDown" style="padding-top: 15px;">
    <div class="mdui-m-t-5 mdui-valign">
        <h1 class="mdui-center" style="font-family: '宋体';font-size: 50px;color: #01aaed;">情绪垃圾桶 0.1</h1>
            
    </div>
    
    <div class="show">
    
    	<table>
        	<tr>
          		<td width="5%"><b>序号</b></td>
                <td width="10%"><b>姓名</b></td>
                <td width="5%"><b>性别</b></td>
                <td width="24%"><b>内容</b></td>
                <td width="6%"><b>是否匿名</b></td>
                <td width="15%"><b>发送时间</b></td>
                <td width="15%"><b>ip</b></td>
                <td width="10%"><b>qq</b></td>
                <td width="10%"><b>操作</b></td>
                
            </tr>
         <c:forEach var="article" items="${main}">
          <tr>
			<td>${article.id}</td>
			<td>${article.name}</td>
			<td>${article.sex}</td>
			<td>${article.content}</td>
			<td>${article.is_anonymous}</td>
			<td>${article.send_time}</td>
			<td>${article.ip}</td>
			<td>${article.qq}</td>
         	<td><a class='delete' v='id=${article.id}' href="#">删除</a></td>
         </tr>
         </c:forEach>
        </table>
    </div>
        
</div>

<!-- Loading -->
<div class="loading-shade">
    <span></span>
</div>


<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/mdui/0.3.0/js/mdui.min.js"></script>
<script src="<%=basePath %>resource/js/common.js"></script>
</body>
</html>