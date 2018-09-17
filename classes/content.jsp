<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/bootstrap/css/bootstrap.min.css">
<script src="${path }/bootstrap/js/bootstrap.min.js"></script>
<script src="${path }/jquery.min.js"></script>
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

<link rel="stylesheet" type="text/css" href="/Shop/css/index.css">
<link rel="stylesheet" type="text/css" href="/Shop/css/content.css">
<script type="text/javascript" src="/Shop/js/index.js"></script>

<%
 String pid = request.getParameter("pId");
 String purl = request.getParameter("pUrl");
 String pname = request.getParameter("pName");
 String pprice = request.getParameter("pPrice");
 session.setAttribute("purl", purl);
 session.setAttribute("pname", pname);
 session.setAttribute("pprice", pprice);
%>
<script>
function test(){
	$('#test').css('width','20px');
	$('#test').removeAttr('disabled');
}
$(function(){
	var id = <%=pid%>;
	console.log(id);
	$.ajax({
		url:"<%=path%>/product/booklist",
		data:JSON.stringify({
			pid:id
		}),
		dataType:'json',
		type:'post',
		contentType:"application/json;charset=utf-8",
		success:function(result){
			
		},
		error:function(result){
			
		}
	})
})
</script>
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
</head>
<body>
<%-- <c:set var="price" value="<%=request.getParameter("pPrice") %>"></c:set> 
<script type="text/javascript">
var price = "${price}";
alert("el表达式price的内容"+price);
</script> --%>

<div class="index-body" style="margin-top: 10px;">
		<div id="div_head">
			<div style="margin-left: 50px; color: #666;">您好${userName}，欢迎来到书途网,祝您愉快！</div>
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
								<li><a href="#" style="color: black">我的订单</a></li>
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
							<li class="on"><a href="${basePath }index.jsp">首页</a></li>
							<li><a href="#">分类</a></li>
							<li><a href="#">特卖</a></li>
							<li><a href="#">文具</a></li>
							<li><a href="#">考试</a></li>
						</ul>

					</div>
				</div>
			</div>
		</div>
		<div class="wrap">
		<!-- 图书分类 -->
		<div class="breadcrumb">
		<span>您现在的位置:</span>
		<a href="" target="_blank" title="全部分类">全部分类</a>
		<span class="spacer"></span>
		<a href="" target="_blank" title="文学小说">文学小说</a>
		<span class="spacer"></span>
		<a href="" target="_blank" title="小说集">小说集</a>
		</div>
		<!-- 图书购买区 -->
		<div class="product-intro">
		<!-- 图 -->
		<div class="show-pic">
		<div class="pic">
		<a href="" target="_blank">
		<img src="<%=path%>/img/book/${purl}" alt="${pname}" style="width:200px;height:251px;">
		</a>
		</div>
		</div>
		<!-- 摘要 -->
		<div class="summary">
		<!-- 标题 -->
		<div id="name">
		<h2 id="name_h2">${pname}</h2>
		</div>
		<div id="detail_wrap">
		<!-- 书本信息 -->
		<div class="detail-info" id="main-detail-info">
		<%-- <ul>
		<li class="t1">作者:${book.pAuthor}</li>
		<li class="t2">出版社:${book.pPress}</li>
		<li class="t3">ISBN:${book.pISBN}</li>
		</ul>
		<ul>
		<li class="t1">出版日期:${book.pPublicationDate}</li>
		<li class="t2">页数:${book.pPage}</li>
		<li class="t3">定价:${book.pPrice}</li>
		</ul> --%>
		<ul>
		<li class="t1">作者:<%=request.getParameter("pAuthor") %></li>
		<li class="t2">出版社:<%=request.getParameter("pPress") %></li>
		<li class="t3">ISBN:<%=request.getParameter("pISBN") %></li>
		</ul>
		<ul>
		<li class="t1">出版日期:<%=request.getParameter("pPublicationDate") %></li>
		<li class="t2">页数:<%=request.getParameter("pPage") %></li>
		<li class="t3">定价:<%=request.getParameter("pPrice") %></li>
		</ul>
		</div><!-- detail-info -->
		<div id="buy_wrap">
		<!-- 销售详情 -->
		<div id="yl-sale-wrap" class="sale yl-new">
		<div id="yl_sale_price_wrap" class="s-list price-wrap">
		<div class="attr-title letter3">书途价</div>
		<div class="attr-con yl-d-price">
		<span class="current-price">￥
		<em id="yl_d_price"><%=request.getParameter("pPrice") %></em></span>
		</div>
		</div>
		<div class="s-list">
		<div class="attr-title letter2">
		配送
		</div>
		<div class="attr-con yl-d-express">
		<span>购买39元免运费</span>
		</div>
		</div>
		<div class="s-list">
		<div class="attr-title">
		优惠活动
		</div>
		<div class="attr-con yl-d-activity">
		<div class="yl-point">
		送
		<span class="point-num">1520</span>
		<span class="new-point-num">2500</span>
		积分，每10点积分可用于支付0.01元。
		</div>
		<div>真实库存，24小时内发货！</div>
		</div>
		</div>
		</div><!-- yl-sale-wrap -->
		<!-- 购买区 -->
		<div class="buy-area">
		<div class="yl-skin">
		<div class="yl-sku">
		<div class="buy-num li">
		<div class="attr-title">
		购买数量
		</div>
		<div class="attr-con">
		<div class="buy-num-active">
		<a href="javascript:;" class="reduce-btn disabled" title="减少" onclick="buy_reduce()">-</a>
		<input type="text" class="buy-num-text" id="input_buy_num" value='1' max="40">
		<a href="javascript:;" class="add-btn" title="增加" onclick="buy_add()" id="add" >+</a>
		</div>
		<div class="stock">
		库存:<span id="yl_good_stock"><%=request.getParameter("pStore") %></span>
		</div>
		</div><!-- attr-con -->
		</div>
		<!-- 按钮 -->
		<div class="buy-active">
		<div class="total-price-wrap">
		<div class="total-d-price">
		<span class="price">
		￥<em id="yl_buy_price_total"><%=request.getParameter("pPrice") %></em><em id="yl_buy_price_total1" style="display:none;"><%=request.getParameter("pPrice") %></em>
		</span>
		</div>
		</div>
		<a href="" id="btn_buy" class="buy-but in-stock" rel="nofloow" style="cursor: point;"><img src="${path}/img/buy.png"></a>
		</div><!-- buy-active -->
		</div>
		</div>
		</div><!-- buy-area -->
		</div><!-- buy_wrap -->
		</div>
		</div>
		</div><!-- product-intro -->
		</div><!-- wrap -->
</div>
<script type="text/javascript" src="${path}/js/content.js"></script>
<script type="text/javascript" src="${path}/js/buy.js"></script>
<div>
<input type="text" id="test" value="1" disabled="disabled">
<a href="javascript:;" onclick="test()">测试</a>
</div>

</body>
</html>