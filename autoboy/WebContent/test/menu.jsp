<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>直接在gig网站修改，测试merge</title>
<style type="text/css">
html, body, div, span, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, address, big, cite, code, del, em, font, img, ins, small, strong, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend {
margin: 0;
padding: 0;
}
.ld {
zoom: 1;
position:relative;
}

#shortcut-2013 .fl b,#shortcut-2013 .fr b {
	background-image:url(http://misc.360buyimg.com/lib/skin/2013/i/20130330A_1.png);
	background-repeat: no-repeat
}

#shortcut-2013,#shortcut-2013 .w {
	height: 30px;
	background: #F7F7F7
}

#shortcut-2013 {
	width: 100%;
	border-bottom: 1px solid #eee;
	line-height: 30px
}

#shortcut-2013 li {
	height: 30px;
	padding: 0 11px 0 12px
}

#shortcut-2013 li s {
	top: 9px;
	left: 0;
	width: 0;
	height: 12px;
	border-left: 1px solid #DDD;
	overflow: hidden
}

#shortcut-2013 b {
	transition: transform .2s ease-in 0s;
	-webkit-transition: -webkit-transform .2s ease-in 0s
}

#shortcut-2013 .fl {
	overflow: visible
}

#shortcut-2013 .fl .fore1 {
	padding-left: 16px;
	z-index: 13
}

#shortcut-2013 .fl b {
	top: 8px;
	left: 0;
	width: 13px;
	height: 13px;
	background: url(http://misc.360buyimg.com/lib/skin/2013/i/20130725.png)
		no-repeat 0 0;
	cursor: pointer
}

#shortcut-2013 .fl li:hover b {
	transform: rotate(720deg);
	-webkit-transform: rotate(720deg)
}

#shortcut-2013 .fl .jtip {
	left: 68px;
	top: 6px;
	width: 120px;
	line-height: 16px
}

#shortcut-2013 .fr {
	height: 30px;
	overflow: visible
}

#shortcut-2013 .fr b {
	top: 13px;
	right: 8px;
	width: 7px;
	height: 4px;
	background-position: -95px -55px
}

#shortcut-2013 .menu {
	width: 60px;
	z-index: 12
}

#shortcut-2013 .dd {
	display: none
}

#shortcut-2013 .hover .outline,#shortcut-2013 .hover .dd {
	position: absolute;
	border: 1px solid #DDD;
	background: #fff;
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .12);
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .12);
	box-shadow: 0 0 10px rgba(0, 0, 0, .12)
}

#shortcut-2013 .hover .outline {
	z-index: -1;
	left: 5px;
	top: 3px;
	width: 73px;
	height: 28px
}

#shortcut-2013 .hover .blank {
	position: absolute;
	z-index: 1;
	top: 23px;
	left: 6px;
	width: 73px;
	height: 8px;
	overflow: hidden;
	background: #fff
}

#shortcut-2013 .hover .dd {
	display: block;
	top: 30px
}

#shortcut-2013 .fr .hover b {
	transform: rotate(180deg);
	-webkit-transform: rotate(180deg);
	filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2)
}


#home-area {
float: left;
position: relative;
z-index: 12;
width: 312px;
height: 30px;
padding-top: 2px;
width: 106px;
margin:0;
}
ul {margin:0;}
.fl {
float: left;
}
.fr {
float: right;
}
.lh li, .lh dl, .lh .item {
float: left;
}
body {
font: 12px/150% Arial,Verdana,"\5b8b\4f53";
color: #666;
}
.ld s, .ld b, .ld .block {
position: absolute;
overflow: hidden;
}
#shortcut-2013 #app-jd {
padding-left: 37px;
}
#app-jd i {
position: absolute;
z-index: 2;
left: 14px;
top: 5px;
width: 13px;
height: 22px;
background-image: url(http://misc.360buyimg.com/lib/skin/2013/i/20130330A_2.png);
background-repeat: no-repeat;
background-position: -128px -360px;
-webkit-transition: all .2s ease;
transition: all .2s ease;
}

