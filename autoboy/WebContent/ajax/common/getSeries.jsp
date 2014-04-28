<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.autoboys.domain.VehicleSeries" %>
<%@ page language="java" import="java.util.*"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<div class="new_select_box_progress progress2">
	<a class="select_car_field" field="brand"  onclick="getVehicleBrand('<s:property value="#session.firstCharacter"/>')"></a> 
	<a class="select_car_field nolink" field="series"></a> 
	<a class="select_car_field nolink" field="year"></a> 
	<a class="select_car_field nolink" field="model"></a>
</div>
<div class="new_select_box_hasselect" style="display: block;">
<em>已选车型:</em>
<span class="cartype">
<a onclick="getVehicleBrand('<s:property value="#session.firstCharacter"/>')"><img src="${pageContext.request.contextPath}/image/close.jpg"></a><span><s:property value="#session.curBrandName"/></span>
</span>

</div>
<div class="new_select_box_content">
	<div class="step step2" style="display: block;">
		<div class="car_info_series_list">
			
				<div class='car_info_series_list'>
					<%
					List<VehicleSeries> seriesList = (List<VehicleSeries>)request.getAttribute("seriesList");
					System.out.println("Size:"+seriesList.size());
					Map<String,String> groups = new HashMap<String,String>();
					for(VehicleSeries vc : seriesList){
					       groups.put(vc.getManufacturer(),"");
					}
					for(String m : groups.keySet()){
						out.println("<div class='series_title'>");
						out.println(m);
						out.println("</div>");
						out.println("<ul class='series_list'>");
						for(VehicleSeries vc : seriesList){
						   if(m.equals(vc.getManufacturer())){
							   out.println("<li series_id='"+ vc.getCode() +"' series_name='"+ vc.getCname() +"' class=''>"+ vc.getCname() +"</li>");    
						     }
						}
						out.println("</ul>");
						
					}
					%>
									
				
				</div>
				<script>
				$$('.step2').getElements('li').each(function(even){
					even.addEvents({
					'click':getVehicleEmission,
					'mouseenter':function(){
						this.toggleClass('hover');
						},
					'mouseleave':function(){
						this.toggleClass('hover');
						}
					});
				});
				</script>
			
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