<%@ page contentType="text/html; charset=utf-8"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="CN">
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">

<title></title>
<link rel="StyleSheet"
	href="<%=request.getContextPath() %>/css/main.css" type="text/css">
</head>

<body class="logged-out ytype" screen_capture_injected="true">
	<!-- 服务流程 -->
	<div class="yck-box">
		<div id="progressbarDv" class="g-progressbar">

			<ul class="g-progressbar-pic g-clear">
				<li class="g-circle g-left-finished"><span>1</span></li>
				<li class="g-line"></li>
				<li class="g-circle g-middle-finished js-middle1"><span>2</span></li>
				<li class="g-line"></li>
				<li class="g-circle g-middle-finished js-middle2 g-right-actived"><span>3</span></li>
				<li class="g-line"></li>
				<li class="g-circle g-middle-finished"><span>4</span></li>
				<li class="g-line"></li>
				<li class="g-circle g-right-finished"><span>5</span></li>
			</ul>
			<ul class="g-progressbar-text g-clear">
				<li class="on">填写用车信息</li>
				<li class="on">养车客建议保养方案</li>
				<li class="on">选择服务商家</li>
				<li class="on">现场保养</li>
				<li class="on">点评商家服务</li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!-- 服务流程 -->
	</div>
	<div class="yck-box">
		<div id="page-diagnosis">
			<div class="diagnosis_header">
				<div class="diagnosis_brand">
					<div class="diagnosis_bpic">
						<a href="/baike/b-biaozhi.html" target="_blank"><img
							src="<%=request.getContextPath()%>/image/biaozhi.gif"
							width="100px" height="100px" alt="标致"></a>

					</div>
				</div>
				<div class="diagnosis_carinfo">
					<p class="diagnosis_selectcar">四轮子车管家</p>
					<p class="diagnosis_changetc">您选定的保养项目</p>
					<p class="diagnosis_items">
						机油 / 机油滤清器 / 空气滤清器 / 汽油滤清器 / 空调滤清器 / 火花塞&nbsp;<a href="">[更换保养项目]</a>
					</p>

				</div>

			</div>
		</div>
		<div class="filter">
			<dl class="filter-list filter-area">
				<dt>区域选择：</dt>
				<dd>
					<select>
						<option>上海</option>
						<option>浦东新区</option>
					</select>
				</dd>
			</dl>
			<dl class="filter-list filter-order">
				<dt>排序方式：</dt>
				<dd>
					<ul id="typeSort">
						<li class=" first"><a
							href="http://www.xiaomi.com/accessories/1-0-0-0">评分</a></li>
						<li><a href="http://www.xiaomi.com/accessories/1-0-1-0">成交量</a></li>
						<li class="current"><a
							href="http://www.xiaomi.com/accessories/1-0-8-0"><span
								class="icon-common icon-order-ascending"></span>价格由低到高</a></li>
						<li><a href="http://www.xiaomi.com/accessories/1-0-10-0"><span
								class="icon-common icon-order-descending"></span>价格由高到低</a></li>

					</ul>
				</dd>
			</dl>
			<dl style="clear: both;"></dl>
		</div>
		<div class="clearfix diagnosis-wrap">

			<div class="provider-proposal">
				<div class="shop-tit">
					<div class="shop-name">
						<h1 class="shop-title" itemprop="name itemreviewed">博世快修(赞贝)</h1>

					</div>
					<div class="comment-rst" itemprop="rating" itemscope=""
						itemtype="http://data-vocabulary.org/Rating">
						<span title="准五星商户" class="item-rank-rst irr-star45"><meta
								itemprop="rating" content="4">评分:准五星商户</span>
						<div class="rst-taste">
							<a
								onclick="pageTracker._trackPageview('dp_test_shop_dianpingshu_shanghai_food');"
								href="#user-review-info" class="col-exp">(<em
								itemprop="count">117</em>)
							</a> <em class="sep">|</em> <span class="rst">环境<strong>4.5</strong></span>
							<span class="rst">质量<strong>4.0</strong></span> <span class="rst">态度<strong>4.5</strong></span>
							<a
								onclick="pageTracker._trackPageview('dp_test_shop_stardetail_shanghai_food');"
								href="javascript:;" class="branch"></a>
						</div>
					</div>
				</div>
				<table class="shop_price_list" cellpacing="1px">
					<thead>
						<tr class="tr_sl_head">
							<td class="sl_tc_title title_by_item">保养项目</td>
							<td class="sl_tc_title title_by_parts">配件使用</td>
							<td class="sl_tc_title title_by_price">弼马温价格<span
								class="font12">（低于门市价）</span></td>
							<td class="sl_tc_title title_by_detail last-cell"><p
									class="title_expend title_todown" tcid="63,53,84,98,89,208"
									onclick="partShowOrHide('100089',this)">展开价格明细</p></td>
						</tr>
					</thead>
					<tbody>
						<tr class="taocan_row" tcid="63,53,84,98,89,208" shopid="100089"
							url="/order/book.aspx?partsids=63,53,84,98,89,208&amp;cbid=114&amp;csid=11401&amp;cmid=11401017&amp;runnum=90000&amp;shopid=100089&amp;year=2013&amp;month=1">
							<td><div class="taocan_text">更换机油等等</div></td>
							<td class="sl_tc_txt sc_txt">
								<div class="taocan_text">机油(壳牌蓝喜力，5升),机油滤清器,空气滤清器,汽油滤清器,空调滤清器,火花塞(NGK普通，4个)</div>
							</td>
							<td class="st_price">
								<div class="taocan_text">
									<span class="fontprice">￥989</span> <span class="font-gongshi">(包含工时)</span><br>
									<span class="font-gongshi">4S店:</span> <span class="font-4s">￥2000</span>
									<span class="font-pare">立省￥1011</span>
								</div>
							</td>
							<td class="sl_tc_spareprice last-cell">
								<div class="taocan_text">
									<p class="btn_choose_yuyue">
										<a href="Recommend_3.html" class="toorder on">立即预约</a>
									</p>
								</div>
							</td>
						</tr>


						<tr class="taocan_row" tcid="102,53,84,98,89,208" shopid="100089"
							url="/order/book.aspx?partsids=102,53,84,98,89,208&amp;cbid=114&amp;csid=11401&amp;cmid=11401017&amp;runnum=90000&amp;shopid=100089&amp;year=2013&amp;month=1">
							<td><div class="taocan_text">更换机油等等</div></td>
							<td class="sl_tc_txt sc_txt">
								<div class="taocan_text">机油(壳牌黄喜力，5升),机油滤清器,空气滤清器,汽油滤清器,空调滤清器,火花塞(NGK普通，4个)</div>
							</td>
							<td class="st_price">
								<div class="taocan_text">
									<span class="fontprice">￥804</span> <span class="font-gongshi">(包含工时)</span><br>
									<span class="font-gongshi">4S店:</span> <span class="font-4s">￥1800</span>
									<span class="font-pare">立省￥996</span>
								</div>
							</td>
							<td class="sl_tc_spareprice last-cell">
								<div class="taocan_text">
									<p class="btn_choose_yuyue">
										<a href="Recommend_3.html" class="toorder on">立即预约</a>
									</p>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="provider-proposal">
				<div class="shop-tit">
					<div class="shop-name">
						<h1 class="shop-title" itemprop="name itemreviewed">欢乐跑道（银都路）</h1>

					</div>
					<div class="comment-rst" itemprop="rating" itemscope=""
						itemtype="http://data-vocabulary.org/Rating">
						<span title="准五星商户" class="item-rank-rst irr-star45"><meta
								itemprop="rating" content="4">评分:准五星商户</span>
						<div class="rst-taste">
							<a
								onclick="pageTracker._trackPageview('dp_test_shop_dianpingshu_shanghai_food');"
								href="#user-review-info" class="col-exp">(<em
								itemprop="count">117</em>)
							</a> <em class="sep">|</em> <span class="rst">环境<strong>4.5</strong></span>
							<span class="rst">质量<strong>4.0</strong></span> <span class="rst">态度<strong>4.5</strong></span>
							<a
								onclick="pageTracker._trackPageview('dp_test_shop_stardetail_shanghai_food');"
								href="javascript:;" class="branch"></a>
						</div>
					</div>
				</div>
				<table class="shop_price_list" cellpacing="1px">
					<thead>
						<tr class="tr_sl_head">
							<td class="sl_tc_title title_by_item">保养项目</td>
							<td class="sl_tc_title title_by_parts">配件使用</td>
							<td class="sl_tc_title title_by_price">弼马温价格<span
								class="font12">（低于门市价）</span></td>
							<td class="sl_tc_title title_by_detail last-cell"><p
									class="title_expend title_todown" tcid="63,53,84,98,89,208"
									onclick="partShowOrHide('100089',this)">展开价格明细</p></td>
						</tr>
					</thead>
					<tbody>
						<tr class="taocan_row" tcid="63,53,84,98,89,208" shopid="100089"
							url="/order/book.aspx?partsids=63,53,84,98,89,208&amp;cbid=114&amp;csid=11401&amp;cmid=11401017&amp;runnum=90000&amp;shopid=100089&amp;year=2013&amp;month=1">
							<td><div class="taocan_text">更换机油等等</div></td>
							<td class="sl_tc_txt sc_txt">
								<div class="taocan_text">机油(壳牌蓝喜力，5升),机油滤清器,空气滤清器,汽油滤清器,空调滤清器,火花塞(NGK普通，4个)</div>
							</td>
							<td class="st_price">
								<div class="taocan_text">
									<span class="fontprice">￥989</span> <span class="font-gongshi">(包含工时)</span><br>
									<span class="font-gongshi">4S店:</span> <span class="font-4s">￥2000</span>
									<span class="font-pare">立省￥1011</span>
								</div>
							</td>
							<td class="sl_tc_spareprice last-cell">
								<div class="taocan_text">
									<p class="btn_choose_yuyue">
										<a href="Recommend_3.html" class="toorder on">立即预约</a>
									</p>
								</div>
							</td>
						</tr>


						<tr class="taocan_row" tcid="102,53,84,98,89,208" shopid="100089"
							url="/order/book.aspx?partsids=102,53,84,98,89,208&amp;cbid=114&amp;csid=11401&amp;cmid=11401017&amp;runnum=90000&amp;shopid=100089&amp;year=2013&amp;month=1">
							<td><div class="taocan_text">更换机油等等</div></td>
							<td class="sl_tc_txt sc_txt">
								<div class="taocan_text">机油(壳牌黄喜力，5升),机油滤清器,空气滤清器,汽油滤清器,空调滤清器,火花塞(NGK普通，4个)</div>
							</td>
							<td class="st_price">
								<div class="taocan_text">
									<span class="fontprice">￥804</span> <span class="font-gongshi">(包含工时)</span><br>
									<span class="font-gongshi">4S店:</span> <span class="font-4s">￥1800</span>
									<span class="font-pare">立省￥996</span>
								</div>
							</td>
							<td class="sl_tc_spareprice last-cell">
								<div class="taocan_text">
									<p class="btn_choose_yuyue">
										<a href="Recommend_3.html" class="toorder on">立即预约</a>
									</p>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

		</div>
	</div>


</body>
</html>
