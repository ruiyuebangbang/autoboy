<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<meta http-equiv="imagetoolbar" content="no">
<title>养车客商家后台：汽车配件管理</title>
<script src="../scripts/jquery-1.11.0.js"></script>
<script language="javascript">
function f_selServiceCat(sel) {
	$('#selCategory').val(sel);
	//alert($('#selCategory').val());
	document.forms[0].submit();
}
function f_selService(sel) {
	$('#eService_providerProduct_service_id').val(sel);
	document.forms[0].submit();
}
function f_selBrand(sel) {
	$('#eService_providerProduct_brand_id').val(sel);
	document.forms[0].submit();
}
function f_selName(sel) {
	$('#eService_providerProduct_name').val(sel);
	//alert($('#eService_providerProduct_name').val());
	document.forms[0].submit();
}
function f_updateprice(id,product_id,i) {

    var discount_price = $("#discount_price"+i).children().val();
    var labour_price = $("#labour_price"+i).children().val();
    //alert(discount_price);
    $.post( "../ajax/common/updateProductPrice.action", 
    	{ "id":id,"product_id":product_id,"discount_price":discount_price,"labour_price":labour_price},
	  function( data ) {  
		  //alert(data);
		  $("#total_price"+i).html(data);
		 }
	);
}
function f_gotoPage(sel){
    //alert(sel);
    $('#eService_pager_pageCurr').val(sel);

    document.forms[0].submit();
}
</script>

</head>
<body>
	<div class="pcontent-title">
		<h1>汽车配件管理</h1>
	</div>
	<s:form method="post"  theme="simple">
	
	<s:hidden  name="providerProduct.name"/>
	<s:hidden  name="providerProduct.brand_id"/>
	<s:hidden  name="providerProduct.service_id"/>
	<s:hidden  id="selCategory" name="selCategory" />
	
	<s:hidden  name="pager.pageSize"/>
	<s:hidden  name="pager.pageCurr"/>
	
	<s:hidden/>
	<s:hidden/>
	<s:hidden/>
		<div class="ab-box">
			<div class="bd">
				<dl class="ab-filter-list clearfix">
					<dt>服务分类：</dt>
					<dd>
						<ul id="typeAdapt">
							<s:if test='null==selCategory||""==selCategory'>
							<li class="first current">
							</s:if>
							<s:else>
							<li>
							</s:else>
							<a href="javascript:f_selServiceCat(null)">全部</a></li>
                            <s:iterator value="cats">
                            <s:if test="code == selCategory">
                            <li class="first current">
                            </s:if>
                            <s:else>
                            <li>
                            </s:else>
                            <a href="javascript:f_selServiceCat('<s:property value="code"/>')"><s:property value="name"/></a></li>
							</s:iterator>
						</ul>
					</dd>
					<dt>服务项目：</dt>
					<dd>
						<ul id="typeCat">
							<s:if test='null==providerProduct.service_id||""==providerProduct.service_id'>
							<li class="first current">
							</s:if>
							<s:else>
							<li>
							</s:else>
							<a href="javascript:f_selService(null)">全部</a></li>
							<s:iterator value="sevs">
                            <s:if test='CODE == providerProduct.service_id'>
							<li class="first current">
							</s:if>
							<s:else>
							<li>
							</s:else>
                            <a href="javascript:f_selService('<s:property value="CODE"/>')"><s:property value="NAME"/></a></li>
							</s:iterator>
						</ul>
					</dd>
                    <dt>品牌：</dt>
					<dd>
						<ul id="typeCat">
							<s:if test='null==providerProduct.brand_id'>
							<li class="first current">
							</s:if>
							<s:else>
							<li>
							</s:else>
							<a href="javascript:f_selBrand(null)">全部</a></li>
							<s:iterator value="brands">
							<s:if test="id == providerProduct.brand_id">
							<li class="first current">
							</s:if>
							<s:else>
							<li>
							</s:else>
                            <a href="javascript:f_selBrand('<s:property value="id"/>')"><s:property value="name"/></a></li>
							</s:iterator>
						</ul>
					</dd>
                    <dt>产品名：</dt>
					<dd>
						<ul id="typeCat">
							<s:if test='null==providerProduct.name||""==providerProduct.name'>
							<li class="first current">
							</s:if>
							<s:else>
							<li>
							</s:else>
							<a href="javascript:f_selName(null)">全部</a></li>
							<s:iterator value="distinctprds" id = "prd">
                            <s:if test="#prd==providerProduct.name">
							<li class="first current">
							</s:if>
							<s:else>
							<li>
							</s:else>
                            <a href="javascript:f_selName('<s:property value="#prd"/>')"><s:property value="#prd"/></a></li>
							</s:iterator>
						</ul>
					</dd>
				</dl>
			</div>
		</div>
	</s:form>
	<div
		style="height: 10px; border-top: 1px solid #e6e9ed; clear: both"></div>
	<table class="tblist" style="padding-top: 20px;">
		<thead>
			<tr>
				<th style="width: 90px">项目</th>
				<th>品牌规格</th>
				<th>市场价</th>
				<th>折扣价</th>
				<th>工时费</th>
				<th>总价</th>
				<th>最低价</th>
				<th>最高价</th>
			</tr>
		</thead>
		<tbody>
           <% int i =1;%>
           <s:iterator value="providerProductList" status="rowstat">
                <tr>
                <td><s:property value="name"/></td>
				<td><s:property value="specification"/></td>
				<td><s:property value="standard_price"/></td>
				<td id="discount_price<%=i%>"><s:textfield  theme="simple" cssClass="price" name="discount_price" onblur="javascript:f_updateprice('%{id}','%{product_id}','%{#rowstat.count}');"/></td>
				<td id="labour_price<%=i%>"><s:textfield theme="simple" cssClass="price" name="labour_price" onblur="javascript:f_updateprice('%{id}','%{product_id}','%{#rowstat.count}');"/></td>
				<td id="total_price<%=i%>"><s:property value="total_price"/></td>
				<td><s:property value="max_price"/></td>
				<td><s:property value="min_price"/></td>
                </tr> 
         <% i++;%>          
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
	<div style="clear: both;padding-top: 20px;padding-left: 16px;">
<span>注：以上价钱均为人民币</span>
</div>
</body>
</html>