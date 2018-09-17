
/*$(function(){
	alert("ok");
	var i = $('.buy-num-text').val();
	i = i + 1;
	console.log(".buy-num-text"+i);
	$('.buy_num_text').val('i');
})*/

function buy_reduce(){
	var i = $('.buy-num-text').val();
	var j = parseInt(i) - 1;
	$('.buy-num-text').val(j);
	
	if(j<=1){
		console.log("disabled");
		$('.reduce-btn').addClass('disabled');
	}
	if(i==40){
		
	}
	var price = $('#yl_buy_price_total1').html();
	var price1 = price * j;
	console.log("price1=="+price1);
	$('#yl_buy_price_total').html(price1);
	//console.log("price1"+price1);
	
}
function buy_add(){
	
	var i = $('.buy-num-text').val(); 
	console.log("数量"+i);
	var j = parseInt(i) + 1;
	$('.buy-num-text').val(j);
	console.log("j"+j);
	if(i>=1){
		$('.reduce-btn').removeClass('disabled');
	}
	if(i==40){
		$('.add-btn').addClass('disabled');
	}
	var price = $('#yl_buy_price_total1').html();
     
	var price1 = price * j;
	console.log(price1);
	
	$('#yl_buy_price_total').html(price1);
	//console.log("price1"+price1);
}
