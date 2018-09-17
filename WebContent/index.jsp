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
	session.setAttribute("basePath",basePath);
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>书途网-专业的二手书店</title>
<link rel="stylesheet" href="${path }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/css/floor-list.css">
<script src="${path }/bootstrap/js/bootstrap.min.js"></script>
<script src="${path }/jquery.min.js"></script>
<script type="text/javascript" src="${path}/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${path }/lhgdialog/lhgdialog/lhgdialog.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/lhgdialog/lhgdialog/skins/discuz.css">
<link rel="stylesheet" type="text/css" href="${path }/css/index.css">
<script type="text/javascript" src="${path }/js/index.js"></script>
<script type="text/javascript" src="${path }/js/index1.js"></script>
<script type="text/javascript" src="${path }/js/floor-list.js"></script>
	<script type="text/javascript" src="${path }/layer-v3.1.1/layer/layer.js"></script>
	<script type="text/javascript" src="${path }/lhgdialog/lhgdialog/lhgdialog.min.js"></script>
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
    //弹出一个页面层
    var url="";
    $('#test1').on('click',function() {
        console.log("1111");
        layer.open({
            title: '我的订单',
            type: 2,
            area: ['600px', '360px'],
            shadeClose: true,//点击遮罩关闭
            //content:'<table style="width:100%" border="1"><tbody><tr><td>订单</td><td>收件人</td><td>图书</td><td>总金额</td><td>状态</td></tr></tbody></table>'
            content: 'jsp/dingdan.jsp'
        });
    })
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
							<a href="/Shop/jsp/register.jsp">免费注册</a></li>
					</c:if>
					<li id="pipe">|</li>
					<li>
						<div class="div_menu_list">
							<a href="#" class="div_head_right_a3">我的书途&nbsp;&nbsp;</a>
							<ul class="menu_list">
								<li><a style="color: black" id="test1">我的订单</a></li>
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
		<div class="nav" style="display: inline;">
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
		<!--左边书籍目录-->
		<div class="wrapSlide">
			<div class="index-sort">
				<ul class="cat-menu sort-menu-bd">
					<li class="mainCate" name='0'>
						<h2>
							<span class="tilte">科学技术</span> <span class="caret1"> <b
								class="caret_out"></b> <b class="caret_in"></b>
							</span>
						</h2>
						<div class="min-sort">
							<a href="#" target="_blank">语言与编程</a>
							<a href="#" target="_blank">电子通信</a>
							<a href="#" target="_blank">数据库</a>
						</div>
						<div class="submenu" style="display: none; top: -37px;">
							<ul>
								<li>
									<h3>
										<a href="#" title="计算机与网络">计算机与网络</a>
									</h3>
									<div class="e">
										<a href="#">心灵修养</a> <a href="#">心灵修养</a> <a href="#">心灵修养</a>
										<a href="#">心灵修养</a> <a href="#">心灵修养</a>
									</div>
								</li>
								<li>
									<h3>
										<a href="#" title="科技工程">科技工程</a>
									</h3>
									<div class="e">
										<a href="#">心灵修养</a> <a href="#">心灵修养</a> <a href="#">心灵修养</a>
										<a href="#">心灵修养</a> <a href="#">心灵修养</a>
									</div>
								</li>
							</ul>
						</div>
					</li>

					<li class='mainCate' name='1'>
						<h2>
							<span class='title'>文学艺术</span> <span class="caret1"> <b
								class="caret_out"></b> <b class="caret_in"></b>
							</span>
						</h2>
						<div class="min-sort">
							<a href="#" target="_blank">设计</a> <a href="#" target="_blank">设计</a>
							<a href="#" target="_blank">设计</a> <a href="#" target="_blank">设计</a>
							<a href="#" target="_blank">设计</a>
						</div>
						<div class="submenu" style="display: none; top: -82px;">
							<ul>
								<li>
									<h3>
										<a href="#" title="收藏鉴赏">收藏鉴赏</a>
									</h3>
									<div class="e">
										<a href="#">玉器宝石</a> <a href="#">玉器宝石</a> <a href="#">玉器宝石</a>
										<a href="#">玉器宝石</a> <a href="#">玉器宝石</a>
									</div>
								</li>
								<li>
									<h3>
										<a href="#" title="收藏鉴赏">艺术</a>
									</h3>
									<div class="e">
										<a href="#">乐器</a> <a href="#">乐器</a> <a href="#">乐器</a> <a
											href="#">乐器</a> <a href="#">乐器</a>
									</div>
								</li>
							</ul>
						</div>
					</li>

					<li class='mainCate' name='1'>
						<h2>
							<span class='title'>人文社科</span> <span class="caret1"> <b
								class="caret_out"></b> <b class="caret_in"></b>
							</span>
						</h2>
						<div class="min-sort">
							<a href="#" target="_blank">人文社科</a> <a href="#" target="_blank">人文社科</a>
							<a href="#" target="_blank">人文社科</a> <a href="#" target="_blank">人文社科</a>
							<a href="#" target="_blank">人文社科</a>
						</div>
						<div class="submenu" style="display: none; top: -50px;">
							<ul>
								<li>
									<h3>
										<a href="#" title="收藏鉴赏">心理</a>
									</h3>
									<div class="e">
										<a href="#">玉器宝石</a> <a href="#">玉器宝石</a> <a href="#">玉器宝石</a>
										<a href="#">玉器宝石</a> <a href="#">玉器宝石</a>
									</div>
								</li>
								<li>
									<h3>
										<a href="#" title="收藏鉴赏">法律</a>
									</h3>
									<div class="e">
										<a href="#">乐器</a> <a href="#">乐器</a> <a href="#">乐器</a> <a
											href="#">乐器</a> <a href="#">乐器</a>
									</div>
								</li>
							</ul>
						</div>
					</li>

					<li class='mainCate' name='1'>
						<h2>
							<span class='title'>科学技术</span> <span class="caret1"> <b
								class="caret_out"></b> <b class="caret_in"></b>
							</span>
						</h2>
						<div class="min-sort">
							<a href="#" target="_blank">人文社科</a> <a href="#" target="_blank">人文社科</a>
							<a href="#" target="_blank">人文社科</a> <a href="#" target="_blank">人文社科</a>
							<a href="#" target="_blank">人文社科</a>
						</div>
						<div class="submenu" style="display: none; top: -50px;">
							<ul>
								<li>
									<h3>
										<a href="#" title="收藏鉴赏">计算机</a>
									</h3>
									<div class="e">
										<a href="#">玉器宝石</a> <a href="#">玉器宝石</a> <a href="#">玉器宝石</a>
										<a href="#">玉器宝石</a> <a href="#">玉器宝石</a>
									</div>
								</li>
								<li>
									<h3>
										<a href="#" title="收藏鉴赏">网络</a>
									</h3>
									<div class="e">
										<a href="#">乐器</a> <a href="#">乐器</a> <a href="#">乐器</a> <a
											href="#">乐器</a> <a href="#">乐器</a>
									</div>
								</li>
							</ul>
						</div>
					</li>

					<li class='mainCate' name='1'>
						<h2>
							<span class='title'>生活休闲</span> <span class="caret1"> <b
								class="caret_out"></b> <b class="caret_in"></b>
							</span>
						</h2>
						<div class="min-sort">
							<a href="#" target="_blank">人文社科</a> <a href="#" target="_blank">人文社科</a>
							<a href="#" target="_blank">人文社科</a> <a href="#" target="_blank">人文社科</a>
							<a href="#" target="_blank">人文社科</a>
						</div>
						<div class="submenu" style="display: none; top: 20px;">
							<ul>
								<li>
									<h3>
										<a href="#" title="收藏鉴赏">家庭育儿</a>
									</h3>
									<div class="e">
										<a href="#">玉器宝石</a> <a href="#">玉器宝石</a> <a href="#">玉器宝石</a>
										<a href="#">玉器宝石</a> <a href="#">玉器宝石</a>
									</div>
								</li>
								<li>
									<h3>
										<a href="#" title="收藏鉴赏">国家地理</a>
									</h3>
									<div class="e">
										<a href="#">乐器</a> <a href="#">乐器</a> <a href="#">乐器</a> <a
											href="#">乐器</a> <a href="#">乐器</a>
									</div>
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		  <!-- 中间书籍相关信息 -->
          <div class="wrapContent">
          <div class="wrapContentL">
          <div class="ylSlide">
          <div class="slide" id="slide">
          <div class="hd">
          <ul>
          <li>1</li>
          <li>2</li>
          </ul>
          </div><!-- hd -->
          <div class="bd">
          <ul style="position:relative;width:750px;height:343px;" id="img-bd">
          <li style="position:absolute;width:750px;display:list-item;">
          <a href="" target="_blank"><img src="/Shop/img/head-center.png"></a>
          </li>
          <li style="position:absolute;width:750px;display:none;">
          <a href="" target="_blank"><img src="/Shop/img/head-center1.png"></a>
          </li>
          </ul>
          </div><!-- bd -->
          </div><!-- slide -->
          </div><!-- ylSlide -->
          <div class="recommended-book" id="recommended-book">
          <div class="hd">
          <h3>推荐图书</h3>
          <span class="pageState">
          <span></span>/2
          </span>
          </div><!-- hd -->
          <div class="bd">
          <div class="tempWrap" style="overflow:hidden;position:relative;width:733px;">
          <div class="picList" style="width:4398px;position:relative;overflow:hidden;padding:0px;margin:0px;left:-733px">
          <ul class="center-book-ul" style="float:left;width:733px;">
          <%-- <li class="recommended-book-li" style="position:relative;"><div class="pic"><div class="subpic">
		  <a href="" target="_blank" ><img alt="阿弥陀佛" title="3213" src="<%=path %>/img/book/1.jpg" style="height:160px;width:127.94px;"></a></div></div>
		  <p class="title"><a href="" target="_blank" title="313">321321</a></p>
		  <p class="yl-author">3213</p><p class="price"><span class="price-d">￥<em>32131</em></span></p></li> --%>
          <%-- <c:forEach var="list" items="${product}" >
          <li class="recommended-book-li" style="position:relative;">
          <div class="pic">
          <div class="subpic">
          <a href="" target="_blank" ><img alt="${list.pName }" title="${list.pName }" src="<%=path %>/img/book/${list.pUrl}" style="height:160px;width:127.94px;"></a>
          </div>
          </div>
          <p class="title">
          <a href="" target="_blank" title="${list.pName}">${list.pName }</a>
          </p>
          <p class="yl-author">${list.pAuthor }</p>
          <p class="price">
          <span class="price-d">"￥"<em>${list.pPrice }</em></span>
          </p>
          </li>
          </c:forEach> --%>
          </ul>
          <ul class="center-book-ul1" style="float:left;margin-left:740px;">
          
          </ul>
          </div>
          </div><!-- bd -->
          </div><!-- recommended-book -->
          </div><!-- wrapContentL -->
          </div><!-- wrapContent -->
		</div>
   </div><!-- wrapslide -->
   <div class="floor_list">
   <div class="book-storey book-new s1">
   <div class="bs-hd">
   <h3>热书推荐</h3>
   <ul>
   <li class="on">
   <a href="javascript:;">青春文学</a>
   <span><s></s></span>
   </li>
   <li>
   <a href="javascript:;">网络小说</a>
   <span><s></s></span>
   </li>
   <li>
   <a href="javascript:;">散文随笔</a>
   <span><s></s></span>
   </li>
   <li>
   <a href="javascript:;">精品教材</a>
   <span><s></s></span>
   </li>
   </ul>
   </div><!-- bs-hd -->
   <div class="bs-bd">
   <div class="book-list clearfix">
   <ul style="display:block;" class="book-list-ul">
   
   </ul>
   </div><!-- book-list clearfix -->
   </div>
   </div>
   </div><!-- floor_list -->
   <!-- <div id="ifrmae1"><iframe src="/Shop/jsp/dingdan.jsp"></iframe></div> -->
