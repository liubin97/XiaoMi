<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ch-ZN" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改密码</title>
    <meta name="description" content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
    <meta name="	black friday, coupon, coupon codes, coupon theme, coupons, deal news, deals, discounts, ecommerce, friday deals, groupon, promo codes, responsive, shop, store coupons">
    <meta name="robots" content="index, follow">
    <meta name="author" content="CODASTROID">
    <link href="assets/dzrcss/base.min.css" rel="stylesheet">
    <link href="assets/dzrcss/main.min.css" rel="stylesheet">
    <link rel="apple-touch-icon" href="assets/images/favicon/apple-touch-icon.png">
    <link rel="icon" href="assets/images/logo.png">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/vendors/linearicons/css/linearicons.css" rel="stylesheet">
    <link href="assets/vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/vendors/owl-carousel/owl.theme.min.css" rel="stylesheet">
    <link href="assets/vendors/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/css/base.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
	<link href="assets/dzrcss/layout.css" rel="stylesheet">
	<link href="assets/dzrcss/reset.css" rel="stylesheet">
	<link href="assets/dzrcss/modacctip.css" rel="stylesheet">
</head>

<body class="wide-layout">


<%String status=(String)request.getSession().getAttribute("status");
	request.getSession().removeAttribute("status");
	%>


<style type="text/css">
/*启用修改头像功能*/
.na-img-area:hover .na-edit{
	display:block;
	cursor: pointer;
}
.na-img-area{cursor:default}
/*popup的遮层*/
.popup_mask{
	position:fixed;
	z-index:99;
	width:100%;
	height:100%;
	left:0;
	top:0;
	display:none;
	_position:absolute;
	_height: 1000px;
}
.popup_mask .mod_wrap{
    height: 100%;
    overflow-y: auto;
    position: absolute;
    width: 100%;
    z-index: 1;
}
.popup_mask .bkc{
	position:absolute;
	width:100%;
	height:200%;
	left:0;
	top:0;
	background-color:#333;
	filter: alpha(opacity=70);
	opacity:0.7;
}
.popup_mask .mod_acc_tip{
	display:none;
	position:absolute;
	left:50%;
	margin-left:-206px;
	top:50%;
	margin-top:-187px;
	_top: 500px;
}
/*剪切图片的水平、垂直居中及模糊*/
.clipimg{
	text-align: left;
	position: relative;
}
.clipimg img{
	max-width:300px;
	max-height:300px;
	/*
	filter: alpha(opacity=70);
	opacity: .7;
	*/
	position: absolute;
}
/*clip部分*/
.clipimg .movebox{
/*
	background-position: 50% 50%;
	background-repeat: no-repeat;
	*/
	border: 1px solid #00aeff;
}
.uploadimgs{
	filter: none;
	opacity: 1;
}
.clipimg .movebox{
	width: 98px;
	height: 98px;
	z-index:1000;
	background-image:url(#);
}
/*上传*/
#photoUploader .uplodefile{
	font-size: 45px;
	*vertical-align: bottom;
}
::-webkit-file-upload-button { cursor:pointer; }
/*干掉该死的IE6的遮罩问题*/
#loadingMask .bkc{
	_height:2000px;
}
/*wap*/
.bugfix_ie6{ display:block;}	
</style>
	
<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>
    
    <div class="page-container ptb-30">
        <div class="container">
