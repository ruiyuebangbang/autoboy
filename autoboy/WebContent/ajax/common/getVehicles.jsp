<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="new_select_box_progress progress4">
	<a class="select_car_field" field="brand" onclick="getVehicleBrand('<s:property value="#session.firstCharacter"/>')"></a> 
	<a class="select_car_field" field="series"  onclick="toStep2(<s:property value="#session.curBrandCode"/>)"></a> 
	<a class="select_car_field nolink" field="year"  onclick="toStep3(<s:property value="#session.curSeriesCode"/>)"></a> 
	<a class="select_car_field nolink" field="model"></a>
	
</div>
<div class="new_select_box_hasselect" style="display: block;">
	<em>已选车型:</em>
	<span class="cartype">
		<a onclick="getVehicleBrand('<s:property value="#session.firstCharacter"/>')"><img src="${pageContext.request.contextPath}/image/close.jpg"></a><span><s:property value="#session.curBrandName"/></span>
	</span>
	<span class="cartype">
		<a onclick="toStep2('<s:property value="#session.curBrandCode"/>')"><img src="${pageContext.request.contextPath}/image/close.jpg"></a><span><s:property value="#session.curSeriesName"/></span>
	</span>
	<span class="cartype">
		<a onclick="toStep3('<s:property value="#session.curSeriesCode"/>')"><img src="${pageContext.request.contextPath}/image/close.jpg"></a><span><s:property value="#session.curEmissionName"/></span>
	</span>
	
</div>
<div class="new_select_box_content">
	<div class="step step4" style="display: block;">
		<div class='car_info_series_list'>
			<s:if test="vehicleList.size() > 0">
				<ul class='series_list'>
					<s:iterator value="vehicleList" status="id">
						<li vehicle_id='<s:property value="id" />' vehicle_name='<s:property value="fullName" />' class=''><s:property value="fullName" /></li>
					</s:iterator>
				
				</ul>
				<script>
					$$('.step4').getElements('li').each(function(even){
						
						even.addEvents({
							'click':confirmVehicle,
							'mouseenter':function(){
							this.toggleClass('hover');
							},
							'mouseleave':function(){
							this.toggleClass('hover');
							}
						});
					});
				</script>
			</s:if>
		</div>
	</div>
</div>
<div class="new_select_history">
	<div class="new_select_history_title">您浏览过的其他车型：</div>
	<div class="new_select_history_list">
		<ul id="choosed_car_info_history">

		</ul>

	</div>
</div>