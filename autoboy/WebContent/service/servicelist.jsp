<%@ page contentType="text/html; charset=utf-8"%>

<html>
   
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Language" content="CN">
	<meta name="description" content="专业汽车保养、维修服务平台">
	<meta name="keywords" content="">
	
	<title></title>
  	
  	<link rel="StyleSheet" href="<%=request.getContextPath() %>/css/main.css" type="text/css">
</head>

<body class="logged-out ytype" screen_capture_injected="true">
	

			<!-- 服务流程 -->	
			<div class="helper_flow">
            	<div class="helper_flow_step total_5 step_1">
                    <div class="helper_flow_step_line">
                        
                        <div class="helper_flow_progress_num">
                            <span><em class="_1">1</em></span>
                            <span><em class="_2">2</em></span>
                            <span><em class="_3">3</em></span>
                            <span><em class="_4">4</em></span>
                            <span><em class="_5">5</em></span>
                        </div>
                    </div>
                    <div class="helper_flow_step_text">
                        <span class="_1">发布服务需求</span>
                        <span class="_2">免费获取服务报价</span>
                        <span class="_3">选择服务方案，预约服务</span>
                        <span class="_4">到场实施服务</span>
                        <span class="_5">对服务进行点评</span>
                    </div>
                </div>
            </div>
			<!-- 所有服务选项Begin -->	
			<div class="serviceoption_list">
                <div class="tctype_parent_option notopborder" typeid="35">
	                <p class="tctype_parent_name">养护类：</p>
	                <p class="tc_parent_child">
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="40" typeid="40" id="demandtype_kuang_40"><label for="demandtype_kuang_40">更换机油、机滤</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="41" typeid="41" id="demandtype_kuang_41"><label for="demandtype_kuang_41">更换空气滤芯</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="42" typeid="42" id="demandtype_kuang_42"><label for="demandtype_kuang_42">更换空调滤芯</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="43" typeid="43" id="demandtype_kuang_43"><label for="demandtype_kuang_43">更换汽油滤芯</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="44" typeid="44" id="demandtype_kuang_44"><label for="demandtype_kuang_44">更换火花塞</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="45" typeid="45" id="demandtype_kuang_45"><label for="demandtype_kuang_45">更换变速箱油</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="50" typeid="50" id="demandtype_kuang_50"><label for="demandtype_kuang_50">清洗节气门</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="51" typeid="51" id="demandtype_kuang_51"><label for="demandtype_kuang_51">清洗喷油嘴</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="52" typeid="52" id="demandtype_kuang_52"><label for="demandtype_kuang_52">更换刹车油</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="53" typeid="53" id="demandtype_kuang_53"><label for="demandtype_kuang_53">更换防冻液</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="65" typeid="65" id="demandtype_kuang_65"><label for="demandtype_kuang_65">皮带及相关</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="68" typeid="68" id="demandtype_kuang_68"><label for="demandtype_kuang_68">更换助力油</label></span>
	                    
	                </p>
	            </div>
	            
	            <div class="tctype_parent_option " typeid="36">
	                <p class="tctype_parent_name">油漆类：</p>
	                <p class="tc_parent_child">
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="37" typeid="37" id="demandtype_kuang_37"><label for="demandtype_kuang_37">漆面修补</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="38" typeid="38" id="demandtype_kuang_38"><label for="demandtype_kuang_38">全车改色</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="39" typeid="39" id="demandtype_kuang_39"><label for="demandtype_kuang_39">钣金喷漆</label></span>
	                    
	                </p>
	            </div>
	            
	            <div class="tctype_parent_option " typeid="59">
	                <p class="tctype_parent_name">刹车类：</p>
	                <p class="tc_parent_child">
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="48" typeid="48" id="demandtype_kuang_48"><label for="demandtype_kuang_48">更换刹车片</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="49" typeid="49" id="demandtype_kuang_49"><label for="demandtype_kuang_49">更换刹车盘</label></span>
	                    
	                </p>
	            </div>
	            
	            <div class="tctype_parent_option " typeid="60">
	                <p class="tctype_parent_name">轮胎类：</p>
	                <p class="tc_parent_child">
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="47" typeid="47" id="demandtype_kuang_47"><label for="demandtype_kuang_47">更换轮胎</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="54" typeid="54" id="demandtype_kuang_54"><label for="demandtype_kuang_54">四轮定位</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="69" typeid="69" id="demandtype_kuang_69"><label for="demandtype_kuang_69">补胎/轮胎修复</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="71" typeid="71" id="demandtype_kuang_71"><label for="demandtype_kuang_71">轮毂修复</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="72" typeid="72" id="demandtype_kuang_72"><label for="demandtype_kuang_72">轮毂改装</label></span>
	                    
	                </p>
	            </div>
	            
	            <div class="tctype_parent_option " typeid="61">
	                <p class="tctype_parent_name">空调类：</p>
	                <p class="tc_parent_child">
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="62" typeid="62" id="demandtype_kuang_62"><label for="demandtype_kuang_62">空调清洗</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="63" typeid="63" id="demandtype_kuang_63"><label for="demandtype_kuang_63">空调维修</label></span>
	                    
	                </p>
	            </div>
	            
	            <div class="tctype_parent_option " typeid="64">
	                <p class="tctype_parent_name">其他类：</p>
	                <p class="tc_parent_child">
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="55" typeid="55" id="demandtype_kuang_55"><label for="demandtype_kuang_55">蓄电池</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="56" typeid="56" id="demandtype_kuang_56"><label for="demandtype_kuang_56">雨刮片</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="58" typeid="58" id="demandtype_kuang_58"><label for="demandtype_kuang_58">喇叭</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="66" typeid="66" id="demandtype_kuang_66"><label for="demandtype_kuang_66">避震</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="67" typeid="67" id="demandtype_kuang_67"><label for="demandtype_kuang_67">下摆臂</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="70" typeid="70" id="demandtype_kuang_70"><label for="demandtype_kuang_70">灯泡</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="75" typeid="75" id="demandtype_kuang_75"><label for="demandtype_kuang_75">自带配件/求施工</label></span>
	                    
	                </p>
	            </div>
	            
	            <div class="tctype_parent_option " typeid="76">
	                <p class="tctype_parent_name">贴膜：</p>
	                <p class="tc_parent_child">
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="77" typeid="77" id="demandtype_kuang_77"><label for="demandtype_kuang_77">威固</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="78" typeid="78" id="demandtype_kuang_78"><label for="demandtype_kuang_78">龙膜</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="79" typeid="79" id="demandtype_kuang_79"><label for="demandtype_kuang_79">3M</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="80" typeid="80" id="demandtype_kuang_80"><label for="demandtype_kuang_80">雷朋</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="81" typeid="81" id="demandtype_kuang_81"><label for="demandtype_kuang_81">其他品牌</label></span>
	                    
	                </p>
	            </div>
	            
	            <div class="tctype_parent_option " typeid="82">
	                <p class="tctype_parent_name">美容：</p>
	                <p class="tc_parent_child">
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="83" typeid="83" id="demandtype_kuang_83"><label for="demandtype_kuang_83">车身打蜡</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="84" typeid="84" id="demandtype_kuang_84"><label for="demandtype_kuang_84">内饰清洗</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="85" typeid="85" id="demandtype_kuang_85"><label for="demandtype_kuang_85">车身镀膜</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="86" typeid="86" id="demandtype_kuang_86"><label for="demandtype_kuang_86">皮革护理</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="87" typeid="87" id="demandtype_kuang_87"><label for="demandtype_kuang_87">消毒去味</label></span>
	                    
	                </p>
	            </div>
	            
	            <div class="tctype_parent_option " typeid="88">
	                <p class="tctype_parent_name">加装：</p>
	                <p class="tc_parent_child">
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="89" typeid="89" id="demandtype_kuang_89"><label for="demandtype_kuang_89">导航</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="90" typeid="90" id="demandtype_kuang_90"><label for="demandtype_kuang_90">倒车雷达</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="91" typeid="91" id="demandtype_kuang_91"><label for="demandtype_kuang_91">倒车影像</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="92" typeid="92" id="demandtype_kuang_92"><label for="demandtype_kuang_92">真皮座椅</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="93" typeid="93" id="demandtype_kuang_93"><label for="demandtype_kuang_93">灯光改装</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="94" typeid="94" id="demandtype_kuang_94"><label for="demandtype_kuang_94">车身贴膜改色</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="95" typeid="95" id="demandtype_kuang_95"><label for="demandtype_kuang_95">定制脚垫</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="96" typeid="96" id="demandtype_kuang_96"><label for="demandtype_kuang_96">定制座椅套</label></span>
	                    
	                    <span><input type="checkbox" onclick="changePartOption(this)" value="97" typeid="97" id="demandtype_kuang_97"><label for="demandtype_kuang_97">其他项目</label></span>
	                    
	                </p>
	            </div>
	            <!-- 车况信息Begin -->
				<div class="select_auto select_auto_service">
				<div class="diagone_car_item font_yahei first_item">
	                <p class="item_title">选择车型：</p>
	                <div class="form_control_container"><input type="text" name="run" id="mycarrun" value="" placeholder="选择保养车车型" class="control_value"><span class="control_more control_unit"></span></div>
	            </div>
            	<div class="diagone_car_item font_yahei first_item">
	                <p class="item_title">行驶里程：</p>
	                <div class="form_control_container"><input type="text" name="run" id="mycarrun" value="" placeholder="请输入行驶公里数" class="control_value"><span class="control_more control_unit">km</span></div>
	            </div>
				<div class="diagone_car_item font_yahei first_item">
	                <p class="item_title">购车时间：</p>
	                
	                	<div class="step_one_row_right">
                              	<select class="onroad_year" name="byear">
                                    <option>请选择</option>
                                    <option>2014</option>
                                    <option>2013</option>
                                    <option>2012</option>
                                    <option>2011</option>
                                    <option>2010</option>
                                    <option>2009</option>
                                    <option>2008</option>
                                    <option>2007</option>
                                    <option>2006</option>
                                    <option>2005</option>
                                    <option>2004</option>
                                    <option>2003</option>
                                    <option>2002</option>
                                    <option>2001</option>
                                    <option>2000</option>
                              	</select>
                              	&nbsp;&nbsp;年&nbsp;&nbsp;
                              	<select class="onroad_month" name="bmonth">
                                    <option>请选择</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                    <option>11</option>
                                    <option>12</option>
                              	</select>
                              	&nbsp;&nbsp;月&nbsp;&nbsp; 
							</div>
	                
	            </div>
	            <div class="diagone_car_item font_yahei first_item">
	                <p class="item_title">上次保养里程：</p>
	                <div class="form_control_container"><input type="text" name="run" id="mycarrun" value="" placeholder="请输入上次保养里程数" class="control_value"><span class="control_more control_unit">km</span></div>
	            </div>
				<div class="diagone_car_item font_yahei first_item">
	                <p class="item_title">上次保养时间：</p>
	                <div class="step_one_row_right">
                              	<select class="onroad_year" name="byear">
                                    <option>请选择</option>
                                    <option>2014</option>
                                    <option>2013</option>
                                    <option>2012</option>
                                    <option>2011</option>
                                    <option>2010</option>
                                    <option>2009</option>
                                    <option>2008</option>
                                    <option>2007</option>
                                    <option>2006</option>
                                    <option>2005</option>
                                    <option>2004</option>
                                    <option>2003</option>
                                    <option>2002</option>
                                    <option>2001</option>
                                    <option>2000</option>
                              	</select>
                              	&nbsp;&nbsp;年&nbsp;&nbsp;
                              	<select class="onroad_month" name="bmonth">
                                    <option>请选择</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                    <option>11</option>
                                    <option>12</option>
                              	</select>
                              	&nbsp;&nbsp;月&nbsp;&nbsp; 
							</div>
	            </div>
				
			</div>
			<!-- 车况信息End -->
	        </div>				
				<!-- 所有服务选项End -->
				
				<!-- 服务用户信息Begin -->
				<div class="order_user_info">
					<img src="<%=request.getContextPath()%>/image/order_userinfo.png" border="0"/>
				</div>
				<!-- 服务用户信息End -->
				<a href="<%=request.getContextPath()%>/service/bids.action" class="tostep2 on">呼，填好了！等待服务商精准报价</a>
	</div>

  
</body>
</html>
