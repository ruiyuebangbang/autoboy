<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.rg/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Language" content="CN">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico" type="image/x-icon">
  	<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/main.css" type="text/css">
  	<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/member.css" type="text/css">
  	<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/autoboys.css" type="text/css">
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
				<a href="<%=request.getContextPath()%>/">养车客</a>
			</div>

			<div class="hr">
				<div id="nav-shortcut">
					<script type="text/javascript">
					window.addEvent('domready', function() {
						nav.init();
			
					});
				</script>
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
						</li>
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
	<div id="wrap" >
		
		
		<!--  div super-container start -->
		<div id="my-container-wrap">
			<div class="my-navigator">
			    <p>当前位置：</p>
			    <p><a href="/">首页</a></p>
			    <p>&nbsp;&gt; <a href="/my/">用户中心</a></p>
			    <p>&nbsp;&gt; <%=request.getAttribute("subMenuName") %></p>
			</div>
			
			<div class="my-container">
				<div class="menu_user">
					<div class="head">
						<div class="avatar"><img src="<%=request.getContextPath()%>/image/member/default_m.png"></div>
						<p class="avatar_tit">IT浪子</p>
					</div>
					
					<div class="menu_item" itemtype="order" lock="">
						<span class="item_icon icon_order"></span><span class="item_name">订单管理</span>
						<span class="item_more item_to_down"></span>
					</div>
					<div class="menu_item_children" itemtype="order">
					    <ul>
					        <li class="menu_item_child selected" id="menu-1-0"><a href="${pageContext.request.contextPath}/orderlist.aspx">最新订单</a></li>
					        <li class="menu_item_child" id="menu-1-6"><a href="orderlist.aspx?state=5">全部订单</a></li>
					        <li class="menu_item_child" id="menu-4-3"><a href="votelist.aspx">我的评价</a></li>
					    </ul>
					</div>
					<!--div class="menu_item" itemtype="blance" lock="">
						<span class="item_icon icon_blance"></span><span class="item_name">维权管理</span>
						<span class="item_more item_to_down"></span>
					</div>
					<div class="menu_item_children" itemtype="blance">
					    <ul>
					        <li class="menu_item_child" id="menu-2-6"><a href="share.aspx">发起维权</a></li>
					        <li class="menu_item_child" id="menu-2-5"><a href="mygiftcard.aspx">维权跟踪</a></li>
					    </ul>
					</div-->
					<div class="menu_item" itemtype="blance" lock="">
						<span class="item_icon icon_blance"></span><span class="item_name">财富管理</span>
						<span class="item_more item_to_down"></span>
					</div>
					<div class="menu_item_children" itemtype="blance">
					    <ul>
					        <li class="menu_item_child" id="menu-2-6"><a href="share.aspx">邀请有礼</a></li>
					        <li class="menu_item_child" id="menu-2-5"><a href="mygiftcard.aspx">我的优惠券</a></li>
					        <li class="menu_item_child" id="menu-2-4"><a href="score.aspx">我的积分</a></li>
					    </ul>
					</div>
					<div class="menu_item" itemtype="car"><span class="item_icon icon_car"></span><span class="item_name">爱车信息</span><span class="item_more item_to_down"></span></div>
					<div class="menu_item_children" itemtype="car">
					    <ul>
					        <li class="menu_item_child" id="menu-3-4"><a href="servicerecord.aspx?my_car_id=0">养车Timeline</a></li>
					        <li class="menu_item_child" id="menu-3-3"><a href="storelist.aspx">收藏服务商</a></li>
					        <li class="menu_item_child" id="menu-3-1"><a href="mycar.aspx">我的爱车</a></li>
					    </ul>
					</div>
					<div class="menu_item" itemtype="account"><span class="item_icon icon_account"></span><span class="item_name">个人信息</span><span class="item_more item_to_down"></span></div>
					<div class="menu_item_children" itemtype="account">
					    <ul>
					        <li class="menu_item_child" id="menu-4-1"><a href="<%=request.getContextPath() %>/member/edit.action"">个人信息</a></li>
					        <li class="menu_item_child" id="menu-4-2"><a href="<%=request.getContextPath() %>/member/changePassword.action">修改密码</a></li>
					    </ul>
					</div>
				</div>
				<div class="my-content">
					<decorator:body />
			
				</div>
				<div style="clear:both;"></div>
			</div>
			
			
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
  
  
</body>
</html>