</div>
<%-- <div id="testdiv">
<ul>
<li style="position:relative;"><div class="pic"><div class="subpic">;
<a href="" target="_blank" ><img alt="阿弥陀佛" title="3213" src="<%=path %>/img/book/1.jpg" style="height:160px;width:127.94px;"></a></div></div>
<p><a href="" target="_blank" title="313">321321</a></p>
<p>3213</p><p class="price"><span>￥<em>32131</em></span></p></li>
</ul>
</div> --%>
<div><button id="test">测试弹窗</button></div>


<%--<script>
//$(function(){
    //弹出一个页面层
    var url="";
    $('#test1').on('click',function(){
        console.log("1111");
        layer.open({
            title:'我的订单',
            type:2,
            area:['600px','360px'],
            shadeClose:true,//点击遮罩关闭
            //content:'<table style="width:100%" border="1"><tbody><tr><td>订单</td><td>收件人</td><td>图书</td><td>总金额</td><td>状态</td></tr></tbody></table>'
            content:'jsp/dingdan.jsp'
        });
		/* layer.prompt({title: '输入任何口令，并确认', formType: 1}, function(pass, index){
		 layer.close(index);
		 layer.prompt({title: '随便写点啥，并确认', formType: 2}, function(text, index){
		 layer.close(index);
		 layer.msg('演示完毕！您的口令：'+ pass +'<br>您最后写下了：'+text);
		 });
		 }); */
		/* layer.open({
		 title:"我的订单",
		 type: 2,
		 area: ['700px', '450px'],
		 fixed: false, //不固定
		 maxmin: true,
		 content: 'test.jsp'
		 }); */
    });
