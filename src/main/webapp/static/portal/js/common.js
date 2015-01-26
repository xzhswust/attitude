function setBanner(){
	var temp=$(window).height();
	$('.mainbanner .picbox li').css('height',temp);
	$('.mainbanner .picbox').css('height',temp);
}
$(function(){
	//顾客说图片墙整数图片
	var twidth=$(window).width();//获取浏览器宽度
	$('.gukeshuo').width(parseInt((twidth*0.91)/100)*100);//设置浏览器宽度所能排下100宽头像的整数个
	$(window).resize(function(){//定义调整浏览器窗口时的函数
  	var t=$(window).width();//获取浏览器宽度
	$('.gukeshuo').width(parseInt((twidth*0.91)/100)*100);//设置浏览器宽度所能排下100宽头像的整数个
	});
	//防止不对齐
	$('.headwall').click(function(){
		if(!$(".yonghuliuyan").is(":animated")){ 
 		$('.dobest').remove();
		$('.yonghuliuyan').hide();
		$(this).find('.yonghuliuyan').fadeIn();	
	} 
 	})
	$('.yonghuliuyan').click(function(){
		$(this).fadeOut();
		
	});
	//顾客说中间遮罩点击消失
	$('.dobest').click(function(){
		$(this).remove();
	});
	$('.fruitright a').click(function(){
		$('.fruitbox').show();
		return false;
	})
	$('.close').click(function(){
		$('.fruitbox').hide();
		return false;
	})
	//$('#gx').click(function(){
	//	$("html,body").animate({scrollTop:$(".gx").offset().top},2000);
	//});
	//$('#ts').click(function(){
	//	$("html,body").animate({scrollTop:$(".ts").offset().top},2000);
	//});
	//2015-1-24修改，将动画时间调整为1ms实现立即跳转
	$('#gx').click(function(){
		$("html,body").animate({scrollTop:$(".gx").offset().top},1);
	});
	$('#ts').click(function(){
		$("html,body").animate({scrollTop:$(".ts").offset().top},1);
	});
	//
	$(".mainbanner").slide({mainCell:".picbox ul",autoPlay:true,effect:'fade',interTime:5000});
	$('.addmore').click(function(){
		$(this).toggleClass('addmore2');
		$(this).parent().find('.addmorebox').slideToggle();
	})

	
});