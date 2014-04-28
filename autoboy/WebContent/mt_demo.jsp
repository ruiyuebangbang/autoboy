<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"	src="<%=request.getContextPath()%>/scripts/mootools.js"></script>
<style>
.tab_list {
	overflow: hidden;
	display: none;
}

.new_select_box_top {
	height: 50px;
	line-height: 50px;
	font-size: 14px;
	font-weight: bold;
	color: #2e3032;
	padding: 0px 20px;
}

.new_select_box_top a {
	margin-left: 10px;
	font-weight: normal;
	font-size: 12px;
	color: #2c89f1;
	text-decoration: underline;
}

.new_select_box_vin {
	border: 1px solid #ebebeb;
	margin: 0px 20px;
	overflow: hidden;
	height: 95px;
	background: url(http://img.chemayi.com/public/select_bar_bg1.png)
		repeat-x;
	padding: 0px 13px;
}

.vin_top {
	margin-top: 9px;
	overflow: hidden;
}

.vin_top span {
	display: block;
	float: left;
	height: 30px;
	width: 33px;
	margin-left: 6px;
	text-align: center;
	line-height: 30px;
	color: #6c6c6c;
}

.vin_input {
	overflow: hidden;
}

.vin_input span {
	width: 31px;
	height: 36px;
	border: 1px solid #9c9c9c;
	margin-left: 6px;
	overflow: hidden;
	display: block;
	float: left;
}

.vin_input span input {
	width: 31px;
	height: 36px;
	border: none;
	border: 0;
	text-align: center;
	line-height: 36px;
	outline: none;
}

.vin_link {
	height: 46px;
	line-height: 46px;
	margin: 0px 20px;
}

.vin_link a {
	margin-right: 25px;
	color: #2298dc;
}

.vin_link a:hover {
	text-decoration: underline;
}

/*.new_select_box_vin span{ display:block; float:left; height:24px; line-height:24px;}.new_select_box_vin span.sp1{ font-size:14px; color:#333;}.new_select_box_vin span input{ width:63px; height:22px; border:1px solid #fad2a9; background:#fef1d6; color:#666; text-align:center; font-size:14px;}.new_select_box_vin span input.focus{ border:1px solid #fa805b;}.new_select_box_vin span.sp2{ width:14px; color:#000; text-align:center;}.new_select_box_vin span.sp3{ margin-left:10px;}.new_select_box_vin span.sp3 a.search_vin{ width:72px; height:22px; border:1px solid #acaeb2; background:#eee; color:#666; text-align:center; line-height:22px; display:block; border-radius:2px;}.new_select_box_vin span.sp4{ float:right; margin-right:5px;}.new_select_box_vin span.sp4 a{ font-size:12px; color:#2c89f1; text-decoration:underline;}*/
.new_select_box_progress {
	height: 50px;
	margin-top: 10px;
	overflow: hidden;
	margin: 0 10px 0px;
}

.new_select_box_progress a {
	width: 25%;
	display: block;
	height: 28px;
	cursor: pointer;
	float: left;
}

.progress1 {
	background: url(/auto/image/process_1.png) -6px -6px no-repeat;
}

.progress2 {
	background: url(/auto/image/service/process_2.png) -6px -6px no-repeat;
}

.progress3 {
	background: url(/auto/image/process_3.png) -6px -6px no-repeat;
}

.new_select_box_hasselect {
	margin: 10px 10px 16px;
	display: none;
	overflow: hidden;
}

.new_select_box_hasselect em {
	display: block;
	float: left;
	height: 34px;
	line-height: 34px;
	font-style: normal;
	color: #333;
	font-weight: bold;
}

.new_select_box_hasselect .cartype {
	padding: 5px 5px 0 0;
	overflow: hidden;
	display: block;
	float: left;
	margin-left: 17px;
	position: relative;
}

.new_select_box_hasselect .cartype a {
	position: absolute;
	display: block;
	top: 0px;
	right: 0px;
	cursor: pointer;
}

.new_select_box_hasselect .cartype span {
	width: 75px;
	height: 28px;
	border: 1px solid #fa5f19;
	background: #ffebdc;
	padding: 0px 19px;
	display: block;
	text-align: center;
	line-height: 28px;
	color: #fa5f19;
}

.new_select_bypin {
	height: 30px;
	padding-top: 10px;
	margin-left: 10px;
	overflow: hidden;
}

.new_select_bypin span {
	color: #333;
	font-weight: bold;
	font-size: 13px;
	display: block;
	float: left;
	line-height: 20px;
}

.new_select_bypin a {
	display: block;
	float: left;
	width: 19px;
	height: 17px;
	border: 1px solid #fa5f19;
	line-height: 18px;
	text-align: center;
	font-size: 12px;
	color: #fa5f19;
	margin-right: 9px;
}

.new_select_bypin a.hot {
	width: 31px;
	height: 23px;
	background: url(http://img.chemayi.com/service/hot.png) no-repeat;
	line-height: 20px;
	text-align: center;
	color: #fff;
	font-size: 12px;
	margin-right: 10px;
	border: none;
}

.new_select_bypin a.cur_letter {
	
}

.new_select_box_content {
	height: 206px;
	overflow: hidden;
	border: 1px dashed #c5c5c5;
	border-left: none;
	border-right: none;
	overflow-y: auto;
	position: relative;
	margin: 0px 10px;
}

.step1 {
	overflow: hidden;
}

.step1 ul {
	width: 698px;
	overflow: hidden;
}

.step1 ul li {
	width: 145px;
	height: 36px;
	overflow: hidden;
	float: left;
	margin: 15px 17px 0px 0px;
	border: 1px solid #cdcdcd;
	padding: 4px;
	position: relative;
	color: #6c6c6c;
	line-height: 36px;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	border-radius: 2px;
}

.step1 ul li .logo {
	width: 32px;
	height: 32px;
	overflow: hidden;
	position: absolute;
	margin: 2px 0;
	left: 10px;
}

.step1 ul li b {
	display: block;
	height: 36px;
	line-height: 36px;
	margin-left: 51px;
	border-left: 1px solid #e5e5e5;
	padding-left: 10px;
}

.step1 ul li em {
	display: block;
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(http://img.chemayi.com/service/01_06.jpg) no-repeat;
	display: none;
}

.step1 ul li.hover {
	background: #ffebdc;
	border: 1px solid #fa5f19;
	color: #fa5f19;
}

.step1 ul li.hover b {
	border-left: 1px solid #faa57a;
}

.step1 ul li.cur {
	background: #fa5f19;
	border: 1px solid #fa5f19;
	color: #fff;
}

.step1 ul li.cur em {
	display: block;
}

.step1 ul li.cur b {
	border-left: 1px solid #efa27f;
}

.step2 {
	display: none;
	overflow: hidden;
}

.step2 dl {
	width: 764px;
	overflow: hidden;
}

.step2 dl dt {
	font-size: 14px;
	font-weight: bold;
	color: #f8825a;
	text-indent: 18px;
	background: url(http://img.chemayi.com/service/point.jpg) no-repeat 5px
		7px;
	height: 20px;
	line-height: 20px;
	margin-top: 10px;
}

.step2 dl dd {
	width: 93px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	font-size: 12px;
	color: #2e3032;
	border: 1px solid #e5e5e5;
	float: left;
	margin: 6px 10px 4px 4px;
	position: relative;
	cursor: pointer;
}

.step2 dl dd.hover {
	background: #fef1d6;
	border: 1px solid #facea0;
}

.step2 dl dd.cur {
	background: #fef1d6;
	border: 1px solid #fa805b;
}

.step2 dl dd em {
	display: block;
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(http://img.chemayi.com/service/01_06.jpg) no-repeat;
	display: none;
}

.step2 dl dd.cur em {
	display: block;
}

.car_info_series_list {
	height: 206px;
	overflow: hidden;
	overflow-y: auto;
	position: relative;
}

.series_title {
	font-size: 14px;
	color: #2e3032;
	text-indent: 18px;
	background: url(http://img.chemayi.com/service/point.png) no-repeat left
		center;
	height: 30px;
	line-height: 30px;
	margin-top: 12px;
}

.series_list {
	overflow: hidden;
	width: 698px;
}

.series_list li {
	width: 93px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	font-size: 12px;
	color: #2e3032;
	border: 1px solid #e5e5e5;
	float: left;
	margin: 7px 20px 8px 0px;
	position: relative;
	cursor: pointer;
	border-radius: 2px;
}

.series_list li.hover {
	background: #ffebdc;
	border: 1px solid #fa5f19;
	color: #fa5f19;
}

.series_list li.cur {
	background: #fa5f19;
	border: 1px solid #fa5f19;
	color: #fff;
}

.step3 {
	overflow: hidden;
	display: none;
}

.step3 ul {
	width: 698px;
	overflow: hidden;
	padding: 5px 0px;
}

.step3 ul li {
	width: 93px;
	height: 28px;
	overflow: hidden;
	float: left;
	margin: 15px 20px 0px 0px;
	border: 1px solid #cdcdcd;
	position: relative;
	color: #2e3032;
	line-height: 28px;
	font-size: 14px;
	cursor: pointer;
	text-align: center;
	border-radius: 2px;
}

.step3 ul li.hover {
	background: #ffebdc;
	border: 1px solid #fa5f19;
	color: #fa5f19
}

.step3 ul li.cur {
	background: #fa5f19;
	border: 1px solid #fa5f19;
	color: #fff;
}

.step3 ul li em {
	display: block;
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(http://img.chemayi.com/service/01_06.jpg) no-repeat;
	display: none;
}

.step3 ul li.cur em {
	display: block;
}

.step4 {
	overflow: hidden;
	display: none;
}

.step4 ul {
	width: 698px;
	overflow: hidden;
	padding: 5px 0px;
}

.step4 ul li {
	width: 324px;
	height: 28px;
	overflow: hidden;
	float: left;
	margin: 15px 20px 0px 0px;
	border: 1px solid #e5e5e5;
	position: relative;
	color: #2e3032;
	line-height: 28px;
	font-size: 12px;
	cursor: pointer;
	text-align: center;
	border-radius: 2px;
}

.step4 ul li.hover {
	background: #ffebdc;
	border: 1px solid #fa5f19;
	color: #fa5f19;
}

.step4 ul li.cur {
	background: #fa5f19;
	border: 1px solid #fa5f19;
	color: #fff;
}

.step4 ul li em {
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(http://img.chemayi.com/service/01_06.jpg) no-repeat;
	display: none;
}

.step4 ul li.cur em {
	display: block;
}

.mycartype {
	font-size: 14px;
	color: #f8825a;
}

.rechoosecartype {
	font-size: 12px;
	color: #41b5f1;
	text-decoration: underline;
	cursor: pointer;
}

.new_select_history {
	overflow: hidden;
	margin: 0px 10px;
}

.new_select_history_title {
	height: 48px;
	overflow: hidden;
	line-height: 48px;
	font-size: 13px;
	color: #333;
	font-weight: bold;
}

.new_select_history_list {
	overflow: hidden;
}

.new_select_history_list ul {
	width: 698px;
	overflow: hidden;
}

.new_select_history_list ul li {
	width: 325px;
	height: 28px;
	line-height: 28px;
	border: 1px solid #e5e5e5;
	text-align: center;
	float: left;
	margin-right: 18px;
	color: #2299de;
	cursor: pointer;
	margin-bottom: 10px;
	font-size: 12px;
	border-radius: 2px;
}

.select_opacity {
	overflow: hidden;
	height: 30px;
}

.select_opacity a {
	display: block;
	float: left;
	padding: 0px 10px;
	height: 28px;
	line-height: 28px;
	color: #666;
	background: #e9e9e9;
	border: 1px solid #fff;
	margin-right: 7px;
	cursor: pointer;
	position: relative;
}

.select_opacity a.hover {
	background: #fcf9da;
	border: 1px solid #ff9700;
}

.select_opacity a.cur {
	background: #fef1d6;
	border: 1px solid #fa805b;
}

.select_opacity a em {
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(http://img.chemayi.com/service/01_06.jpg) no-repeat;
	display: none;
}

.select_opacity a.cur em {
	display: block;
}

.xuanmo_yusuan {
	overflow: hidden;
}

.yusuan_input {
	width: 72px;
	height: 28px;
	border: 1px solid #abafb2;
	overflow: hidden;
	float: left;
	margin-right: 10px;
}

.yusuan_input input {
	border: none;
	width: 50px;
	height: 26px;
	line-height: 26px;
	font-size: 14px;
	color: #666;
	text-align: center;
}

.yusuan_tip {
	height: 30px;
	line-height: 30px;
	color: #f8825a;
}

.select_tiemo {
	overflow: hidden;
	height: 30px;
}

.select_tiemo a {
	display: inline-block;
	float: left;
	height: 28px;
	padding: 0px 24px;
	line-height: 28px;
	color: #666;
	background: #fff;
	border: 1px solid #adaeb2;
	margin-right: 7px;
	cursor: pointer;
	text-align: center;
	position: relative;
	margin-bottom: 5px;
	white-space: nowrap;
}

.select_tiemo a.hover {
	background: #fcf9da;
	border: 1px solid #ff9700;
}

.select_tiemo a.cur {
	background: #fef1d6;
	border: 1px solid #fa805b;
}

.select_tiemo a em {
	width: 15px;
	height: 15px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	background: url(http://img.chemayi.com/service/01_06.jpg) no-repeat;
	display: none;
}

.select_tiemo a.cur em {
	display: block;
}

.select_tiemo_pipei {
	height: 98px;
	border: 1px solid #ff9700;
	background: #fcf9da;
	width: 496px;
	padding: 1px 1px 0px;
}

.select_tiemo_pipei ul {
	width: 497px;
	overflow: hidden;
}

.select_tiemo_pipei li {
	float: left;
	border-right: 1px solid #ff9700;
}

.select_tiemo_pipei li span {
	display: block;
	width: 100%;
}

.select_tiemo_pipei li span.pipei_title {
	height: 42px;
	background: #f8825a;
	color: #fff;
	font-weight: bold;
	text-align: center;
	line-height: 42px;
	overflow: hidden;
}

.select_tiemo_pipei li span.pipei_info {
	height: 56px;
	color: #666;
	text-align: center;
	line-height: 56px;
	overflow: hidden;
}

.ser_tel {
	height: 96px
}

.ser_r_info {
	width: 215px;
	padding: 10px 15px;
}

.ser_r_info h3 {
	color: #f8825a;
	font-size: 14px;
	height: 28px;
	line-height: 24px;
}

.ser_r_info p {
	line-height: 22px;
	padding:
}

.chongxuankeeppro {
	display: block;
	float: left;
	height: 40px;
	line-height: 40px;
	color: #41b5f1;
	text-decoration: underline;
}
</style>
</head>
<script>
window.addEvent('domready', function() {
	$('car_info_brands_list').getElements('li').each(function(even){
		even.addEvents({
			'mouseenter':function(){
				this.toggleClass('hover');
			},
			'mouseleave':function(){
				this.toggleClass('hover');
			}
		});
	});
});
</script>
<body>
<div class="step step1" style="display: block;" id="step1"><ul id="car_info_brands_list"><li class="" brand_id="1" brand_name="DS"><span class="logo"><img src="http://img.chemayi.com/thumb/5232b8efaa97b_32_X_32.jpg" brand_id="1"></span><b brand_id="1">DS</b> <em></em></li><li class="" brand_id="32" brand_name="大众"><span class="logo"><img src="http://img.chemayi.com/thumb/5232b8efaa97b_32_X_32.jpg" brand_id="32"></span><b brand_id="32">大众</b> <em></em></li><li class="" brand_id="33" brand_name="道奇"><span class="logo"><img src="http://img.chemayi.com/thumb/5232b8efaa97b_32_X_32.jpg" brand_id="33"></span><b brand_id="33">道奇</b> <em></em></li><li class="" brand_id="34" brand_name="帝豪"><span class="logo"><img src="http://img.chemayi.com/thumb/5232b8efaa97b_32_X_32.jpg" brand_id="34"></span><b brand_id="34">帝豪</b> <em></em></li><li class="" brand_id="36" brand_name="东风风神"><span class="logo"><img src="http://img.chemayi.com/thumb/5232b8efaa97b_32_X_32.jpg" brand_id="36"></span><b brand_id="36">东风风神</b> <em></em></li><li class="" brand_id="38" brand_name="东南"><span class="logo"><img src="http://img.chemayi.com/thumb/5232b8efaa97b_32_X_32.jpg" brand_id="38"></span><b brand_id="38">东南</b> <em></em></li></ul></div>
</body>
</html>