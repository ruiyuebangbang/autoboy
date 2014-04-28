<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="new_select_box_progress progress1">
	<div class="new_select_box_progress progress1">
	<a class="select_car_field nolink" field="brand" onclick="getVehicleBrand('B')"></a> 
	<a class="select_car_field nolink" field="series"></a> 
	<a class="select_car_field nolink" field="year"></a> 
	<a class="select_car_field nolink" field="model"></a>
</div>
<div class="new_select_box_hasselect" style="display: block;">
	<em>已选车型:</em><span class="cartype"><a onclick="rechooseCartype(21, 'brand')"><img src="http://img.chemayi.com/service/new_close.jpg"></a><span>标致</span></span>
</div>
</div>
<div id="new_select_bypin" class="new_select_bypin" style="display: block;">
	<span>品牌首字母：</span> 
	<a href="###" class="b_first hot" hot="true" onclick="getVehicleBrand('1')"></a>
	<a href="javascript:void(0)" class="b_first" onclick="getVehicleBrand('A')">A</a> 
	<a href="###" class="b_first cur_letter" onclick="getVehicleBrand('B')">B</a>
	<a href="###" class="b_first" onclick="getVehicleBrand('C')">C</a>
	<a href="###" class="b_first" onclick="getVehicleBrand('D')">D</a> 
	<a href="###" class="b_first" onclick="getVehicleBrand('F')">F</a>
	<a href="###" class="b_first" onclick="getVehicleBrand('H')">H</a> 
	<a href="###" class="b_first" onclick="getVehicleBrand('J')">J</a>
	<a href="###" class="b_first" onclick="getVehicleBrand('K')">K</a> 
	<a href="###" class="b_first" onclick="getVehicleBrand('L')">L</a>
	<a href="###" class="b_first" onclick="getVehicleBrand('M')">M</a> 
	<a href="###" class="b_first" onclick="getVehicleBrand('Q')">Q</a>
	<a href="###" class="b_first" onclick="getVehicleBrand('R')">R</a> 
	<a href="###" class="b_first" onclick="getVehicleBrand('S')">S</a>
	<a href="###" class="b_first" onclick="getVehicleBrand('T')">T</a> 
	<a href="###" class="b_first" onclick="getVehicleBrand('W')">W</a>
	<a href="###" class="b_first" onclick="getVehicleBrand('X')">X</a> 
	<a href="###" class="b_first" onclick="getVehicleBrand('Y')">Y</a>
	<a href="###" class="b_first" onclick="getVehicleBrand('Z')">Z</a>
</div>
<div class="new_select_box_content" id="new_select_box_content">
	<div class="step step1" style="display: block;" id="step1">
		<s:if test="brandList.size() > 0">
			<ul id='car_info_brands_list'>
				<s:iterator value="brandList" status="code">
					<li class='' brand_id='<s:property value="code" />' brand_name='<s:property value="cname" />'>
		            <span class='logo'><img src='<%=request.getContextPath()%>/image/brand/<s:property value="brandLogo" />' brand_id='<s:property value="code" />' width="32px" height="32px"/>
		            </span>
					<b brand_id='<s:property value="code" />'><s:property value="cname" /></b> <em></em>
					</li>
				</s:iterator>
			
			</ul>
			<script>
				$$('.step1').getElements('li').each(function(even){
					
					even.addEvents({
						'click':getVehicleSeries,
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
<div class="new_select_history">
	<div class="new_select_history_title">您浏览过的其他车型：</div>
	<div class="new_select_history_list">
		<ul id="choosed_car_info_history">

		</ul>

	</div>
</div>
