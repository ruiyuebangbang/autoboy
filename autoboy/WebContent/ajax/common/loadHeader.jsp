<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.autoboys.domain.Member" %>
<%
String currentModel = "";
Member member = null;
if((session.getAttribute("currentModel")) !=null){
	currentModel = (String)session.getAttribute("currentModel");
}
if(request.getSession().getAttribute("login_user") != null){
	member = (Member) request.getSession().getAttribute("login_user");
}

%>
<ul id="navUtility">
	<li class="VehicleInfo"><span><%=currentModel %></span></li>
	<li id="global_choose_vehicle">
		<a href="javascript:chooseVehicle(refreshPage);">
			<i class="icon-th-large" style="margin-right:4px;color:#c10208;"></i><%if(currentModel.length()==0){ %>选择车型 <%}else{ %>更换车型<%} %>
		</a></li>
	<li><span class="line">&nbsp;</span></li>
	<%
	if(member != null){
	%>
	<li id="lpChatButton2" style="visibility: visible;"><%=member.getNickName() %>，您好！</li>
	<li><a href="javascript:logout();">退出</a></li>
	<%}else {%>
	<li id="lpChatButton2" style="visibility: visible;"><a href="<%=request.getContextPath()%>/auth/login.action" id="lpDynamicButtonHref-572" title="">登录</a></li>
	<li><span class="line">&nbsp;</span></li>
	<li><a href="<%=request.getContextPath()%>/auth/register.action">注册</a></li>
	<%} %>
	<li><span class="line">&nbsp;</span></li>
	<li><a href="<%=request.getContextPath()%>/member/member.action">个人中心</a></li>
	<%
	if(member != null && member.getClassid().intValue() == 2){
	%>
		<li><span class="line">&nbsp;</span></li>
		<li><a href="<%=request.getContextPath()%>/provider/main.action">商家后台</a></li>
	<%}
	if(member != null && member.getClassid().intValue() == 3){
	%>
		<li><span class="line">&nbsp;</span></li>
		<li><a href="<%=request.getContextPath()%>/admin/main.action">管理后台</a></li>
	<%} %>
</ul>