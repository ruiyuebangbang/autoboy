<%@ page contentType="text/html; charset=utf-8"%>

<html>
   
<head>
	
	<meta name="description" content="专业汽车保养、维修服务平台">
	<meta name="keywords" content="">
	<title> 四轮子：专业汽车保养、维修服务平台</title>
  	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
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
            <span class="_1">填写车型信息</span>
            <span class="_2">智能推荐保养项目</span>
            <span class="_3">免费获取服务报价</span>
            <span class="_4">到场实施保养</span>
            <span class="_5">对服务进行点评</span>
        </div>
    </div>
</div>
<!-- 服务流程 -->	
<div class="select_auto">
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
	<a href="<%=request.getContextPath()%>/service/plan.action" class="tostep2 on">呼，填好了！看看要做什么保养项目</a>
</div>


</div>
  
</body>
</html>
