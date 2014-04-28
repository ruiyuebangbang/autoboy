<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>

<head>

<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<title>养车客商家后台：互联网养车，开启养车新模式</title>
<link rel="StyleSheet" href="css/main.css" type="text/css">
<script src="../scripts/jquery-1.11.0.js"></script>

<script language=javascript>
function f_save() {
	//alert(1);
	document.forms[0].action="mappingVehicleSave.action";
	document.forms[0].submit();
}

function f_select(obj,val) {
	//alert(0);
	if (val == 1) {
		//alert(1);		
		obj.find("input").prop("checked",true);

	} else {
		//alert(2);
		obj.find("input").prop("checked",false);
	}
}
</script>
</head>

<body class="logged-out" screen_capture_injected="true">
	<s:form>
	<s:hidden name="product.id"/>

		<div class="pcontent-title"><h1>设置产品适用车型</h1></div>
		<div class="pcontent-filter">
			<ul>
				<s:checkboxlist theme="simple" list="brands" listKey="code" listValue="cname" name="selbrandsCode"/>		
			</ul>
		</div><div>
			<input type="submit" class="btn btn-primary btn-small" value=" 查询 " >
		</div>

		<s:if test="selBrands.size() > 0">
		<div class="pcontent">
			<s:iterator value="selBrands" var="bd">
			<dl>
				<dt><s:property value="cname"/> <input type="radio" name="<s:property value='code'/>" value="1" onclick="javascript:f_select($('#<s:property value='code'/>'),1);">全选<input type="radio" name="<s:property value='code'/>" checked="checked" value="2" onclick="javascript:f_select($('#<s:property value='code'/>'),0);">取消</dt>
				<dd>
					<ul id="<s:property value='code'/>">						 
							<s:checkboxlist theme="simple" list="%{series}" listKey="code" listValue="cname" name="selseriesCode"/>	
					</ul>
				</dd>
			</dl>
		</s:iterator>
	  </div><div>
		<input type="button" class="btn btn-primary btn-small" value=" 确定 " onclick="javascript:f_save();">
		</div>
		</s:if>

	</s:form>
</body>
</html>
