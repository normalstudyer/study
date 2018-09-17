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