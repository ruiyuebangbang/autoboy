<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>

<head>

<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<title>养车客商家后台：互联网养车，开启养车新模式</title>
<link rel="StyleSheet" href="css/main.css" type="text/css">

<script language="javascript">
function f_gotoPage(sel){
    //alert(sel);
    $('auditProvider_pager_pageCurr').val(sel);

    document.forms[0].submit();
}
</script>
</head>

<body class="logged-out ytype" screen_capture_injected="true">
<s:form  method="post">
			<s:hidden  name="pager.pageSize"/>
			<s:hidden  name="pager.pageCurr"/>
	<input type="hidden" name="pid"/>		
	<input type="hidden" name="stat"/>		
</s:form>	
	<div class="orderlist">
		<div class="pcontent-title">
			<h1>商家审核</h1>
		</div>
		<table class="tblist">
			<thead>
				<tr>
					<th style="width: 90px">店铺名称</th>
					<th>联系人</th>
					<th>手机号</th>
					<th>所在区域</th>
					<th>申请时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="providerList" status="rowstat">
				<tr style="line-height:24px">
					<td><a href=""><s:property value="SHORT_NAME"/></a></td>
					<td><s:property value="AGENT"/></td>
					<td><s:property value="TELEPHONE"/></td>
					<td><s:property value="regionName"/></td>
					<td><s:property value="apply_date"/></td>
					<td class="op">
							<a href="editBasicInfo.action?provid=<s:property value='ID'/>">修改</a> | 
							<a href="javascript:openit(<s:property value="ID"/>,1)">通过</a> | 
							<a href="javascript:closeit(<s:property value="ID"/>,2)">不通过</a> 
					</td>
				</tr>
				</s:iterator>

			</tbody>
		</table>
				<div class="ab-pagenavi" style="padding: 20px;">
	        <a class="numbers first" href="javascript:f_gotoPage(<s:property value="pager.pagePre"/>);">上一页</a>
	        <s:iterator value="pager.pageList" id="page">
	        <s:if test="#page = 3">
	            <a class="numbers" href="javascript:f_gotoPage(<s:property/>);"><s:property/></a>
	        </s:if>
	        <s:else>
	            <a class="numbers" href="javascript:f_gotoPage(<s:property/>);"><s:property/></a>
	        </s:else>
	        </s:iterator>
	        <a class="numbers last" href="javascript:f_gotoPage( <s:property value="pager.pageNext"/>);">下一页</a>
	    </div>
</div>
<script type="text/javascript">
function openit(pid,stat){
	lunziUtil.confirm("商家信息无误，确认开通?", function() {
		document.forms[0].pid.value=pid;
		document.forms[0].stat.value=stat;
		document.forms[0].action="<%=request.getContextPath()%>/admin/auditProvider.action";
		//alert(document.forms[0].action);
		document.forms[0].submit();
    });
}
function closeit(pid,stat){
	lunziUtil.confirm("确认取消商家资格?", function() {
		document.forms[0].pid.value=pid;
		document.forms[0].stat.value=stat;
		document.forms[0].action="<%=request.getContextPath()%>/admin/auditProvider.action";
		//alert(document.forms[0].action);
		document.forms[0].submit();
    });	
}
</script>
</body>
</html>
