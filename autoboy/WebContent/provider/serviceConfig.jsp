<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta name="description" content="专业汽车保养、维修服务">
<meta name="keywords" content="">
<title>设置维修保养项目：养车客商家后台</title>

</head>

<body class="logged-out ytype">
	<div class="pcontent-title">
			<h1>服务项目设置</h1>
		</div>
	<div class="pproject">
		<s:form id="serviceForm" method="post" theme="simple">
		<s:iterator value="serviceCats" status="rows">
		<dl class="clearfix">
			<dt>
				<input type="checkbox" name="cat" value="<s:property value="code" />" class="cat" id="<s:property value="code" />">
				<label for="<s:property value="code" />" class="checkboxLabel"><s:property value="name" /></label>
			</dt>
			<dd id='service-<s:property value="code" />'>
				<!-- ul>
					<s:iterator value="services" id="inner"> 
					<li>
						<input type="checkbox" name="service" value="<s:property value="#inner.CODE" />" id="<s:property value="#inner.CODE" />">
						<label for="<s:property value="#inner.CODE" />" class="checkboxLabel"><s:property value="#inner.NAME" /></label>
					</li>
					</s:iterator>
					
				</ul -->
				<s:checkboxlist list="services" listKey="CODE" listValue="NAME" value="providerServices" name="providerServices" />
			</dd>
		</dl>
		</s:iterator>
		<div style="text-align:center;"><input type="submit" class="btn btn-small btn-primary" value="选好了，提交"></div>
		</s:form>
		
	</div>
	
<script type="text/javascript">
window.addEvent('domready', function() {
	$$('.cat').each(function(even){
		even.addEvents({
			'change':function(){
				var catCode = this.getProperty('value');
				var serviceIpt = "service-"+catCode; 
				
				$(serviceIpt).getElements("input").each(function(obj){
					//alert(even.getProperty('value'));
					if(even.checked){
						obj.checked="checked";
					}else{
						obj.setProperty("checked","");
						//alert("false");
						}
				});
				/*
				this.parentNode.parentNode.getElements("input").each(function(event){
					
					});
				*/
			},
			'mouseenter':function(){
			this.toggleClass('hover');
			
			},
			'mouseleave':function(){
			this.toggleClass('hover');
			}
		});
	});
})
</script>
</body>
</html>
