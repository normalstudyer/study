$(function(){
    //当鼠标放在上面和移开时的事件，方法触发 mouseenter 和 mouseleave 事件。
	$('.mainCate').hover(function(){
		$(this).find('.submenu').css("display","block");
	},function(){
		$(this).find('.submenu').css("display","none");
	});
	//退出登录操作
	$('#outLogin').click(function(){
        //此处的basePath已在index.jsp中的js里面定义，可以直接引用了。
		var path = basePath+"user/outlogin";
		$.ajax({
			url:path,
    		data:JSON.stringify({
    			flag:"false"
    		}),
			type:'post',
    		dataType:"json",
    		contentType:"application/json;charset=utf-8",
    		success:function(result){
				console.log(result);
    			if(result.success=="outLogin"){
    				window.location.href = "http://localhost:8080/Shop/index.jsp";
    			}
    		},
    		error:function(result){
    			
    		}
		})
	})
	//$('#dingdan').dialog({ id:'test1', html:'lhgdialog' });
})
function aclick(){
	console.log('已进入aclick页面');
	var dg = $.dialog({   
		id: 'test1',   
		title: '弹出窗口',
		width:'400px',
		height:'400px',
		content:'url:test.jsp',
		//html: 'test.jsp'//也可为地址:例如users/add.do  
	}); 
}
