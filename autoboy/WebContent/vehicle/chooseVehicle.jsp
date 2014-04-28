<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/main.css" type="text/css">
<style>
.choosecar_content {background-color:#ffffff;border-radius: 8px;width:100%; float:left;}
.choosecar_content .choosecar_change {padding: 37px 67px 30px 68px; float:left;background-color:#ffffff;}
.choosecar_change .choosecar_query {width:488px; float:left;background-color:#e13f38;padding:3px; position:relative;}
.choosecar_query input {width:415px; padding-left:5px; float:left; border:0; height:31px;line-height:31px; color:#666666; font-size:14px;}
.choosecar_query a {float:right;width:60px;text-align:center;height:33px;line-height:33px; font-size:14px; color:#ffffff;}
.choosecar_query a:hover {text-decoration:none;}
.choosecar_query .search_keylist {position:absolute;top:34px;left:0; width:420px;background-color:#ffffff;border:solid 3px #e13f38; border-top:0; height:135px; z-index:9999;}
.choosecar_query .search_keylist li {font-size:14px; color:#666666; height:27px;padding-left:5px;width:415px;float:left; line-height:27px; cursor:pointer;}
.choosecar_query .search_keylist li:hover {background-color:#FF9206;}
.choosecar_change .choosecar_hotcar {float:left;width:100%; font-size:12px;color:#b9b9b9; line-height:20px;margin-top:5px;_margin-top:3px;}
.choosecar_change .choosecar_hotcar span.hotcar_key {margin-right:5px; cursor:pointer;}
.choosecar_change .choosecar_hotcar span.selected { color:#e13f38;}
.choosecar_change .choosecar_hotcar .choosecar_hotkey_title {width:40px;float:left;}
.choosecar_change .choosecar_carinfo {float:left;width:100%;margin-top:30px;_margin-top:15px;}
.choosecar_change .choosecar_carinfo .form_control_container {margin-left:0;}
.choosecar_change .choosecar_carbutton {float: left;margin-top: 10px;height: 30px;}
.choosecar_change .choosecar_carbutton input {width:118px; text-align:center; height:32px; background-color:#989898; color:#ffffff; border:0; font-size:14px;-webkit-appearance: none; }
.choosecar_content .choosecar_browse {float:left;width:494px; border-top:solid 1px #d0d0d0;padding: 20px 68px 30px 68px;}
.choosecar_browse .choosecar_browse_title {float:left;width:100%; font-size:14px; color:#1f81c1; line-height:30px;}
.choosecar_browse .choosecar_browse_carlist {float:left;}
.choosecar_browse .choosecar_browse_carlist li {float:left;width:230px;height:29px;border:solid 1px #bcbcbc; padding:0 5px 0 5px; text-align:center; line-height:29px; margin:5px 0; cursor:pointer; overflow:hidden;}
.choosecar_browse .choosecar_browse_carlist li.caritem_left {margin-right:10px;_margin-right:5px;}
.choosecar_browse .choosecar_browse_carlist li.selected {color:#e13f38;}
</style>
</head>
<body>
<div class="choosecar_content">
            <div class="choosecar_change">
                <div class="choosecar_query">
                    <input type="text" name="txt_key" class="txt_querykey" placeholder="如：凯越" lastkey="思">
                    <a href="javascript:;" class="font_yahei">查找</a>
                <ul class="search_keylist" style="display: none;"><li cbid="109" csid="10922" keyname="飞思">现代飞思</li><li cbid="113" csid="11306" keyname="思铂睿">本田思铂睿</li><li cbid="113" csid="11310" keyname="思迪">本田思迪</li><li cbid="150" csid="" keyname="思铭">思铭</li><li cbid="119" csid="11916" keyname="思锐">比亚迪思锐</li></ul></div>
                <div class="choosecar_hotcar font_yahei">
                    <span class="choosecar_hotkey_title">热门：</span>
                    
                    <span class="hotcar_key" csid="10002" cbid="100" cmid="">朗逸</span>
                    
                    <span class="hotcar_key" csid="10201" cbid="102" cmid="">凯越</span>
                    
                    <span class="hotcar_key" csid="10005" cbid="100" cmid="">速腾</span>
                    
                    <span class="hotcar_key" csid="11203" cbid="112" cmid="">轩逸</span>
                    
                    <span class="hotcar_key" csid="10501" cbid="105" cmid="">科鲁兹</span>
                    
                    <span class="hotcar_key" csid="10003" cbid="100" cmid="">宝来</span>
                    
                    <span class="hotcar_key" csid="10008" cbid="100" cmid="">帕萨特</span>
                    
                    <span class="hotcar_key" csid="10801" cbid="108" cmid="">福克斯</span>
                    
                    <span class="hotcar_key" csid="10601" cbid="106" cmid="">明锐</span>
                    
                    <span class="hotcar_key" csid="10012" cbid="100" cmid="">捷达</span>
                    
                    <span class="hotcar_key" csid="10502" cbid="105" cmid="">雪佛兰赛欧</span>
                    <br><span class="choosecar_hotkey_title">&nbsp;</span>
                    <span class="hotcar_key" csid="10004" cbid="100" cmid="">途观</span>
                    
                    <span class="hotcar_key" csid="11305" cbid="113" cmid="">本田CR-V</span>
                    
                    <span class="hotcar_key" csid="10903" cbid="109" cmid="">现代ix35</span>
                    
                    <span class="hotcar_key" csid="10807" cbid="108" cmid="">福特翼虎</span>
                    
                    <span class="hotcar_key" csid="11004" cbid="110" cmid="">奥迪A4</span>
                    
                    <span class="hotcar_key" csid="11003" cbid="110" cmid="">奥迪Q5</span>
                    
                    <span class="hotcar_key" csid="10303" cbid="103" cmid="">宝马5系</span>
                    
                    <span class="hotcar_key" csid="10405" cbid="104" cmid="">奔驰C级</span>
                    
                </div>
                <div class="choosecar_carinfo">
                    
                    
                    
                <div class="form_control_container" style="width: 116.99999237060547px; margin-left: 0px; margin-right: 8px;"><input type="text" id="mycar_select_carbrand" style="width: 82.99999237060547px;" value="品牌" class="control_value" tipname="品牌" val="113" txt="本田" defaultval="113"><span class="control_more" style=""></span><ul class="control_droplist" style="display: none;"><li class="droplist_item" txt="奥迪" val="110" name="A 奥迪"><span>A 奥迪</span></li><li class="droplist_item" txt="宝骏" val="116" name="B 宝骏"><span>B 宝骏</span></li><li class="droplist_item" txt="宝马" val="103" name="B 宝马"><span>B 宝马</span></li><li class="droplist_item" txt="保时捷" val="220" name="B 保时捷"><span>B 保时捷</span></li><li class="droplist_item" txt="奔驰" val="104" name="B 奔驰"><span>B 奔驰</span></li><li class="droplist_item" txt="奔腾" val="167" name="B 奔腾"><span>B 奔腾</span></li><li class="droplist_item selected" txt="本田" val="113" name="B 本田"><span>B 本田</span></li><li class="droplist_item" txt="标致" val="114" name="B 标致"><span>B 标致</span></li><li class="droplist_item" txt="别克" val="102" name="B 别克"><span>B 别克</span></li><li class="droplist_item" txt="比亚迪" val="119" name="B 比亚迪"><span>B 比亚迪</span></li><li class="droplist_item" txt="长安" val="144" name="C 长安"><span>C 长安</span></li><li class="droplist_item" txt="长城" val="166" name="C 长城"><span>C 长城</span></li><li class="droplist_item" txt="传祺" val="153" name="C 传祺"><span>C 传祺</span></li><li class="droplist_item" txt="道奇" val="152" name="D 道奇"><span>D 道奇</span></li><li class="droplist_item" txt="大众" val="100" name="D 大众"><span>D 大众</span></li><li class="droplist_item" txt="帝豪" val="120" name="D 帝豪"><span>D 帝豪</span></li><li class="droplist_item" txt="东风风神" val="154" name="D 东风风神"><span>D 东风风神</span></li><li class="droplist_item" txt="东南" val="146" name="D 东南"><span>D 东南</span></li><li class="droplist_item" txt="丰田" val="107" name="F 丰田"><span>F 丰田</span></li><li class="droplist_item" txt="福特" val="108" name="F 福特"><span>F 福特</span></li><li class="droplist_item" txt="海马" val="159" name="H 海马"><span>H 海马</span></li><li class="droplist_item" txt="华泰" val="184" name="H 华泰"><span>H 华泰</span></li><li class="droplist_item" txt="江淮" val="147" name="J 江淮"><span>J 江淮</span></li><li class="droplist_item" txt="捷豹" val="221" name="J 捷豹"><span>J 捷豹</span></li><li class="droplist_item" txt="吉普" val="117" name="J 吉普"><span>J 吉普</span></li><li class="droplist_item" txt="凯迪拉克" val="138" name="K 凯迪拉克"><span>K 凯迪拉克</span></li><li class="droplist_item" txt="雷克萨斯" val="206" name="L 雷克萨斯"><span>L 雷克萨斯</span></li><li class="droplist_item" txt="雷诺" val="126" name="L 雷诺"><span>L 雷诺</span></li><li class="droplist_item" txt="力帆" val="155" name="L 力帆"><span>L 力帆</span></li><li class="droplist_item" txt="铃木" val="131" name="L 铃木"><span>L 铃木</span></li><li class="droplist_item" txt="路虎" val="222" name="L 路虎"><span>L 路虎</span></li><li class="droplist_item" txt="马自达" val="130" name="M 马自达"><span>M 马自达</span></li><li class="droplist_item" txt="名爵" val="148" name="M 名爵"><span>M 名爵</span></li><li class="droplist_item" txt="MINI" val="209" name=" MINI"><span> MINI</span></li><li class="droplist_item" txt="纳智捷" val="151" name="N 纳智捷"><span>N 纳智捷</span></li><li class="droplist_item" txt="讴歌" val="237" name="O 讴歌"><span>O 讴歌</span></li><li class="droplist_item" txt="启辰" val="149" name="Q 启辰"><span>Q 启辰</span></li><li class="droplist_item" txt="奇瑞" val="123" name="Q 奇瑞"><span>Q 奇瑞</span></li><li class="droplist_item" txt="起亚" val="111" name="Q 起亚"><span>Q 起亚</span></li><li class="droplist_item" txt="日产" val="112" name="R 日产"><span>R 日产</span></li><li class="droplist_item" txt="荣威" val="125" name="R 荣威"><span>R 荣威</span></li><li class="droplist_item" txt="瑞麒" val="157" name="R 瑞麒"><span>R 瑞麒</span></li><li class="droplist_item" txt="三菱" val="121" name="S 三菱"><span>S 三菱</span></li><li class="droplist_item" txt="双龙" val="243" name="S 双龙"><span>S 双龙</span></li><li class="droplist_item" txt="斯巴鲁" val="216" name="S 斯巴鲁"><span>S 斯巴鲁</span></li><li class="droplist_item" txt="斯柯达" val="106" name="S 斯柯达"><span>S 斯柯达</span></li><li class="droplist_item" txt="思铭" val="150" name="S 思铭"><span>S 思铭</span></li><li class="droplist_item" txt="Smart" val="218" name=" Smart"><span> Smart</span></li><li class="droplist_item" txt="沃尔沃" val="132" name="W 沃尔沃"><span>W 沃尔沃</span></li><li class="droplist_item" txt="现代" val="109" name="X 现代"><span>X 现代</span></li><li class="droplist_item" txt="雪佛兰" val="105" name="X 雪佛兰"><span>X 雪佛兰</span></li><li class="droplist_item" txt="雪铁龙" val="124" name="X 雪铁龙"><span>X 雪铁龙</span></li><li class="droplist_item" txt="英菲尼迪" val="219" name="Y 英菲尼迪"><span>Y 英菲尼迪</span></li><li class="droplist_item" txt="英伦" val="136" name="Y 英伦"><span>Y 英伦</span></li><li class="droplist_item" txt="一汽" val="128" name="Y 一汽"><span>Y 一汽</span></li><li class="droplist_item" txt="中华" val="143" name="Z 中华"><span>Z 中华</span></li><li class="droplist_item" txt="众泰" val="161" name="Z 众泰"><span>Z 众泰</span></li></ul></div><div class="form_control_container" style="width: 126.99999237060547px; margin-left: 0px; margin-right: 9px;"><input type="text" id="mycar_select_carseries" style="width: 92.99999237060547px;" value="车系" class="control_value" tipname="车系" val="11303" txt="思域" defaultval="11303"><span class="control_more" style=""></span><ul class="control_droplist" style="display: none;"><li class="droplist_item" txt="艾力绅" val="11311" name="A 艾力绅"><span>A 艾力绅</span></li><li class="droplist_item" txt="奥德赛" val="11307" name="A 奥德赛"><span>A 奥德赛</span></li><li class="droplist_item" txt="CR-V" val="11305" name="  CR-V"><span>  CR-V</span></li><li class="droplist_item" txt="CR-Z" val="11315" name="  CR-Z"><span>  CR-Z</span></li><li class="droplist_item" txt="飞度" val="11308" name="F 飞度"><span>F 飞度</span></li><li class="droplist_item" txt="锋范" val="11304" name="F 锋范"><span>F 锋范</span></li><li class="droplist_item" txt="歌诗图" val="11309" name="G 歌诗图"><span>G 歌诗图</span></li><li class="droplist_item" txt="Insight" val="11316" name="  Insight"><span>  Insight</span></li><li class="droplist_item" txt="凌派" val="11312" name="L 凌派"><span>L 凌派</span></li><li class="droplist_item" txt="思铂睿" val="11306" name="S 思铂睿"><span>S 思铂睿</span></li><li class="droplist_item" txt="思迪" val="11310" name="S 思迪"><span>S 思迪</span></li><li class="droplist_item selected" txt="思域" val="11303" name="S 思域"><span>S 思域</span></li><li class="droplist_item" txt="雅阁" val="11301" name="Y 雅阁"><span>Y 雅阁</span></li></ul></div><div class="form_control_container" style="width: 227px; margin: 0px;"><input type="text" id="mycar_select_carmodel" style="width: 193px;" value="车型" class="control_value" tipname="车型" val="" txt=""><span class="control_more" style=""></span><ul class="control_droplist" style="display: none;"><li class="droplist_item" txt="2013款 1.8" val="11303130" name="2013款 1.8"><span>2013款 1.8</span></li><li class="droplist_item" txt="2013款 1.8 手动" val="11303030" name="2013款 1.8 手动"><span>2013款 1.8 手动</span></li><li class="droplist_item" txt="2013款 2.0" val="11303131" name="2013款 2.0"><span>2013款 2.0</span></li><li class="droplist_item" txt="2012款 1.8" val="11303125" name="2012款 1.8"><span>2012款 1.8</span></li><li class="droplist_item" txt="2012款 1.8 手动" val="11303040" name="2012款 1.8 手动"><span>2012款 1.8 手动</span></li><li class="droplist_item" txt="2012款 2.0" val="11303126" name="2012款 2.0"><span>2012款 2.0</span></li><li class="droplist_item" txt="2011款 1.8" val="11303128" name="2011款 1.8"><span>2011款 1.8</span></li><li class="droplist_item" txt="2011款 1.8 手动" val="11303127" name="2011款 1.8 手动"><span>2011款 1.8 手动</span></li><li class="droplist_item" txt="2009款 1.3" val="11303129" name="2009款 1.3"><span>2009款 1.3</span></li><li class="droplist_item" txt="2009款 1.8" val="11303123" name="2009款 1.8"><span>2009款 1.8</span></li><li class="droplist_item" txt="2009款 1.8 手动" val="11303080" name="2009款 1.8 手动"><span>2009款 1.8 手动</span></li><li class="droplist_item" txt="2009款 思域Si 2.0 手动" val="11303137" name="2009款 思域Si 2.0 手动"><span>2009款 思域Si 2.0 手动</span></li><li class="droplist_item" txt="2009款 思域SiCoupe 2.0 手动" val="11303136" name="2009款 思域SiCoupe 2.0 手动"><span>2009款 思域SiCoupe 2.0 手动</span></li><li class="droplist_item" txt="2008款 1.8" val="11303124" name="2008款 1.8"><span>2008款 1.8</span></li><li class="droplist_item" txt="2008款 1.8 手动" val="11303100" name="2008款 1.8 手动"><span>2008款 1.8 手动</span></li><li class="droplist_item" txt="2008款 思域Hybrid 1.3" val="11303133" name="2008款 思域Hybrid 1.3"><span>2008款 思域Hybrid 1.3</span></li><li class="droplist_item" txt="2008款 思域R 2.0 手动" val="11303134" name="2008款 思域R 2.0 手动"><span>2008款 思域R 2.0 手动</span></li><li class="droplist_item" txt="2006款 1.8" val="11303122" name="2006款 1.8"><span>2006款 1.8</span></li><li class="droplist_item" txt="2006款 1.8 手动" val="11303121" name="2006款 1.8 手动"><span>2006款 1.8 手动</span></li><li class="droplist_item" txt="2005款 思域-三厢 1.7" val="11303132" name="2005款 思域-三厢 1.7"><span>2005款 思域-三厢 1.7</span></li></ul></div></div>
                <div class="choosecar_carbutton">
                    <input type="button" value="确定   &gt;">
                    <span id="choosecar_cartip" style="color:red"></span>
                </div>
            </div>
            <div class="choosecar_browse font_yahei">
                <div class="choosecar_browse_title">您浏览过的车型</div>
                <ul class="choosecar_browse_carlist"></ul>
            </div>
        </div>
</body>
</html>