<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>

<head>

<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<title>养车客商家后台：互联网养车，开启养车新模式</title>
<link rel="StyleSheet" href="css/main.css" type="text/css">
<script src="../scripts/jquery-1.11.0.js"></script>
<script language="javascript">
function f_gotoPage(sel){
    //alert(sel);
    $('#userList_pager_pageCurr').val(sel);

    document.forms[0].submit();
}

function f_disableUser(pid,stat) {
	document.forms[0].pid.value=pid;
	document.forms[0].stat.value=stat;
	document.forms[0].action="<%=request.getContextPath()%>/admin/disableUser.action";
    document.forms[0].submit();
}
</script>
</head>

<body class="logged-out ytype" screen_capture_injected="true">
	<div class="orderlist">
		<div class="pcontent-title">
			<h1>会员管理</h1>
		</div>
		<div class="pcontent-filter">
			<s:form method="post">
			<s:hidden  name="pager.pageSize"/>
			<s:hidden  name="pager.pageCurr"/>
			<s:hidden  name="typeId"/>
	<input type="hidden" name="pid"/>		
	<input type="hidden" name="stat"/>	
			<table>
				<tr>
					<td>关键字：</td>
					<td><s:textfield name="keyword" theme="simple" cssStyle="width: 160px; margin-left: 20px;"/> <input
						type="submit" class="btn btn-primary btn-small" value=" 查询 "
						style="margin-left: 20px"></td>
				</tr>
			</table>
		</s:form>
		</div>
		<s:if test="memberList.size() > 0">
			<div class="content">
				<table class="tblist">
					<tr class="even">
						<th>昵称</th>
						<th>手机号</th>
						<th>Email</th>
						<th>注册时间</th>
						<th>有效</th>
						<th>操作</th>
					</tr>
					<s:iterator value="memberList" status="rows">
						<tr
							class="<s:if test="#rows.odd == true ">odd</s:if><s:else>even</s:else>">
							<td align="left"><s:property value="nickName" /></td>
							<td align="left"><s:property value="mobilePhone" /></td>
							<td align="left"><s:property value="email" /></td>
							<td align="left"></td>
							<td align="left">
                            <s:if test="isDisabled == 0">无效
                            </s:if><s:else>有效</s:else>
        
                            </td>
							<td><span> <a href="javascript:f_disableUser(<s:property value="id"/>,0);">禁用</a>
                                       <a href="javascript:f_disableUser(<s:property value="id"/>,1);">启用</a> 
							</span></td>
						</tr>
					</s:iterator>
				</table>
			</div>
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
		</s:if>
		
	</div>
</body>
</html>
