<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ch-ZN" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>地址管理</title>
    <meta name="description" content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
    <meta name="	black friday, coupon, coupon codes, coupon theme, coupons, deal news, deals, discounts, ecommerce, friday deals, groupon, promo codes, responsive, shop, store coupons">
    <meta name="robots" content="index, follow">
    <meta name="author" content="CODASTROID">
	
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
    <link href="assets/dzrcss/base.min.css" rel="stylesheet">
    <link href="assets/dzrcss/main.min.css" rel="stylesheet">

</head>

<body class="wide-layout">
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



		<%String addrstatus=(String)request.getSession().getAttribute("addrstatus");
	request.getSession().removeAttribute("addrstatus");
	%>
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
<div class="mod_acc_tip layereditinfo" id="pop2" style="display: none;width:600px; height:450px">
  <div class="mod_tip_hd">
    <h4>新增地址</h4>
    <a class="btn_mod_close" href="" title=""><span>关闭</span></a>
  </div>
  <div class="mod_tip_bd">
    <form action="insertAddress.action" method="post">      
    <div class="wapbox editbasicinfo">
      
      <div>
       	 姓名:
      	<label class="labelbox"><input class="nickname" type="text" name="recv_people" maxlength="20" placeholder="收货人"></label>
       </div>
       
       <div> 
       	 电话:
      <label class="labelbox"><input type="text" name="telephone" maxlength="11" placeholder="联系电话"></label>
        </div>  
        
        <div>选择地址:
       
       	<label class="labelbox">
	<select name="province" id="province">
		<option value="请选择">请选择</option>
	</select>
	<select name="city" id="city">
		<option value="请选择">请选择</option>
	</select>
	<select name="town" id="town" onchange="getpath()">
		<option value="请选择">请选择</option>
	</select>
       	</label>
       	
       	<input type="hidden" name="areaPath" id="areaPath">
        </div>    
        	
         <div> 
       	详细地址:
      <textarea name="detail_address"  placeholder="详细地址" cols="60" rows="5"></textarea>	
        </div>  
        
        <div>
       	 邮政编码:
      	<label class="labelbox"><input class="nickname" type="text" name="zip_code" maxlength="20" placeholder="邮政编码"></label>
       </div>



</div>
       
       
       
       
        
    

    </div>      
    <div class="tip_btns">
      
       <input class="btn_tip btn_commom" type="submit" value="保存"> 
      <a class="btn_tip btn_back" onclick="show();" title="取消">取消</a>
    </div>
    </form> 
  </div>  
</div>
</div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <div class="page-content col-xs-12 col-sm-7 col-md-9">
    
    <div class="uc-box uc-main-box">
        <div class="uc-content-box">
            <div class="box-hd">
                <h1 class="title">收货地址</h1>
            </div>
            <div class="box-bd">
                <div class="user-address-list J_addressList clearfix">
                    <div class="address-item address-item-new" id="J_newAddress">
                        <i class="iconfont" onclick="show();"></i>
                        添加新地址
                    </div>
                           
                           
                           <c:forEach items="${addresslist}" var="al">
                            <c:if test="${al.isdefault==1}">
                            <div class="address-item J_addressItem" style="border-width:2px; border-style:solid; border-color:#ff6700;">
                            </c:if>
                            
                            <c:if test="${al.isdefault==0}">
                            <div class="address-item J_addressItem" >
                            </c:if>
                            
                                <dl>
                                    <dt>
                                       <em class="uname">${al.recv_people}
                                       
                                       <c:if test="${al.isdefault==1}">
                                          (默认)
                                        </c:if>
                                       </em>
                                    </dt>
                                    <dd class="utel">${al.telephone}</dd>
                                    <dd class="uaddress">${al.areaPath}  <br>${al.detail_address} (${al.zip_code}) </dd>
                                </dl>
                                <div class="actions">
                                <c:if test="${al.isdefault==0}">
                                    <a class="modify J_addressModify"  href="updateDefault.action?address_id=${al.address_id}">设为默认</a>
                                </c:if>
                                    <a class="modify J_addressDel"  href="deleteAddress.action?address_id=${al.address_id}">删除</a>
                                </div>
                            </div>
                            
                            
                           </c:forEach>
                            
                            
                            
                            
                                   </div>
                                   
            </div>
        </div>
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
    <script src="assets/dzrjs/jquery-1.11.3.min.js"></script>
	<script src="assets/dzrjs/area.js"></script>
	<script src="assets/dzrjs/select.js"></script>  
<script type="text/javascript">
window.onload=function(){
	var addrstatus="<%=addrstatus%>";
	if(addrstatus!="null"){
		alert(addrstatus);
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

function getpath(){
	var var1=$("#province").val();
	var var2=$("#city").val();
	var var3=$("#town").val();
	$("#areaPath").val(var1+var2+var3);
	
}
</script>


</body>

</html>
