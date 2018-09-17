$(function(){
	$('#btn_buy').click(function(){
		var bName = $('#name_h2').html();
		var bCount = $('.buy-num-text').val(); 
		var bPrice = $('#yl_buy_price_total1').html();
		$.ajax({
			url:"/Shop/buy/shopping",
    		data:JSON.stringify({
    			bName:bName,
    			bCount:bCount,
    			bPrice:bPrice
    		}),
    		type:'post',
    		dataType:"json",
    		contentType:"application/json;charset=utf-8",
    		success:function(result){
    			if(result=="outLogin"){
    				window.location = "<%=basePath%>index.jsp";
    			}
    		},
    		error:function(result){
    			
    		}
		})
	})
})