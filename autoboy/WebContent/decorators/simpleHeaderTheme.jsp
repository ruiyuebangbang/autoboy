<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.rg/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/auto/favicon.ico" type="image/x-icon">
<title><decorator:title>养车客：让车主车生活更加简单惬意</decorator:title></title>
<decorator:head />
</head>

<body screen_capture_injected="true">
	<div id="wrap">
		<div class="simple-header clear">
			<div class="reg-logo">
				<a href="${pageContext.request.contextPath}" class="logo">
					<img src="${pageContext.request.contextPath}/image/blank.gif" alt="养车客" width="202" height="70">
				</a>
			</div>
			
			<h1></h1>
		</div>
		<!--  div super-container start -->
		<div class="container">
			<decorator:body />
			<div style="clear:both;"></div>
		</div>

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
