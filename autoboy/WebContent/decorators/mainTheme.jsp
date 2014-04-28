<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.autoboys.util.*"%>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"  prefix="decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.rg/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico" type="image/x-icon">
<meta name="keywords" content="">
<meta name="description" content="养车客，中国领先的养车生活服务平台，免费为车主提供汽车保养、维修、美容、改装等车生活解决方案，免费为车主甄别优质的汽车服务商家，提供公开、透明的产品价格，解决车主的养车烦恼，让车生活变得更加简单惬意！">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/autoboys.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/mootools.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/silunzi.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/common.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/autoboys.js"></script>
<decorator:head />
<title><decorator:title default="养车客，让车生活更加简单惬意" /></title>

<script type="text/javascript">
	window.addEvent('domready', function() {

		$('hover').addEvents({
			'mouseover' : function() {
				$('maintenance_wrap').setStyle('display', 'block');
			},
			'mouseout' : function() {
				$('maintenance_wrap').setStyle('display', 'none');
			}
		});
		
		/*
		var lia = $('new_select_bypin').getElements('a');
		lia.addEvent('click',function(){
			var fc = this.get('text');
			silunziUtil.sendLoad($('step1'), silunzi.util.basePath+'ajax/common/getBrands.action',{'fc':fc},function(result){});
			$('step2').setStyle('display','none');
			$('step3').setStyle('display','none');
			$('step1').setStyle('display','block');

		});
		*/
		
	});
</script>
</head>
<%
String url = request.getRequestURI();
String indexClass = "";
String serviceClass="";
String storeClass="";
String chewenClass="";
if(url.indexOf("store/") > 0) 
	storeClass = "cur";
else if(url.indexOf("service/") > 0)  
	serviceClass = "cur";
else if(url.indexOf("chewen/") > 0)  
	chewenClass = "cur";
else
	indexClass="cur";

