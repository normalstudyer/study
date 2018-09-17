$(function(){
	$.ajax({
		url:"index/floor-list",
		type:"post",
		dataType:"json",
		data:JSON.stringify({
			data:"成功进入热门图书"
		}),
		contentType:"application/json;charset=utf-8",
		success:function(result){
			var str;
			for(var i=0;i<result.length;i++){
				str+= '<li><div class="subpic"><a href="" target="_blank">';
				str+='<img src="img/book/'+result[i].pUrl+'" style="width:135px;height:135px"></a></div></div>';
			    str+='<div class="name"><a href="" target="_blank">'+result[i].pName+'</a></div>';
			    str+='<div class="price"><span class="price_d">￥<em>'+result[i].pPrice+'</em></span></div></li>';
			}
			$('.book-list-ul').append(str);
		},
		error:function(result){
			
		}
	})
})