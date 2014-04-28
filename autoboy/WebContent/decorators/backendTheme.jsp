<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.autoboys.domain.Member" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.rg/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="/auto/favicon.ico" type="image/x-icon">
  	<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/member.css" type="text/css">
  	<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/autoboys.css" type="text/css">
  	<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/slayout.css" type="text/css">
  	<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/mootools.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/silunzi.js"></script>
  	<decorator:head/> 
  	<title><decorator:title>养车客商家后台：互联网养车，开启养车新模式</decorator:title></title>
</head>

<body class="logged-out ytype" screen_capture_injected="true">
	<div id="wrap" >
		<div class="app-header">
	        <div id="mastHead" class="webview-hidden header-container clearfix">
	        	<div class="logo"><a href="<%=request.getContextPath()%>"></a></div>
	        	<div class="header-kh"><img src="<%=request.getContextPath()%>/image/store_o2o.png" style="margin-top:6px;"/></div>
				<ul class="header-nav" id="header-nav">
	            </ul>
	            <ul id="navUtility">
	            	<li><img class="ui_dHead" width="26" height="26" alt="" style="display:block;margin-top: -3px;" src="<%=request.getContextPath()%>/image/default_head.png"></li>
		    		<%
		    		Member member = null;
		    		if(request.getSession().getAttribute("login_user") != null){
		    			member = (Member) request.getSession().getAttribute("login_user");
		    		%>
		    		<li><%=member.getNickName() %>，您好！[ <a href="javascript:logout();" title="">退出</a> ]</li>
		    		<%} %>
			    </ul>
	        </div>
	    </div>
		
		<!--  div super-container start -->
		<div id="my-container-wrap">
						
			<div class="my-container">
				<div class="menu_user">
										
					<div class="menu_item" itemtype="order" lock="">
						<span class="item_icon icon_order"></span><span class="item_name">订单管理</span>
						<span class="item_more item_to_down"></span>
					</div>
					<div class="menu_item_children" itemtype="order">
					    <ul>
					        <li class="menu_item_child" id="menu-1-0"><a href="${pageContext.request.contextPath}/eorder/eorderQuery.action?status=1">待确认订单</a></li>
					        <li class="menu_item_child" id="menu-1-6"><a href="${pageContext.request.contextPath}/eorder/eorderQuery.action?status=2">待维修订单</a></li>
					        <li class="menu_item_child" id="menu-1-7"><a href="${pageContext.request.contextPath}/eorder/eorderQuery.action?status=3">已取消订单</a></li>
					        <li class="menu_item_child" id="menu-1-7"><a href="${pageContext.request.contextPath}/eorder/eorderQuery.action?status=4">所有订单</a></li>
					        
					    </ul>
					</div>
					
					<div class="menu_item" itemtype="order" lock="">
						<span class="item_icon icon_blance"></span><span class="item_name">评论管理</span>
						<span class="item_more item_to_down"></span>
					</div>
					<div class="menu_item_children" itemtype="blance">
					    <ul>
					        <li class="menu_item_child" id="menu-2-6"><a href="${pageContext.request.contextPath}/ereview/ereviewQuery.action?status=1">待回复评论</a></li>
					        <li class="menu_item_child" id="menu-2-4"><a href="${pageContext.request.contextPath}/ereview/ereviewQuery.action?status=0">所有评论</a></li>
					    </ul>
					</div>
					<div class="menu_item" itemtype="car"><span class="item_icon icon_car"></span><span class="item_name">产品服务管理</span><span class="item_more item_to_down"></span></div>
					<div class="menu_item_children" itemtype="car">
					    <ul>
					        <li class="menu_item_child" id="menu-3-1"><a href="<%=request.getContextPath()%>/provider/service/serviceConfig.action">服务项目设置</a></li>
					        <li class="menu_item_child" id="menu-3-2"><a href="<%=request.getContextPath()%>/provider/brands.action">维修品牌设置</a></li>
					        <li class="menu_item_child" id="menu-3-3"><a href="<%=request.getContextPath()%>/provider/eService.action">汽车配件管理</a></li>
					        
					    </ul>
					</div>
					<div class="menu_item" itemtype="account"><span class="item_icon icon_account"></span><span class="item_name">店铺信息管理</span><span class="item_more item_to_down"></span></div>
					<div class="menu_item_children" itemtype="account">
					    <ul>
					    	  					        
					        <li <% if ("menu-4-1".equals(request.getParameter("menu"))) {%>class="menu_item_child selected"<% } else { %> class="menu_item_child" <% }%> id="menu-4-1">	
					        <a href="${pageContext.request.contextPath}/provider/editBasicInfo.action?menu=menu-4-1">商家基本信息</a></li>
					        <li <% if ("menu-4-2".equals(request.getParameter("menu"))) {%>class="menu_item_child selected"<% } else { %> class="menu_item_child" <% }%> id="menu-4-2">	
					        <a href="${pageContext.request.contextPath}/provider/editStoreInfo.action?menu=menu-4-2">店铺基本信息</a></li>
					        <li <% if ("menu-4-3".equals(request.getParameter("menu"))) {%>class="menu_item_child selected"<% } else { %> class="menu_item_child" <% }%> id="menu-4-3">	
					        <a href="${pageContext.request.contextPath}/provider/editPassword.action?menu=menu-4-3">修改管理员密码</a></li>
					        <li <% if ("menu-4-4".equals(request.getParameter("menu"))) {%>class="menu_item_child selected"<% } else { %> class="menu_item_child" <% }%> id="menu-4-4">	
					        <a href="${pageContext.request.contextPath}/user/userList.action?menu=menu-4-4">员工账号管理</a></li>
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
	<div class="footer admin-footer">
	    <div class="footer-wrap">
	       <p class="copyright lesser-text"><span style="margin-right:20px;">服务热线：400-188-6666（免长话）</span>Copyright © 2014–2018 All Right Reserved yangcheke.com. 沪ICP备08109440</p> 
	    </div>
	</div>	
</div>
  
  
</body>
</html>