%>
<body class="logged-out ytype" screen_capture_injected="true">
	<div class="app-header">
		<div id="mastHead" class="header-container clearfix">
			<div class="logo">
				<a href="/">养车客</a>
			</div>

			<div class="hr">
				<div id="nav-shortcut">
					
				</div>
				<div class="guarantee">
					<a href="#" rel="nofollow"
						class="quality"><span>正品保障</span>&nbsp;全场正品，假一罚十</a> <a
						href="#" rel="nofollow"
						class="funds"><span>资金保障</span>&nbsp;养车客维权，先行赔付</a>
				</div>
			</div>
		</div>

	</div>


	<div class="div_nav">
		<div class="nav_content">
			<div class="navLeft">
				<ul>

					<li class="<%=indexClass%>"><a class="currot menua"
						href="<%=request.getContextPath()%>/main.action" ><span>首页</span></a></li>
					<li id="hover" class="autoservice <%=serviceClass%>"><a class="menua"
						href="" >汽车服务<i class="icon-chevron-down"></i></a>
						<div id="maintenance_wrap" style="display: none;">
							<div id="automaintenance" class="automaintenance"></div>
							<div class="maintenancelist">
								<div class="pmain">
									<b class="ptitle" style="float:left;"><i class="icon-hand-right"></i>保养项目查询</b><span style="margin-left:10px;">（我也不知道保养啥项目，查询一下）</span>
									<div class="psearch">
										<dl>
											<dt>
												<span>已行驶：</span>
												<div><input type="text" id="nav_CurMileage" maxlength="7" value=""> </div>
												<span>公里；</span></dt>
											<dd>
												<span>新车购买于：</span>
												<ol>
													<li>
														<div class="newSel">
															<div class="newInput" id="nav-txt-roadyears" name="2009">2009年</div>
															<a class="NewSelBut" href="javascript:;"
																id="nav-arrow-roadyears"></a>
															<div class="clearfix"></div>
															<div style="display: none;" class="newSelLayer"
																id="nav-roadyears">
																<ul>
																	<li><a class="autoitem" href="javascript:;"
																		name="0">年份</a></li>
																	<li><a class="autoitem" href="javascript:;"
																		name="2014">2014年</a></li>
																	<li><a class="autoitem" href="javascript:;"
																		name="2013">2013年</a></li>
																	<li><a class="autoitem" href="javascript:;"
																		name="2012">2012年</a></li>
																	<li><a class="autoitem" href="javascript:;"
																		name="2011">2011年</a></li>
																	<li><a class="autoitem" href="javascript:;"
																		name="2010">2010年</a></li>
																	<li><a class="autoitem" href="javascript:;"
																		name="2009">2009年</a></li>
																</ul>
															</div>
														</div>
													</li>
													<li>
														<div class="newSel">
															<div class="newInput" id="nav-txt-roadmonth" name="8">8月</div>
															<a class="NewSelBut" href="javascript:;"
																id="nav-arrow-roadmonth"></a>
															<div class="clearfix"></div>
															<div style="display: none;" class="newSelLayer"
																id="nav-roadmonth">
																<ul>

																</ul>
															</div>
														</div>
													</li>
													<div class="clearfix"></div>
												</ol>
												<div class="clearfix"></div>
											</dd>
											<div class="psearchBut">
												<form action="/auto/service/proposal.action?act=zn" method="post">
													<button type="submit" class="btn btn-small btn-primary">看看需要做哪些保养</button>
												</form>
											</div>
										</dl>
										
										
										<div class="c"></div>
									</div>
									<div class="clearfix"></div>
									<!--psearch-->
									<b class="ptitle" style="float:left;"><i class="icon-hand-right"></i>直接选择保养项目</b><span style="margin-left:10px;">（知道需要什么服务，快速选择）</span>
									<div class="pproject">
										<dl>
											<dt>保养类服务</dt>
											<dd>
												<ol>
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100101">更换机滤</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100102">更换空气滤芯</a></li>                        
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100103">更换空调滤芯</a></li>                        
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100104">更换汽油滤芯</a></li>                        
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100105">更换变速箱油</a></li>                        
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100106">清洗喷油嘴</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100107">更换刹车油</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100108">更换防冻液</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100109">更换助力油</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100110">更换火花塞</a></li>                         
													<!-- li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100111">更换蓄电池</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100112">保养计划</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=100113">皮带类？？？</a></li -->   
												</ol>
											</dd>
										</dl>

									</div>
									<!--pproject-->
									<div class="c"></div>
									<div class="pproject">
										<dl>
											<dt>轮胎类服务</dt>
											<dd>
												<ol>
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=101101">四轮定位</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=101102">车轮动平衡</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=101103">轮胎换位</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=101104">补胎/轮胎修复</a></li>                       
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=101105">胎压监测</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=101106">轮毂修复</a></li>   

												</ol>
											</dd>
										</dl>
										<div class="c"></div>
									</div>
									<!--pproject-->
									<div class="c"></div>
									<div class="pproject">
										<dl>
											<dt>检修类服务</dt>
											<dd>
												<ol>
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=102101">刹车类(检测+更换)</a></li>                   
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=102102">转向和悬挂</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=102103">皮带软管类</a></li>   

												</ol>
											</dd>
										</dl>
										<div class="c"></div>
									</div>
									
									<!--pproject-->
									<div class="c"></div>
									<div class="pproject">
										<dl>
											<dt>美容类服务</dt>
											<dd>
												<ol>
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=103101">车身打蜡</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=103102">内室清洗</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=103103">划痕修复</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=103104">车身封釉</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=103105">车身镀膜</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=103106">消毒去味</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=103107">皮革护理</a></li>    

												</ol>
											</dd>
										</dl>
										<div class="c"></div>
									</div>
									<!--pproject-->
									<div class="c"></div>
									<div class="pproject">
										<dl>
											<dt>特殊类服务</dt>
											<dd>
												<ol>
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104101">改装音响</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104102">改装悬挂</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104103">发动机调优</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104104">加装倒车雷达</a></li>                        
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104105">加装倒车影像</a></li>                        
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104106">换真皮座椅</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104107">灯光改装</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104108">定制脚垫</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104109">定制座椅套</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104110">加装导航</a></li>                          
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104111">加装日行灯</a></li>                         
													<li> <a  class="sitem" href="<%=request.getContextPath() %>/service/proposal.action?act=zx&s=104112">其他</a></li>     

												</ol>
											</dd>
										</dl>
										<div class="c"></div>
									</div>
								</div>

							</div>
							<!--packlist-->



						</div></li>
					<li class="<%=storeClass%>"><a class="menua"
						href="<%=request.getContextPath()%>/store/main.action"
						>周边商家</a></li>
					<li class="<%=chewenClass%>" id="topnav_club"><a class="menua"
						href="<%=request.getContextPath()%>/chewen/chewen.action"
						>车问答</a></li>
					<li class="" id="topnav_club"><a class="menua" href=""
						>车友会</a></li>

					<div class="c"></div>
				</ul>
			</div>
			<div class="navRights"></div>
			<div class="c"></div>


		</div>
	</div>
	<div id="wrap">



		<!--  div super-container start -->
		<div id="super-container">
			
				<decorator:body />
			
		</div>
		<!--  div super-container end -->
		<div class="footer">
			<div class="footer-wrap">
				<div class="footer-menu-wrap ">
					<div class="footer-menu first">
						<h3 class="menu-header gy">关于</h3>
						<ul class="menu-list">
							<li><a href="/about">关于养车客</a></li>
							<li><a href="#">联系我们</a></li>

						</ul>
					</div>

					<div class="footer-menu swhz">
						<h3 class="menu-header">商务合作</h3>
						<ul class="menu-list">
							<li><a href="/faq">招商政策</a></li>
							<li><a href="/advertise">商家入驻流程</a></li>
							<li><a href="/guidelines">广告洽谈</a></li>

						</ul>
					</div>

					<div class="footer-menu bzzx">
						<h3 class="menu-header">帮助中心</h3>
						<ul class="menu-list">
							<li><a href="/careers?country=US">常见问题</a></li>
							<li><a href="/yelpmobile">How it work</a></li>

						</ul>
					</div>
					<div class="footer-menu provider-entry">
						<h3 class="menu-header">商家入驻</h3>
						<a href="<%=request.getContextPath() %>/provider/provider_login.action" class="btn btn-large btn-block btn-primary">服务商入口</a>
						
					</div>
					<div class="follow footer-menu">
						<h3 class="menu-header">关注养车客</h3>
						<img src="<%=request.getContextPath() %>/image/follow_me_weixin.png" width="100px"/>
						
					</div>
				</div>
				<p class="copyright lesser-text"><span style="margin-right:20px;">服务热线：400-188-6666（免长话）</span>Copyright © 2014–2018 All Right Reserved yangcheke.com. 沪ICP备08109440</p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.addEvent('domready', function() {
			nav.init();

		});
	</script>

	<style>
