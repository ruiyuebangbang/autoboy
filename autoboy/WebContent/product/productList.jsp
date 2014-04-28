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
    $('#auditProvider_pager_pageCurr').val(sel);

    document.forms[0].submit();
}

function changeSeviceCat(sel){	
	$.get( "../ajax/common/getService.action", { selCategory: sel},
	  function( data ) {  
		  //alert(data);
		  $("#service_id").html(data).prepend('<option value="">全部</option>');
		 }
	);
}

function changeBrand(sel){	
	$.get( "../ajax/common/getVehicleSeries1.action", { selVehicleBrand: sel},
	  function( data ) {  
		  //alert(data);
		  $("#selVehicleSeries").html(data).prepend('<option value="">全部</option>');
		 }
	);
}
</script>
</head>

<body class="logged-out ytype" screen_capture_injected="true">
	<div class="orderlist">
		<div class="pcontent-title">
			<h1>产品查询</h1>
		</div>
		<div class="pcontent-filter">
            <s:form>
			<s:hidden  name="pager.pageSize"/>
			<s:hidden  name="pager.pageCurr"/>


			<table>
				<tr>
					<td>产品分类：</td>
					<td>
						<s:select name="selCategory" headerKey="" headerValue="全部" list="cats"  theme="simple" cssClass="service" listKey="code" listValue="name" onchange="javascript:changeSeviceCat(this.value);"/>
						<s:select id="service_id" name="product.service_id" headerKey="" headerValue="全部" list="sevs"  theme="simple" cssClass="service" listKey="CODE" listValue="NAME" />
						
					</td>
				</tr>
				<tr>
					<td>适用车型：</td>
					<td>
						<s:select name="selVehicleBrand" headerKey="" headerValue="全部" list="brands"  theme="simple" cssClass="service" listKey="code" listValue="cname" onchange="javascript:changeBrand(this.value);"/>
						<s:select id="selVehicleSeries" name="selVehicleSeries" headerKey="" headerValue="全部" list="series"  theme="simple" cssClass="service" listKey="CODE" listValue="NAME" />

					</td>
				</tr>
				<tr>
					<td>产品名称：</td>
					<td>
						<input name="product.name" type="text" style="width:160px;"> 
						<input type="submit" class="btn btn-primary btn-small" value=" 查询 " style="margin-left:10px">
					</td>
				</tr>
			</table>
        </s:form>
		</div>
		<table class="tblist">
			<thead>
				<tr>
					<th style="width:20px;"><input type="checkbox"></th>
					<th>名称</th>
					<th>品牌</th>
					<th>规格</th>
					<th>市场价</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>

				 <s:iterator value="productList" status="rows">
						<tr
							class="<s:if test="#rows.odd == true ">odd</s:if><s:else>even</s:else>">
							<td><input type="checkbox"></td>
							<td align="left"><s:property value="name" /></td>
							<td align="left"><s:property value="brandName" /></td>
							<td align="left"><s:property value="specification" /></td>
							<td align="right"><s:property value="standard_price" /></td>
							
							<td><span> <a href="productEdit.action?product.id=<s:property value='id'/>">修改</a> | 
							<a href="mappingVehicle.action?product.id=<s:property value='id'/>">车型</a> 
							</span></td>
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
		<div style="text-align:center"><span style="margin:0 5px;"><a href="productAdd.action" class="btn btn-primary btn-small">新增产品</a></span><span style="margin:0 5px;"><a class="btn btn-primary btn-small">设置服务项</a></span><span style="margin:0 5px;"><a class="btn btn-primary btn-small">设置适合车型</a></span></div>
	</div>
</body>
</html>