#app-jd .dd .qr-code .details {
position: absolute;
left: 103px;
top: 28px;
}
#app-jd .app-btn {
height: 29px;
font-size: 0;
}
#app-jd .dd {
left: 5px;
width: 220px;
padding: 20px 0 20px 20px;
}
#shortcut-2013 .dd {
display: none;
}
.lh {
overflow: hidden;
zoom: 1;
}
</style>
<script type="text/javascript">
function showdiv(){
	document.getElementById("app-jd").className="fore3 ld menu hover";
}
</script>
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css"/>
<link rel="stylesheet" href="http://www.bootcss.com/p/buttons/css/button.css"/>
</head>
<body style="margin:0;">
<div id="shortcut-2013">
	<div class="w">
		<ul class="fl lh">
			<li class="fore1 ld" clstag="homepage|keycount|home2013|01a"><b></b><a href="javascript:addToFavorite()" rel="nofollow">收藏京东</a></li>
		</ul><dl id="home-area">    <dt>        <b></b>        <strong>北京</strong>        <a href="javascript:;">[更换]</a>        <span class="blank"></span>    </dt>    <dd class="dd">        <ul class="lh">             <li><a href="#none" data-id="1">北京</a></li>              <li><a href="#none" data-id="2">上海</a></li>              <li><a href="#none" data-id="3">天津</a></li>              <li><a href="#none" data-id="4">重庆</a></li>              <li><a href="#none" data-id="5">河北</a></li>              <li><a href="#none" data-id="6">山西</a></li>              <li><a href="#none" data-id="7">河南</a></li>              <li><a href="#none" data-id="8">辽宁</a></li>              <li><a href="#none" data-id="9">吉林</a></li>              <li><a href="#none" data-id="10">黑龙江</a></li>              <li><a href="#none" data-id="11">内蒙古</a></li>              <li><a href="#none" data-id="12">江苏</a></li>              <li><a href="#none" data-id="13">山东</a></li>              <li><a href="#none" data-id="14">安徽</a></li>              <li><a href="#none" data-id="15">浙江</a></li>              <li><a href="#none" data-id="16">福建</a></li>              <li><a href="#none" data-id="17">湖北</a></li>              <li><a href="#none" data-id="18">湖南</a></li>              <li><a href="#none" data-id="19">广东</a></li>              <li><a href="#none" data-id="20">广西</a></li>              <li><a href="#none" data-id="21">江西</a></li>              <li><a href="#none" data-id="22">四川</a></li>              <li><a href="#none" data-id="23">海南</a></li>              <li><a href="#none" data-id="24">贵州</a></li>              <li><a href="#none" data-id="25">云南</a></li>              <li><a href="#none" data-id="26">西藏</a></li>              <li><a href="#none" data-id="27">陕西</a></li>              <li><a href="#none" data-id="28">甘肃</a></li>              <li><a href="#none" data-id="29">青海</a></li>              <li><a href="#none" data-id="30">宁夏</a></li>              <li><a href="#none" data-id="31">新疆</a></li>              <li><a href="#none" data-id="32">台湾</a></li>              <li><a href="#none" data-id="42">香港</a></li>              <li><a href="#none" data-id="43">澳门</a></li>              <li><a href="#none" data-id="84">钓鱼岛</a></li>                      <li><a href="http://en.jd.com/chinese.html" target="_blank">海外</a></li>         </ul>        <div class="close" onclick="$('#home-area').removeClass('hover')">×</div>   </dd></dl>
		<ul class="fr lh">
			<li class="fore1" id="loginbar" clstag="homepage|keycount|home2013|01b">您好，欢迎来到京东！<span><a href="javascript:login();">[登录]</a> <a href="javascript:regist();" class="link-regist">[免费注册]</a></span></li>
			<li class="fore2 ld" clstag="homepage|keycount|home2013|01c">
				<s></s>
				<a href="http://jd2008.jd.com/JdHome/OrderList.aspx" rel="nofollow">我的订单</a>
			</li>
			<li class="fore2-1 ld" id="jd-vip">
				<s></s><img width="24" height="11" src="http://misc.360buyimg.com/lib/skin/2013/i/vip-new-ico.png">
				<a target="_blank" rel="nofollow" clstag="homepage|keycount|home2013|huiyuanjulebu" href="http://vip.jd.com">会员俱乐部</a>
			</li>
			<li class="fore3 ld menu" id="app-jd" data-widget="dropdown" clstag="homepage|keycount|home2013|01d" onmouseover="javascript:showdiv();">
				<s></s><i></i><span class="outline"></span><span class="blank"></span>
				<a href="http://app.jd.com/" target="_blank">手机京东</a><b></b>
				<div class="dd lh">
					<div class="qr-code">
						<img id="app-qrcode-img" data-img="1" trigger-lazy-img="done" class="err-product" width="76" height="76" alt="手机京东" src="http://misc.360buyimg.com/lib/skin/2013/i/app_QRcode.png"><i></i>
						<ul><li>智能保养服务</li><li>自助保养服务</li> </ul>
					</div>
					
				</div>
			</li>
			<li class="fore4 ld menu" id="biz-service" data-widget="dropdown" clstag="homepage|keycount|home2013|01e">
				<s></s>
				<span class="outline"></span>
				<span class="blank"></span>
				客户服务
				<b></b>
				<div class="dd"><div><a href="http://help.jd.com/index.html" target="_blank">帮助中心</a></div><div><a href="http://myjd.jd.com/repair/orderlist.action" target="_blank" rel="nofollow">售后服务</a></div><div><a href="http://chat.jd.com/jdchat/custom.action" target="_blank" rel="nofollow">在线客服</a></div><div><a href="http://myjd.jd.com/opinion/list.action" target="_blank" rel="nofollow">投诉中心</a></div><div><a href="http://www.jd.com/contact/service.html" target="_blank">客服邮箱</a></div></div>
			</li>
			<li class="fore5 ld menu" id="site-nav" data-widget="dropdown" clstag="homepage|keycount|home2013|01f">
				<s></s>
				<span class="outline"></span>
				<span class="blank"></span>
				网站导航
				<b></b>
				<div class="dd lh">
					<dl class="item fore1">
						<dt>特色栏目</dt>
						<dd>
							<div><a target="_blank" href="http://my.jd.com/personal/guess.html">为我推荐</a></div>
							<div><a target="_blank" href="http://shipingou.jd.com/">视频购物</a></div>
							<div><a target="_blank" href="http://club.jd.com/">京东社区</a></div>
							<div><a target="_blank" href="http://xiaoyuan.jd.com/">校园频道</a></div>
							<div><a target="_blank" href="http://read.jd.com/">在线读书</a></div>
							<div><a target="_blank" href="http://diy.jd.com/">装机大师</a></div>
							<div><a target="_blank" href="http://market.jd.com/giftcard/">京东卡</a></div>
							<div><a target="_blank" href="http://channel.jd.com/jiazhuang.html">家装城</a></div>
							<div><a target="_blank" href="http://dapeigou.jd.com/">搭配购</a></div>
							<div><a target="_blank" href="http://xihuan.jd.com/">我喜欢</a></div>
						</dd>
					</dl>
					<dl class="item fore2">
						<dt>企业服务</dt>
						<dd>
							<div><a target="_blank" href="http://giftcard.jd.com/company/index">企业客户</a></div>
							<div><a target="_blank" href="http://sale.jd.com/p10997.html">办公直通车</a></div>
						</dd>
					</dl>
					<dl class="item fore3">
						<dt>旗下网站</dt>
						<dd>
							<div><a target="_blank" href="http://www.360top.com/">360TOP</a></div>
							<div><a target="_blank" href="http://www.minitiao.com/">迷你挑</a></div>
							<div><a target="_blank" href="http://en.jd.com/">English Site</a></div>
						</dd>
					</dl>
				</div>
			</li>
		</ul>
		<span class="clr"></span>
	</div>
