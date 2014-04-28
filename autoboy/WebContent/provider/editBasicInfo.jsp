<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta name="description" content="专业汽车保养、维修服务">
<meta name="keywords" content="">
<title>编辑企业基本信息</title>

<script src="../scripts/jquery-1.11.0.js"></script>
<script language=javascript>
$( document ).ready(function() {        
	//alert( "document loaded" );    
});

function changeReg1(reg1){	
	$.get( "../ajax/common/getRegionsByReg1.action", { regId: reg1},
	  function( data ) {  
		  //alert(data);
		  //$("#region2").empty();
		  $("#region2").html(data);
		  changeReg2($("#region2").val());
		 }
	);
}
function changeReg2(reg2) {
	$.get( "../ajax/common/getRegionsByReg1.action", { regId: reg2},
			  function( data ) {  
				  $("#region3").html(data);
				 }
	);
}


</script>

</head>

<body class="logged-out ytype" >
	<div id="user-info">
		<div class="pcontent-title">
			<h1>商家基本信息设置</h1>
		</div>
		<s:form action="editBasicInfo" method="post">
		<s:hidden name="provider.ID"/>

			<table class="form_table mgleft">
				<tbody>

					<tr>
						<td class="td_label w100">商户简称：</td> 
                        <td>
						<s:textfield name="provider.SHORT_NAME" theme="simple" cssClass="td_txt w190" maxlength="50" /><span class="cr">*</span>
                        <font color='red'><s:property value="errors['provoider.SHORT_NAME'][0]" /></font>
						</td>
					</tr>
					<tr>
						<td class="td_label w100">商户全称：</td>
						<td><s:textfield name="provider.FULL_NAME" theme="simple" cssClass="td_txt w350 not_null" maxlength="50" />
							<span class="cr">*</span><font color='red'><s:property value="errors['provoider.FULL_NAME'][0]" /></font></td>
					</tr>

					<tr>
						<td class="td_label w100">负责人：</td>
						<td>
							<s:textfield name="provider.AGENT" theme="simple" cssClass="td_txt w190 not_null" maxlength="10" />
							<span class="cr">*</span><font color='red'><s:property value="errors['provoider.AGENT'][0]" /></font></td>
					</tr>
					<tr>
						<td class="td_label w100">负责人电话：</td>
						<td>
							<s:textfield name="provider.TELEPHONE" theme="simple" cssClass="td_txt w190 not_null" maxlength="20" />
							<span class="cr">*</span><font color='red'><s:property value="errors['provoider.TELEPHONE'][0]" /></font></td>
					</tr>
					<tr>
						<td class="td_label w100">店面区域：</td>
						<td><s:select id="region1" name="region1" list="regions1"  theme="simple" cssClass="not_null" listKey="id" listValue="name" onchange="changeReg1(this.value);"></s:select> 
							<s:select id="region2" name="region2" list="regions2"  theme="simple" cssClass="not_null" listKey="id" listValue="name" onchange="changeReg2(this.value);"></s:select> 
							<s:select id="region3" name="provider.REGION_ID" list="regions3"  theme="simple" cssClass="not_null" listKey="id" listValue="name" ></s:select> 
						<span class="cr">*</span>
					</td>
					</tr>
					<tr>
						<td class="td_label w100">店面地址：</td>
						<td>
							<s:textfield name="provider.ADDRESS" theme="simple" cssClass="td_txt w350 not_null" maxlength="20" />
							<span class="cr">*</span><font color='red'><s:property value="errors['provoider.ADDRESS'][0]" /></font></td>
					</tr>
					<tr>
						<td class="td_label w100">服务热线：</td>
						<td>
						<s:textfield name="provider.SERVICE_PHONE" theme="simple" cssClass="td_txt 190 not_null" maxlength="20" />
								
							</td>
					</tr>
					<tr>
						<td class="td_label w100">服务时间：</td>
						<td>
						<s:textfield name="provider.SERVICE_TIME" theme="simple" cssClass="td_txt w190 not_null" maxlength="20" />
						<span>格式：7:30 - 20:00</span>
						</td>
					</tr>
					<tr>
						<td class="td_label w100">商家资质：</td>
						<td>
						<s:textfield name="provider.QUALIFICATION" theme="simple" cssClass="td_txt w350 not_null" maxlength="20" />
								
							</td>
					</tr>
					<tr>
						<td class="td_label">商家介绍：</td>
						<td>
						
						<s:textarea name="provider.REMARK"  cssStyle="width:500px;height:100px;" theme="simple" />
							
						</td>
					</tr>
					<tr>

						<td colspan="2" align="center">
							<div class="frmbutton">
								<a class="btn btn-small btn-primary"  href="javascript:document.forms[0].submit();">提交</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</s:form>
	</div>
</body>
</html>