.tab_list {
	overflow: hidden;
	display: none;
}

.new_select_box_top {
	height: 50px;
	line-height: 50px;
	font-size: 14px;
	font-weight: bold;
	color: #2e3032;
	padding: 0px 20px;
}

.new_select_box_top a {
	margin-left: 10px;
	font-weight: normal;
	font-size: 12px;
	color: #2c89f1;
	text-decoration: underline;
}

.new_select_box_vin {
	border: 1px solid #ebebeb;
	margin: 0px 20px;
	overflow: hidden;
	height: 95px;
	background: url(http://img.chemayi.com/public/select_bar_bg1.png)
		repeat-x;
	padding: 0px 13px;
}

.vin_top {
	margin-top: 9px;
	overflow: hidden;
}

.vin_top span {
	display: block;
	float: left;
	height: 30px;
	width: 33px;
	margin-left: 6px;
	text-align: center;
	line-height: 30px;
	color: #6c6c6c;
}

.vin_input {
	overflow: hidden;
}

.vin_input span {
	width: 31px;
	height: 36px;
	border: 1px solid #9c9c9c;
	margin-left: 6px;
	overflow: hidden;
	display: block;
	float: left;
}

.vin_input span input {
	width: 31px;
	height: 36px;
	border: none;
	border: 0;
	text-align: center;
	line-height: 36px;
	outline: none;
}

.vin_link {
	height: 46px;
	line-height: 46px;
	margin: 0px 20px;
}

.vin_link a {
	margin-right: 25px;
	color: #2298dc;
}

.vin_link a:hover {
	text-decoration: underline;
}

.new_select_box_progress {
	height: 42px;
	margin-top: 10px;
	overflow: hidden;
	margin: 0 10px 0px;
	background: url(/auto/image/process.png) no-repeat;
}

.new_select_box_progress a {
	width: 25%;
	display: block;
	height: 28px;
	cursor: pointer;
	float: left;
}

.new_select_box_progress a.nolink {
cursor: text;
}

.progress1 {
	background-position: -4px -8px;
}

.progress2 {
	background-position: -4px -48px;
}

.progress3 {
	background-position: -4px -88px;
}

.progress4 {
	background-position: -4px -128px;
}

.new_select_box_hasselect {
	margin: 6px 10px 10px;
	display: none;
	overflow: hidden;
}

.new_select_box_hasselect em {
	display: block;
	float: left;
	height: 34px;
	line-height: 34px;
	font-style: normal;
	color: #333;
	font-weight: bold;
}

.new_select_box_hasselect .cartype {
	padding: 5px 5px 0 0;
	overflow: hidden;
	display: block;
	float: left;
	margin-left: 17px;
	position: relative;
}

.new_select_box_hasselect .cartype a {
	position: absolute;
	display: block;
	top: 0px;
	right: 0px;
	cursor: pointer;
}

.new_select_box_hasselect .cartype span {
	width: 85px;
	height: 28px;
	border: 1px solid #fa5f19;
	background: #ffebdc;
	padding: 0px 19px;
	display: block;
	text-align: center;
	line-height: 28px;
	color: #fa5f19;
}

.new_select_bypin {
	height: 30px;
	padding-top: 10px;
	margin-left: 10px;
	overflow: hidden;
}

.new_select_bypin span {
	color: #333;
	font-weight: bold;
	font-size: 13px;
	display: block;
	float: left;
	line-height: 20px;
}

.new_select_bypin a {
	display: block;
	float: left;
	width: 19px;
	height: 17px;
	border: 1px solid #fa5f19;
	line-height: 18px;
	text-align: center;
	font-size: 12px;
	color: #fa5f19;
	margin-right: 9px;
}

.new_select_bypin a.hot {
	width: 31px;
	height: 23px;
	background: url(http://img.chemayi.com/service/hot.png) no-repeat;
	line-height: 20px;
	text-align: center;
	color: #fff;
	font-size: 12px;
	margin-right: 10px;
	border: none;
}

.new_select_bypin a.cur_letter {
	
}

.new_select_box_content {
	height: 206px;
	overflow: hidden;
	border: 1px dashed #c5c5c5;
	border-left: none;
	border-right: none;
	overflow-y: auto;
	position: relative;
	margin: 0px 10px;
}

.step1 {
	overflow: hidden;
}

.step1 ul {
	width: 698px;
	overflow: hidden;
}

.step1 ul li {
	width: 145px;
	height: 36px;
	overflow: hidden;
	float: left;
	margin: 15px 17px 0px 0px;
	border: 1px solid #cdcdcd;
	padding: 4px;
	position: relative;
	color: #6c6c6c;
	line-height: 36px;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	border-radius: 2px;
}

.step1 ul li .logo {
	width: 32px;
	height: 32px;
	overflow: hidden;
	position: absolute;
	margin: 2px 0;
	left: 10px;
}

.step1 ul li b {
	display: block;
	height: 36px;
	line-height: 36px;
	margin-left: 51px;
	border-left: 1px solid #e5e5e5;
	padding-left: 10px;
}

.step1 ul li em {
	display: block;
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(/auto/image/selected.jpg) no-repeat;
	display: none;
}

.step1 ul li.hover {
	background: #ffebdc;
	border: 1px solid #fa5f19;
	color: #fa5f19;
}

.step1 ul li.hover b {
	border-left: 1px solid #faa57a;
}

.step1 ul li.cur {
	background: #fa5f19;
	border: 1px solid #fa5f19;
	color: #fff;
}

.step1 ul li.cur em {
	display: block;
}

.step1 ul li.cur b {
	border-left: 1px solid #efa27f;
}

.step2 {
	display: none;
	overflow: hidden;
}

.step2 dl {
	width: 764px;
	overflow: hidden;
}

.step2 dl dt {
	font-size: 14px;
	font-weight: bold;
	color: #f8825a;
	text-indent: 18px;
	background: url(http://img.chemayi.com/service/point.jpg) no-repeat 5px
		7px;
	height: 20px;
	line-height: 20px;
	margin-top: 10px;
}

.step2 dl dd {
	width: 93px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	font-size: 12px;
	color: #2e3032;
	border: 1px solid #e5e5e5;
	float: left;
	margin: 6px 10px 4px 4px;
	position: relative;
	cursor: pointer;
}

.step2 dl dd.hover {
	background: #fef1d6;
	border: 1px solid #facea0;
}

.step2 dl dd.cur {
	background: #fef1d6;
	border: 1px solid #fa805b;
}

.step2 dl dd em {
	display: block;
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(/auto/image/selected.jpg) no-repeat;
	display: none;
}

.step2 dl dd.cur em {
	display: block;
}

.car_info_series_list {
	height: 206px;
	overflow: hidden;
	overflow-y: auto;
	position: relative;
}

.series_title {
	font-size: 14px;
	color: #2e3032;
	text-indent: 18px;
	background: url(http://img.chemayi.com/service/point.png) no-repeat left
		center;
	height: 30px;
	line-height: 30px;
	margin-top: 6px;
}

.series_list {
	overflow: hidden;
	width: 698px;
}

.series_list li {
	width: 93px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	font-size: 12px;
	color: #2e3032;
	border: 1px solid #e5e5e5;
	float: left;
	margin: 4px 20px 4px 0px;
	position: relative;
	cursor: pointer;
	border-radius: 2px;
}

.series_list li.hover {
	background: #ffebdc;
	border: 1px solid #fa5f19;
	color: #fa5f19;
}

.series_list li.cur {
	background: #fa5f19;
	border: 1px solid #fa5f19;
	color: #fff;
}

.step3 {
	overflow: hidden;
	display: none;
}

.step3 ul {
	width: 698px;
	overflow: hidden;
	padding: 5px 0px;
}

.step3 ul li {
	width: 93px;
	height: 28px;
	overflow: hidden;
	float: left;
	margin: 15px 20px 0px 0px;
	border: 1px solid #e5e5e5;
	position: relative;
	color: #2e3032;
	line-height: 28px;
	font-size: 12px;
	cursor: pointer;
	text-align: center;
	border-radius: 2px;
}

.step3 ul li.hover {
	background: #ffebdc;
	border: 1px solid #fa5f19;
	color: #fa5f19;
}

.step3 ul li.cur {
	background: #fa5f19;
	border: 1px solid #fa5f19;
	color: #fff;
}

.step3 ul li em {
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(/auto/image/selected.jpg) no-repeat;
	display: none;
}

.step3 ul li.cur em {
	display: block;
}


.step4 {
	overflow: hidden;
	display: none;
}

.step4 ul {
	width: 698px;
	overflow: hidden;
	padding: 5px 0px;
}

.step4 ul li {
	width: 210px;
	height: 28px;
	overflow: hidden;
	float: left;
	margin: 10px 20px 0px 0px;
	border: 1px solid #e5e5e5;
	position: relative;
	color: #2e3032;
	line-height: 28px;
	font-size: 12px;
	cursor: pointer;
	text-align: center;
	border-radius: 2px;
}

.step4 ul li.hover {
	background: #ffebdc;
	border: 1px solid #fa5f19;
	color: #fa5f19;
}

.step4 ul li.cur {
	background: #fa5f19;
	border: 1px solid #fa5f19;
	color: #fff;
}

.step4 ul li em {
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(/auto/image/selected.jpg) no-repeat;
	display: none;
}

.step4 ul li.cur em {
	display: block;
}

.mycartype {
	font-size: 14px;
	color: #f8825a;
}

.rechoosecartype {
	font-size: 12px;
	color: #41b5f1;
	text-decoration: underline;
	cursor: pointer;
}

.new_select_history {
	overflow: hidden;
	margin: 0px 10px;
}

.new_select_history_title {
	height: 48px;
	overflow: hidden;
	line-height: 48px;
	font-size: 13px;
	color: #333;
	font-weight: bold;
}

.new_select_history_list {
	overflow: hidden;
}

.new_select_history_list ul {
	width: 698px;
	overflow: hidden;
}

.new_select_history_list ul li {
	width: 325px;
	height: 28px;
	line-height: 28px;
	border: 1px solid #e5e5e5;
	text-align: center;
	float: left;
	margin-right: 18px;
	color: #2299de;
	cursor: pointer;
	margin-bottom: 10px;
	font-size: 12px;
	border-radius: 2px;
}

.select_opacity {
	overflow: hidden;
	height: 30px;
}

.select_opacity a {
	display: block;
	float: left;
	padding: 0px 10px;
	height: 28px;
	line-height: 28px;
	color: #666;
	background: #e9e9e9;
	border: 1px solid #fff;
	margin-right: 7px;
	cursor: pointer;
	position: relative;
}

.select_opacity a.hover {
	background: #fcf9da;
	border: 1px solid #ff9700;
}

.select_opacity a.cur {
	background: #fef1d6;
	border: 1px solid #fa805b;
}

.select_opacity a em {
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(/auto/image/selected.jpg) no-repeat;
	display: none;
}

.select_opacity a.cur em {
	display: block;
}

.xuanmo_yusuan {
	overflow: hidden;
}

.yusuan_input {
	width: 72px;
	height: 28px;
	border: 1px solid #abafb2;
	overflow: hidden;
	float: left;
	margin-right: 10px;
}

.yusuan_input input {
	border: none;
	width: 50px;
	height: 26px;
	line-height: 26px;
	font-size: 14px;
	color: #666;
	text-align: center;
}

.yusuan_tip {
	height: 30px;
	line-height: 30px;
	color: #f8825a;
}

.select_tiemo {
	overflow: hidden;
	height: 30px;
}

.select_tiemo a {
	display: inline-block;
	float: left;
	height: 28px;
	padding: 0px 24px;
	line-height: 28px;
	color: #666;
	background: #fff;
	border: 1px solid #adaeb2;
	margin-right: 7px;
	cursor: pointer;
	text-align: center;
	position: relative;
	margin-bottom: 5px;
	white-space: nowrap;
}

.select_tiemo a.hover {
	background: #fcf9da;
	border: 1px solid #ff9700;
}

.select_tiemo a.cur {
	background: #fef1d6;
	border: 1px solid #fa805b;
}

.select_tiemo a em {
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(/auto/image/selected.jpg) no-repeat;
	display: none;
}

.select_tiemo a.cur em {
	display: block;
}

.select_tiemo_pipei {
	height: 98px;
	border: 1px solid #ff9700;
	background: #fcf9da;
	width: 496px;
	padding: 1px 1px 0px;
}

.select_tiemo_pipei ul {
	width: 497px;
	overflow: hidden;
}

.select_tiemo_pipei li {
	float: left;
	border-right: 1px solid #ff9700;
}

.select_tiemo_pipei li span {
	display: block;
	width: 100%;
}

.select_tiemo_pipei li span.pipei_title {
	height: 42px;
	background: #f8825a;
	color: #fff;
	font-weight: bold;
	text-align: center;
	line-height: 42px;
	overflow: hidden;
}

.select_tiemo_pipei li span.pipei_info {
	height: 56px;
	color: #666;
	text-align: center;
	line-height: 56px;
	overflow: hidden;
}

.ser_tel {
	height: 96px
}

.ser_r_info {
	width: 215px;
	padding: 10px 15px;
}

.ser_r_info h3 {
	color: #f8825a;
	font-size: 14px;
	height: 28px;
	line-height: 24px;
}

.ser_r_info p {
	line-height: 22px;
	padding:
}

.chongxuankeeppro {
	display: block;
	float: left;
	height: 40px;
	line-height: 40px;
	color: #41b5f1;
	text-decoration: underline;
}
</style>
	
	<div class="tab_list" id="dialog_choose_car_model" 	style="display: none;">
		<div class="new_select_box_progress progress1">
			<input type="hidden" name="car_fields_val" val1="21" val2="358"
				val3="2455" val4="8136"> <a class="select_car_field"
				field="brand"></a> <a class="select_car_field" field="series"></a> <a
				class="select_car_field" field="year"></a> <a
				class="select_car_field" field="model"></a>
		</div>

		<div id="new_select_bypin" class="new_select_bypin" style="display: block;">
			<span>品牌首字母：</span> 
			<a href="###" class="b_first hot" hot="true"></a>
			<a href="###" class="b_first">A</a> 
			<a href="###" class="b_first cur_letter">B</a> <a href="###" class="b_first">C</a>
			<a href="###" class="b_first">D</a> <a href="###" class="b_first">F</a>
			<a href="###" class="b_first">H</a> <a href="###" class="b_first">J</a>
			<a href="###" class="b_first">K</a> <a href="###" class="b_first">L</a>
			<a href="###" class="b_first">M</a> <a href="###" class="b_first">Q</a>
			<a href="###" class="b_first">R</a> <a href="###" class="b_first">S</a>
			<a href="###" class="b_first">T</a> <a href="###" class="b_first">W</a>
			<a href="###" class="b_first">X</a> <a href="###" class="b_first">Y</a>
			<a href="###" class="b_first">Z</a>
		</div>

		<div class="new_select_box_hasselect" style="display: block;">
			<em>已选车型:</em><span class="cartype"><a
				onclick="rechooseCartype(21, 'brand')"><img
					src="/auto/image/close.jpg"></a><span>标致</span></span><span
				class="cartype"><a onclick="rechooseCartype(358, 'series')"><img
					src="/auto/image/close.jpg"></a><span>307</span></span><span
				class="cartype"><a onclick="rechooseCartype(2455, 'year')"><img
					src="/auto/image/close.jpg"></a><span>2007</span></span>
		</div>
		<div class="new_select_box_content" id="new_select_box_content">
			<div class="step step1" style="display: none;" id="step1"></div>
			<div id="step2" class="step step2" style="display: none;"></div>
			<div id="step3" class="step step3" style="display: none;"></div>
			<div id="step4" class="step step4" style="display: none;"></div>
		</div>

		<div class="new_select_history">
			<div class="new_select_history_title">您浏览过的其他车型：</div>
			<div class="new_select_history_list">
				<ul id="choosed_car_info_history">

				</ul>

			</div>
		</div>

	</div>
</body>

</html>
