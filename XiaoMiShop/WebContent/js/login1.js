

$('#mpanel1').pointsVerify({
	
    mode : 'fixed',
    defaultNum : 5,
    checkNum : 4,
    vSpace : 0,
    imgUrl : 'asset/img/',
    imgName : ['1.jpg', '2.jpg','3.jpg'],
     imgSize : {
	    width: '100%',
	    height: '200px',
    },
    barSize : {
	    width: '100%',
	    height : '40px',
    },
    ready : function() {
    },
    success : function() {
    	alert('验证匹配！');
		changeFlag();
    },
    error : function() {
    	alert('验证码不匹配！');
    }
    
});
	
