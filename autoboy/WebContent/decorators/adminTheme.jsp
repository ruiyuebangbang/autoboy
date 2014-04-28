<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.autoboys.domain.Member" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.rg/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico" type="image/x-icon">
  	<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/member.css" type="text/css">
  	<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/slayout.css" type="text/css">
  	<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/autoboys.css" type="text/css">
  	<decorator:head/> 
  	<title><decorator:title default="养车客，让车生活更加简单惬意" /></title>
  	<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/mootools.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/silunzi.js"></script>
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
					        <li class="menu_item_child" id="menu-1-0"><a href="${pageContext.request.contextPath}/eorder/eorderQuery.action?status=1">待处理订单</a></li>
					        <li class="menu_item_child" id="menu-1-7"><a href="${pageContext.request.contextPath}/eorder/eorderQuery.action?status=4">所有订单</a></li>
					        
					    </ul>
					</div>
					
					<div class="menu_item" itemtype="order" lock="">
						<span class="item_icon icon_blance"></span><span class="item_name">评论管理</span>
						<span class="item_more item_to_down"></span>
					</div>
					<div class="menu_item_children" itemtype="blance">
					    <ul>
					        <li class="menu_item_child" id="menu-2-4"><a href="${pageContext.request.contextPath}/ereview/ereviewQuery.action?status=0">所有评论</a></li>
					    </ul>
					</div>
					<div class="menu_item" itemtype="car"><span class="item_icon icon_car"></span><span class="item_name">产品管理</span><span class="item_more item_to_down"></span></div>
					<div class="menu_item_children" itemtype="car">
					    <ul>
					        <li class="menu_item_child" id="menu-3-1"><a href="<%=request.getContextPath()%>/admin/productList.action">产品管理</a></li>
					        <li class="menu_item_child" id="menu-3-2"><a href="<%=request.getContextPath()%>/admin/productAdd.action">新增产品</a></li>
					    </ul>
					</div>
					<div class="menu_item" itemtype="account"><span class="item_icon icon_account"></span><span class="item_name">用户管理</span><span class="item_more item_to_down"></span></div>
					<div class="menu_item_children" itemtype="account">
					    <ul>
					    	  					        
					        <li id="menu-4-1" class="menu_item_child">	
					        <a href="${pageContext.request.contextPath}/admin/userList.action?typeId=1">会员管理</a></li>
					        <li id="menu-4-1" class="menu_item_child ">	
					        <a href="${pageContext.request.contextPath}/admin/userList.action?typeId=2">商家用户管理</a></li>
					        <li id="menu-4-1" class="menu_item_child selected">	
					        <a href="${pageContext.request.contextPath}/admin/userList.action?typeId=3">系统用户管理</a></li>
					    </ul>
					</div>
					<div class="menu_item" itemtype="account"><span class="item_icon icon_account"></span><span class="item_name">商家管理</span><span class="item_more item_to_down"></span></div>
					<div class="menu_item_children" itemtype="account">
					    <ul>
					    	  					        
					        <li id="menu-5-1" class="menu_item_child selected">	
					        <a href="${pageContext.request.contextPath}/admin/auditProviderQry.action">商家审核</a></li>
					        <li id="menu-5-2" class="menu_item_child">	
					        <a href="${pageContext.request.contextPath}/admin/queryProvider.action">查询商家</a></li>
					        
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
