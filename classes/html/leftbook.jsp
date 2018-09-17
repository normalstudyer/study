<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	Cookie[] cookie = request.getCookies();
	String name = "";
	name = cookie[0].getValue();
	request.setAttribute("userName", name);
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
     session.setAttribute("path", path);
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>书途网-专业的二手书店</title>
<link rel="stylesheet" href="${path }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/css/floor-list.css">
<link rel="stylesheet" href="${path }/css/leftbook.css">
<script src="${path }/bootstrap/js/bootstrap.min.js"></script>
<script src="${path }/jquery.min.js"></script>
<script type="text/javascript" src="${path }/lhgdialog/lhgdialog/lhgdialog.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/lhgdialog/lhgdialog/skins/discuz.css">
<link rel="stylesheet" type="text/css" href="${path }/css/index.css">
<script type="text/javascript" src="${path }/js/index.js"></script>
<script type="text/javascript" src="${path }/js/index1.js"></script>
<script type="text/javascript" src="${path }/js/floor-list.js"></script>
<script type="text/javascript" src="${path }/js/leftbook.js"></script>
<style>
#div_head {
	background-color: #f4f4f4;
	height: 29px;
	border-bottom: 1px solid #f9f9f9;
	line-height: 29px;
	width: 100%;
	margin-top: -11px;
	font-size: 3px;
	position: absolute;
}

#div_head #ul_head {
	float: right;
	list-style: none;
	margin-top: -26px;
}

#div_head #ul_head li {
	float: left;
}

a {
	text-decoration: none;
}

#div_head #ul_head #pipe {
	padding: 0 5px;
}

#div_head .menu_list {
	list-style: none;
	display: none;
	position: absolute;
	background: #fff;
	border: 1px solid #ddd;
	border-top: none;
	padding-left: 10px;
	margin-left: -10px;
	z-index: 10;
}

#div_head .menu_list li {
	float: none;
}

a:hover {
	color: red;
}

.div_menu_list {
	display: block;
	height: 100%;
	position: relative;
	cursor: pointer;
	z-index: 11;
	padding-right: 10px;
	padding-left: 9px;
}

.menu_list li:hover {
	background-color: #ddd;
}

.div_head_right_a3:hover .menu_list {
	display: block;
}

body, button, ul, li, ol, p, dl, dd, h1, h2, h3, h4, h5, h6, img, iframe,
	form, pre {
	margin: 0;
	padding: 0;
	list-style-type: none;
	border: 0;
	font-size: 100%;
}
</style>
<script>
	$(function() {
		$('.div_menu_list').mouseenter(function() {
			$('.div_menu_list').css("border", "1px solid #ddd");
			$('.menu_list').css("display", "block");
		})
		$('.div_menu_list').mouseleave(function() {
			$('.div_menu_list').css("border", "none");
			$('.menu_list').css("display", "none");
		})
	})
</script>
<!--<style>-->
<!--.search-combox .ac_input{-->
<!--height: 31px;-->
<!--border: 3px solid #de0304;-->
<!--}-->
<!--.search-combox #search-combox-bt{-->
<!--height:39px;-->
<!--border: 3px solid #de0304;-->
<!--width:70px;-->
<!--border-left:0px;-->
<!--background-color: red;-->
<!--color:white;-->
<!--font-family: 微软雅黑;-->
<!--font-size: 15px;-->
<!--margin-top: 2px;-->
<!--}-->
<!--</style>-->
<style type="text/css">
.buy-num-active {
	overflow: hidden;
	float: left;
	vertical-align: middle;
}

.buy-num-active a {
	width: 29px;
	height: 30px;
	display: inline-block;
	text-align: center;
	line-height: 30px;
	float: left;
	background-color: #e1e1e1;
	color: #666;
	font-size: 22px;
	text-decoration: none;
}

