<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   String path = request.getContextPath();
     String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
     session.setAttribute("path", path);
     session.setAttribute("basePath",basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>欢迎登录</title>
<%--<link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${path}/jquery.min.js"></script>
<script type="text/javascript" src="${path}/bootstrap/js/bootstrap.min.js"></script>--%>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	body{
		width:100%;
		height: 100%;
		background-image: url(../img/timg.jpg);
		background-repeat: no-repeat;
		/*-webkit-background-size: 100% ;*/
		background-size:100% auto;
	}
        #span1{
            font-family: 微软雅黑;
            font-size: 30px;
            font-weight: bold;
            vertical-align: center;
            color:orange;
        }
        #div_all{
            /* margin-top: 50px; */
            width:100%;
            height:100%;
            vertical-align:center;
           /* background-image: url(/Shop/img/login1.jpg);
            -webkit-background-size: 100% 100%;*/
        }
        #center{
           margin-top:180px;
           position:relative;
           width:400px;
           height:200px;
        }
        #submit1{
           width:100px;
           border-radius: 5px;
           background-color: #3A5FCD;
           color:white;
        }
        #reset1{
           width:100px;
           border-radius: 5px;
           background-color: #3A5FCD;
           color:white;
        }
        #form{
           width:100%;
           height:100%;
           border:1px solid lightblue;
           background-color:#B2DFEE;
           
        }
        .form-group{
           margin-top:15px;
        }
        #form-group1{
           margin-top:10px;
        }
        #form-inline1{
           margin-top:5px;
        }
    </style>
</head>
<body>
<%--<div id="image" style="width:100%;height:100%;">
	<img src="./img/login1.jpg" alt="" height="100%" width="100%">
</div>--%>
	<div id="div_all" align="center">
		<span id="span1">书途网登录界面</span>
		<div id="center">
			<h2>欢迎登录</h2>
			<!-- form-horizontal是创建水平表单的关键，form-inline使其中的控件变成内联关系 -->
			<form id="form" action="" method="post" onsubmit="return mylogin()"
				role="form" class="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-sm-3 control-label"><%--<img
						src="<%=path%>/img/name.png">--%><span class="glyphicon glyphicon-user"></span></label>
					<div class="col-sm-8">
						<input type="text" name="username" placeholder="请输入用户名" id="u1"
							required="required" class="form-control">
					</div>
				</div>
				<div class="form-group" id="form-group1">
					<label for="name" class="col-sm-3 control-label"><%--<img
						src="<%=path%>/img/pwd.png">--%><span class="glyphicon glyphicon-lock"></span></label>

						<div class="col-sm-8">
						<input type="password" name="password" placeholder="请输入密码" id="p1"
							required="required" onkeydown="enterLogin()" class="form-control">
					</div>
				</div>
				<div class="form-inline" id="form-inline1">
					<input type="submit" value="登录" id='submit1' class="form-control">
					<input type="reset" value="重置" id='reset1' class="form-control">
				</div>

				<a href="<%=path%>/jsp/register.jsp" target="_blank">还未注册?请先注册</a>&nbsp;&nbsp;&nbsp;<a
					href="#">找回密码</a><button type="button" class="btn btn-default btn-xs">

			</button>
			</form>
		</div>
	</div>
	<%-- <c:set var="salary" scope="session" value="${2000*2}"/>
<c:if test="${salary < 2000}">
   <p>我的工资为: <c:out value="${salary}"/><p>
</c:if> --%>

<script type="text/javascript">

    function mylogin(){
    	var username = $('#u1').val();
    	var password = $('#p1').val();
    	
    	if(username =="" || password ==""){
    		alert("用户名或密码不能为空");
    		return false;
    	}else{


    	$.ajax({
    		url:"<%=basePath%>user/login",
    		data:JSON.stringify({
    			username:username,
    			password:password,
    			
    		}),
    		/* 在这里有点傻，后端controller返回的是个String，我却在这里用dataType:'json'来接收，所以必须要去掉dataType */
            /* 还是用json比较好，因为后台传回的数据基本上都是List或Map类型的*/
    		dataType:"json",
    		type:"post",
    		contentType:"application/json;charset=utf-8",
    		success:function(result){
    			/*js里面比较字符串用==*/
    			if(result.data=="success"){
    			alert("已成功登录");

    			window.location.href="<%=basePath%>index.jsp";
    			return true;
    			}else{
    				alert("用户名或密码不对");
                    return false;
    			}
            },
    		error:function(result){
    			console.log(result)
    		}
    	})

        }
    }
</script>
<script type="text/javascript">
    function enterLogin(){
    	event=arguments.callee.caller.arguments[0] || window.event; 
    	if(event.keyCode==13){
    		mylogin();
    	}
    }
</script>
</body>
</html>