//})
</script>--%>
<script type="text/javascript">
	var basePath = "<%=basePath%>";
//上中间图书信息,初始化商品信息
$(document).ready(function(){
	
		console.log('已经进入部分图书信息');
		$.ajax({
			url:"<%=basePath%>index/centerBook",
			dataType:"json",
			type:"post",
			data:JSON.stringify({
				data:"ni"
			}),
			contentType:"application/json;charset=utf-8",
			success:function(result){
				/* $('.center-book-ul1').html(""); */
			 for(var i = 0;i<result.length;i++){
				var str1;
				str1+='<li class="recommended-book-li" style="position:relative;"><div class="pic"><div class="subpic">';
				str1+='<a href="content.jsp?pId='+result[i].pId+'&pUrl='+result[i].pUrl+'&pName='+result[i].pName+'&pAuthor='+result[i].pAuthor+'&pPress='+result[i].pPress+'&pISBN='+result[i].pISBN+'&pPublicationDate='+result[i].pPublicationDate+'&pPage='+result[i].pPage+'&pPrice='+result[i].pPrice+'&pStore='+result[i].pStore+'" target="_blank" ><img alt="'+result[i].pName+'" title="'+result[i].pName+'" src="<%=path %>/img/book/'+result[i].pUrl+'" style="height:160px;width:127.94px;"></a></div></div>'
				str1+='<p class="title"><a href="" target="_blank" title="'+result[i].pName+'">'+result[i].pName+'</a></p>';
				str1+='<p class="yl-author">'+result[i].pAuthor+'</p><p class="price"><span class="price_d">￥<em>'+result[i].pPrice+'</em></span></p></li>';
				var str2 = str1
			 }
				$('.center-book-ul1').append(str2);
				
				//console.log(str1);
			},
			error:function(result){
				
			}
			
		
	})
})
</script>

<%-- <form action="MAILTO:2573430588@qq.com" method="post">
姓名：<input type="text"/><br/>
<input type="submit" value="提交">
</form>
</div>
${userName}
<div class="buy-num-active">
<a href="javascript:;" class="reduce-btn" title="减少">-</a>
<input type="text" class="buy-num-text" id="input_buy_num" value="1" max="53">
<a href="javascript:;" class="add-btn" title="增加">+</a>
</div> --%>
<%-- <div>
<button id="bt-db" style="width:50px;height:50px;">点击</button>
<a href="<%=path%>/index/centerBook">连接到后台</a>
</div> --%>
</body>
</html>