<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
     session.setAttribute("path", path);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/bootstrap/css/bootstrap.min.css">
<script src="${path }/bootstrap/js/bootstrap.min.js"></script>
<script src="${path }/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
		$.ajax({
			url:"<%=path%>/buy/bookscar",
			data:JSON.stringify({
				flag:'true'
			}),
			dataType:'json',
			type:'post',
			contentType:"application/json;charset=utf-8",
			success:function(result){
				console.log(result);
				$('#content-tbody').html();
				for(var i=0;i<result.length;i++){
					
				$('#content-tbody').append("<tr><td>"+result[i].bId+"</td><td>"+result[i].bName+"</td><td>"+result[i].bCount+"</td><td>"+result[i].bPrice+"</td><td><button id='buybooks' class='btn btn-primary'>购买</button><button id='deletebooks' class='btn btn-primary'>删除</button></td></tr>");
				}
			},
			error:function(result){
				
			}
		})
	
})
</script>
</head>
<body>
<button id="test"  class="btn btn-primary">测试</button>
<div class="content" style="width:100%;" align="center">
<table class="content-table" style="border:1px blue solid;" border="1">
<tbody id="content-tbody">
<tr><td>订单号</td><td>图书</td><td>数量</td><td>总金额</td><td>操作</td></tr>
</tbody>
</table>
</div>
</body>
</html>