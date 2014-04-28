<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>

<head>

<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<title>养车客商家后台：互联网养车，开启养车新模式</title>
<link rel="StyleSheet" href="css/main.css" type="text/css">

</head>

<body class="logged-out ytype" screen_capture_injected="true">
	<div class="orderlist">
		<div class="pcontent-title">
			<h1>修改产品信息</h1>
		</div>
		<s:form cssClass="pform">
        <s:hidden name="product.id"/>
		<table>
			<tbody>

				<tr>
					<td>产品名称:</td>
					<td><s:textfield name="product.name" theme="simple" /></td>					
				</tr>
				<tr>
					<td>产品品牌:</td>
					<td><s:select name="product.brand_id" list="pbrands"  theme="simple" cssClass="service" listKey="id" listValue="name"/>
					</td>					
				</tr>
				<tr>
					<td>产品规格:</td>
					<td><s:textfield name="product.specification" theme="simple" /></td>					
				</tr>
				<tr>
					<td>市场价(元):</td>
					<td><s:textfield name="product.standard_price" theme="simple" /></td>					
				</tr>
				<tr>
                    <s:hidden name="product.service_id"/>
					<td colspan="2"><input class="btn btn-small btn-primary" type="submit" value=" 确定 "></td>
				</tr>
			</tbody>
		</table>
		</s:form>
		
		
	</div>
</body>
</html>