.buy-num-active .buy-num-text {
	width: 55px;
	height: 26px;
	line-height: 26px;
	border: 1px solid #e1e1e1;
	text-align: center;
	font-size: 16px;
	outline: none;
	float: left;
}
</style>
<script>
$(function(){
	var i = 0;
	var a = window.setInterval(function(){
		
	    $('#img-bd li:eq('+i+')').siblings().hide();
		$('#img-bd li:eq('+i+')').show();
		$('#img-bd li:eq('+i+')').siblings().removeClass('on');
		$('#img-bd li:eq('+i+')').addClass('on');
		i++;
		if(i==2){
			i=0;
		}
},3000);
})
</script>
</head>
<body>
	<div class="index-body" style="margin-top: 10px;"> 
		<div id="div_head">
			<div style="margin-left: 50px; color: #666;">您好${userName}，欢迎来到书途网，祝您愉快！</div>
			<div id="div_head_right">
				<ul id="ul_head">
					<%-- <c:set var="salary" value="${4000 }" scope="session"></c:set> --%>
					<c:if test="${empty userName}">
						<li><a href="/Shop/jsp/login.jsp" style="color: red;">请登录</a>
							<a href="/Shop/jsp/login.jsp">免费注册</a></li>
					</c:if>
					<li id="pipe">|</li>
					<li>
						<div class="div_menu_list">
							<a href="#" class="div_head_right_a3">我的书途&nbsp;&nbsp;</a>
							<ul class="menu_list">
								<li><a style="color: black" onclick="aclick()">我的订单</a></li>
								<li><a href="#" style="color: black">我的余额</a></li>
							</ul>
						</div>
					</li>
					<li><a href="javascript:" style="color:red;" id="outLogin">退出登录</a></li>
				</ul>
			</div>
		</div>
		<div class="searchWarp">
			<div class="logo">
				<img alt="书途网" src="/Shop/img/logo4.png">
			</div>
			<div class="searchFrame">
				<form action="" onsubmit="search()" name="searchForm">
					<div class="search-combox">
						<input type="text" name="bookName" id="key" class="ac_input"
							placeholder="书名、作者、出版社">
						<!--<span style="margin-left: -5px;margin-top: 10px;"><input id="search-combox-bt"  type="submit" value="搜索"> </span>-->
					</div>
					<div class="search-btn">
						<input type="submit" name="keyBtn" value="搜索">
					</div>
				</form>
			</div>
		</div>
		<!--中间导航栏-->
		<div class="nav">
			<div class="nav_bd"
				style="height: 39px; line-height: 39px; overflow: hidden">
				<div class="navBar">
					<div class="ylType">
						<div class="allType" align="center">
							<a href="#" target="_blank">全部图书分类<span><b
									class="caret"></b></span></a>
						</div>
					</div>
					<div class="nav_c">
						<ul class="nav_c_1">
							<li class="on"><a href="#">首页</a></li>
							<li><a href="#">分类</a></li>
							<li><a href="#">特卖</a></li>
							<li><a href="#">文具</a></li>
							<li><a href="#">考试</a></li>
						</ul>

					</div>
				</div>
			</div>
		</div>
		<!-- 左边的列表 -->
		<div class="wrap">
		<div class="wrap-bd">
		<div id="classifyDefaultLeft">
		<div class="classifySub">
		<div class="header">
		<div class="content"><a>科学技术</a></div>
		</div>
		
		<div class="body">
		<div class="content">
		<ul>
		<li class="active">语言与编程</li>
		<li><a href="">电子通信</a></li>
		<li><a href="">数据库</a></li>
		</ul>
		</div>
		</div>
		</div>
		</div>
		<div id="classifyDefaultRight">
		<div class="classifyTitle2">
		<div class="ct1">语言与编程</div>
		<div class="ctr">共有图书数量</div>
		<div class="newBookList">
		<ul></ul>
		</div>
		</div>
		</div>
		</div>
		</div><!-- wrap -->
</div>
</body>
</html>