</div>
<ul>
<i class="fa fa-bell">测试</i>
<i ><span class="fa fa-caret-down fa-5x"></span>测试</i>
</ul>
<div class="col-md-3 col-sm-4">
      <p>
        <a class="btn btn-danger" href="#">
          <i class="fa fa-trash-o fa-lg"></i> Delete</a>
        <a class="btn btn-default btn-sm" href="#">
          <i class="fa fa-cog"></i> Settings</a>
      </p>
      <p>
        <a class="btn btn-lg btn-success" href="#">
          <i class="fa fa-flag fa-2x pull-left"></i> Font Awesome<br>Version 4.0.3</a>
      </p>
      <div class="margin-bottom">
        <div class="btn-group">
          <a class="btn btn-default" href="#"><i class="fa fa-align-left"></i></a>
          <a class="btn btn-default" href="#"><i class="fa fa-align-center"></i></a>
          <a class="btn btn-default" href="#"><i class="fa fa-align-right"></i></a>
          <a class="btn btn-default" href="#"><i class="fa fa-align-justify"></i></a>
        </div>
      </div>
      <div class="margin-bottom">
        <div class="input-group margin-bottom-sm">
          <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
          <input class="form-control" type="text" placeholder="Email address">
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
          <input class="form-control" type="password" placeholder="Password">
        </div>
      </div>
      <div class="margin-bottom">
        <div class="btn-group">
          <a class="btn btn-primary" href="#"><i class="fa fa-user fa-fw"></i> User</a>
          <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
            <span class="fa fa-caret-down"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#"><i class="fa fa-pencil fa-fw"></i> Edit</a></li>
            <li><a href="#"><i class="fa fa-trash-o fa-fw"></i> Delete</a></li>
            <li><a href="#"><i class="fa fa-ban fa-fw"></i> Ban</a></li>
            <li class="divider"></li>
            <li><a href="#"><i class="i"></i> Make admin</a></li>
          </ul>
        </div>
      </div>

    </div>
</body>
</html>