<div class="row row-rl-10 row-tb-20">
   <div class="page-sidebar col-md-3 col-sm-5 col-xs-12">
                <div class="uc-box uc-sub-box">
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">账户管理</h3>
                        </div>
                        
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="">修改信息</a></li>
								<li><a href="">修改密码</a></li>                                                    
							</ul>
                        </div>
                        
                    </div>
  					
  					<div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">个人中心</h3>
                        </div>
                        
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li class="active"><a href="searchFavorite.action?searchkey=">我喜欢</a></li>
								<li><a href="">我的订单</a></li> 
								<li><a href="">团购订单</a></li>  
								<li><a href="">评价晒单</a></li>  
								<li><a href="">消息中心</a></li> 
								<li><a href="">地址管理</a></li>                                                  
							</ul>
                        </div>
                        
                    </div>
  					
                </div>
            </div>
            
            
            
            
            
            
            
            
            
            <div class="popup_mask" id="pop1" style="display: none;">
		<div class="bkc"></div>
	<div class="mod_wrap">
		<div id="pop2" class="mod_acc_tip layereditinfo"  style="display: none; ">
			<div class="mod_tip_hd">
				
						<h4>修改密码</h4>
					
				<a class="btn_mod_close" href="" title=""><span>关闭</span></a>
			</div>
			<div class="mod_tip_bd">
				<div class="modify_pwd">
				
				
					<dl>
		      	<form action="editPsw.action" method="post">
              <dt>原密码</dt>
                <dd class="grpOldPass">
                  <div class="inputbg">
                    <label class="labelbox pwd_panel c_b">
                      <input class="oldPass hidePwd" type="password" name="oldpassword" placeholder="输入原密码" autocomplete="off" disableautocomplete="">
                      
                      <div class="eye_panel pwd-visiable dis_none_pc">
                        <i class="eye pwd-eye">
                          <svg width="100%" height="100%" version="1.1" xmlns="http://www.w3.org/2000/svg">
                            <path class="eye_outer" d="M0 8 C6 0,14 0,20 8, 14 16,6 16, 0 8 z"></path>
                            <circle class="eye_inner" cx="10" cy="8" r="3"></circle>
                          </svg>
                        </i>
                      </div>
                    </label>
                  </div>
    
                </dd>
							
						<dt>新密码</dt>
						<dd class="grpNewPass">
							<div class="inputbg">
                <label class="labelbox pwd_panel c_b">
                  <input class="newPass hidePwd set-password" type="password" name="newpassword" data-error=".error-password" placeholder="输入新密码" autocomplete="off" disableautocomplete="">
                  
                  <div class="eye_panel pwd-visiable dis_none_pc">
                    <i class="eye pwd-eye">
                    <svg width="100%" height="100%" version="1.1" xmlns="http://www.w3.org/2000/svg">
                      <path class="eye_outer" d="M0 8 C6 0,14 0,20 8, 14 16,6 16, 0 8 z"></path>
                      <circle class="eye_inner" cx="10" cy="8" r="3"></circle>
                    </svg>
                    </i>
                  </div>
                </label>
     
              </div>
              </dd>
              
         			</dl>
         			
		</div>
		
				<div class="tip_btns">
					<input class="btn_tip btn_commom" type="submit" value="确定">
					<a class="btn_tip btn_back btnCancel" onclick="show();" title="取消">取消</a>
				</div>
				</form>
	</div>

		</div>
	</div>
</div>
            
            
            
            
            
            
            
            
            <div class="page-content col-xs-12 col-sm-7 col-md-9">
    
    
    
    <div class="n-frame">
        <div class="title-item title_security_wap security_level">
          <h4 class="title-big dis-inb">密码安全等级</h4>
          <em class="space6"></em>
          <p class="font-normal dis-inb wap_colb2"><em class="light-num" style="padding:0">
			  	
						<span class="score_1">40</span>
					
		  </em>分</p>
          <div class="slider-area dis-inb vert-m" style="width:360px;">
            <div class="slider-bar-bg"></div>
            <div class="slider-bar-line score_bg_1" style="width:40%;"></div>
            <em class="drag-ico" style="left:40%"></em>
          </div>
         
        </div>
        <div class="title-item title_security_wap dis_none_pc">
          <h4 class="title-big dis-inb">基本资料</h4>
        </div>
        <ul class="device-detail-area">
          <li id="changePassword" class="click-row">
            <div class="font-img-item clearfix">
              <em class="fi-ico fi-ico-lock"></em>
              <p class="title-normal dis-inb">帐号密码</p>
			  
					<p class="font-default">
						用于保护帐号信息和登录安全
					</p>
				
			  
			  
					<span class="title-normal wap-desc dis_none_pc">
		      	
								修改
							
					</span>
					
				<i class="arrow_r"></i>
        	  </div>
			  
					
				
            <div class="ada-btn-area" id="btnUpdatePassword">
              <a onclick="show();" class="n-btn">
              	
        						修改
        					
              </a>
            </div>
          </li>
          
          
          <li id="changeEmail" class="click-row">
            <div class="font-img-item clearfix">
              <em class="fi-ico fi-ico-email"></em>
              <div class="item_column">
                <p class="title-normal dis-inb">个人信息</p> 
                
              </div>
       
                  <p class="font-default ">管理个人信息</p>
                
              <i class="arrow_r"></i>				
          	</div>
            <div class="ada-btn-area" id="btnUpdateEmail">
            
              <!--无地址-->
                <a href="modifyuser.jsp" class="n-btn">修改</a>
              
            </div>
          </li>
         
      	</ul>
		<!--
        <div class="title-item">
          <h4 class="title-big dis-inb">
			  	
					 
		  </h4>
        </div>
		-->
	</div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</div>
        </div>    
            </div>
            </div>
            
            


    <c:import url="footer.jsp"/>
</div>



<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script src="assets/vendors/modernizr/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="assets/vendors/owl-carousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/vendors/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="assets/vendors/countdown/jquery.countdown.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>

<script type="text/javascript">



window.onload=function(){
	var status="<%=status%>";
	if(status!="null"){
		alert(status);
	}
}
function show(){
	if($("#pop1").css("display")=="none"){
		$("#pop1").css("display","block");
		$("#pop2").css("display","block");
	}else{
		$("#pop1").css("display","none");
		$("#pop2").css("display","none");
	}
}
</script>


</body>

</html>
