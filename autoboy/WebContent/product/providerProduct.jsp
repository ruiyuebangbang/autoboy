<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html>
<head>
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<meta http-equiv="imagetoolbar" content="no">
<title>养车客商家后台：汽车配件管理</title>

</head>
<body>
	<div class="pcontent-title">
		<h1>汽车配件管理</h1>
	</div>
	<s:form method="post"  theme="simple">
	
	<s:hidden  name="pager.pageSize"/>
	<s:hidden  name="pager.pageCurr"/>
	
	<s:hidden/>
	<s:hidden/>
	<s:hidden/>
		<div class="ab-box">
			<div class="bd">
				<dl class="ab-filter-list clearfix">
					<dt>服务项目：</dt>
					<dd>
						<s:select name="selCategory" headerKey="" headerValue="全部" list="cats"  theme="simple" cssClass="service" listKey="code" listValue="name" onchange="javascript:changeSeviceCat(this.value);"/>
						<s:select id="service_id" name="providerProduct.service_id" headerKey="" headerValue="全部" list="sevs"  theme="simple" cssClass="service" listKey="CODE" listValue="NAME" />
						
					</dd>
					
                    <dt>配件品牌：</dt>
					<dd>
						<s:select id="service_id" name="providerProduct.brand_id" headerKey="" headerValue="全部" list="brands"  theme="simple" cssClass="service" listKey="" listValue="name" />
						
					</dd>
                    <dt>配件名称：</dt>
					<dd>
						<s:textfield name="providerProduct.name" theme="simple" style="width:160px;" maxlength="50" />
						<span><input type="submit" class="btn btn-small btn-primary" value="查询"></span>
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
				<th>配件名称</th>
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
                <td class="ta-left"><s:property value="name"/></td>
				<td class="ta-left"><s:property value="specification"/></td>
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
        <a class="numbers" href="javascript:f_gotoPage(<s:property/>);"><s:property/></a></s:if><s:else><a class="numbers" href="javascript:f_gotoPage(<s:property/>);"><s:property/></a>
        </s:else>
        </s:iterator>
        <a class="numbers last" href="javascript:f_gotoPage( <s:property value="pager.pageNext"/>);">下一页</a>
    </div>
	
</body>
</html>