<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${basePath}bootstrap/css/bootstrap.css/bootstrap.min.css">
	<script type="text/javascript" src="${basePath}bootstrap/js/bootstrap.js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript">
/* $(function(){
	$('#bt').click(function(){
	var start = $('.start').val();
	var size = $('.size').val();
	console.log(start+size);
  })
}) */
$(function(){
	
	
	var start = $('.start').val();
	var size = $('.size').val();
	console.log(start+size);
	$.ajax({
		type:"post",
		dataType:"json",
		url:"user/limit",
		data:JSON.stringify({
			pstart:"0",
			psize:"5"
		}),  
		contentType:"application/json;charset=utf-8",
		success:function(result){
			$('#t-body').html();
			for(var i=0;i<result.length;i++){
				
			$('#t-body').append("<tr><td>"+result[i].pId+"</td><td>"+result[i].pName+"</td><td>"+result[i].pPrice+"</td><td>"+result[i].pStore+"</td></tr>")
			}
		},
		error:function(result){
			
		}
	   
	})
})
</script>
</head>
<body>
<div id="div1" align="center">
<h2>测试分页</h2>
<p><a href="<%=request.getContextPath() %>/test/limit">测试</a></p>
输入行号:<input type="text" class="start"/><br/>
输入条数:<input type="text" class="size"/><br/>
<button id="bt">点击</button>
<table id="table1">
<tbody id="tbody1"></tbody>
</table>

</div>
<div>

<table>
<c:forEach var = "list" items = "${book }">

<tr>
<td>${list.pId}</td>
<td>${list.pName}</td>
<td>${list.pPrice}</td>
<td>${list.pStore}</td>
<td>${list.caType}</td>
<td>${list.pUrl}</td>
<td>${list.mId}</td>
<td>${list.pAuthor}</td>
</tr>
</c:forEach>
<tr></tr>
</table>
</div>
<table>
<tbody id="t-body">

</tbody>
</table>
<button type="button" class="btn btn-default btn-xs">
	<span class="glyphicon glyphicon-user"></span> User
</button>
<!-- <form action="limit" method="post" >
用户名:<input type="text" name="username"/><br/>
密码:<input type="text" name="password"/><br/>
<input type="submit" value="提交">
</form> -->
<%-- <c:set var="date" value="<%=new java.util.Date()%>"></c:set>
<p>现在的时间是:<fmt:formatDate type="time"
             value="${date}" /></p>
<c:set var="now" value="<%=new java.util.Date()%>" />

<p>日期格式化 (1): <fmt:formatDate type="time" 
            value="${now}" /></p> --%>
</body>
</html>