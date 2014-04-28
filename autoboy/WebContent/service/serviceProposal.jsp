<%@ page contentType="text/html; charset=utf-8"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="CN">

<meta name="keywords" content="">
<meta name="description"
	content="养车客，中国领先的养车生活服务平台，免费为车主提供汽车保养、维修、美容、改装等车生活解决方案，免费为车主甄别优质的汽车服务商家，提供公开、透明的产品价格，解决车主的养车烦恼，让车生活变得更加简单惬意！">
<title>养车客，让车生活更加简单惬意</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="StyleSheet"
	href="<%=request.getContextPath()%>/css/main.css" type="text/css">
</head>

<body class="logged-out ytype" screen_capture_injected="true">
	<!-- 服务流程 -->
	<div class="yck-box">
		<div id="progressbarDv" class="g-progressbar">

			<ul class="g-progressbar-pic g-clear">
				<li class="g-circle g-left-finished"><span>1</span></li>
				<li class="g-line"></li>
				<li class="g-circle g-middle-finished js-middle1 g-right-actived"><span>2</span></li>
				<li class="g-line"></li>
				<li class="g-circle g-middle-finished js-middle2"><span>3</span></li>
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
	</div>
	<div class="yck-box">
		<!-- 服务流程 -->
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
					<p class="diagnosis_changetc">基于您的车辆状况，依据标致厂商的保养手册，建议保养方案如下：</p>
					<p class="diagnosis_buytime">标致 / 307 / 2006款 307-三厢 2.0
						手动&nbsp;&nbsp;&nbsp;购买于2013年1月，行驶 90000 公里</p>

				</div>

			</div>
		</div>

		<div class="clearfix diagnosis-wrap">
			<%
				if (request.getParameter("act") != null
						&& request.getParameter("act").equals("zn")) {
			%>
			<div class="part_left partitem_container">
				<div class="part_itemlist" id="need_partlist">
					<div class="part_item_subject">
						<h2>必须更换的项目</h2>
					</div>
					<div class="part_item_option">
						<ul>

							<li onmouseover="showPriceTip(this)"
								onmouseout="hidePriceTip(this)" class="interval cancel"><span
								distance="7500" month="6">机油</span>
								<div class="help">
									<div style="display: none;">
										<p>机油就是发动机运转的润滑油，能对发动机起到润滑、清洁、冷却、密封、减磨等作用，对于降低发动机零件的磨损，延长使用寿命有着重要的意义。</p>
									</div>
								</div> <a href="javascript:;" price="175" unit="升" amount="5"
								isbind="true" groupname="oil" partid="K01" partname="机油"
								orderby="1" ispossible="" isneed="True">取消</a> <span
								class="part_item_price"> <span
									class="part_item_pricetitle">参考价：</span> <span
									class="part_item_pricevalue">￥175</span> <span
									class="part_item_priceunit">(5升)</span>

							</span></li>

							<li onmouseover="showPriceTip(this)"
								onmouseout="hidePriceTip(this)" class=" cancel"><span
								distance="7500" month="6">机油滤清器</span>
								<div class="help">
									<div style="display: none;">
										<p>机油滤清器是过滤机油的部件，用于过滤机油中含有的胶质、杂质、水分和添加剂，让发动机运行更顺畅、更安全。</p>
									</div>
								</div> <a href="javascript:;" price="30" unit="个" amount="1"
								isbind="true" groupname="oil" partid="K02" partname="机油滤清器"
								orderby="2" ispossible="" isneed="True">取消</a> <span
								class="part_item_price"> <span
									class="part_item_pricetitle">参考价：</span> <span
									class="part_item_pricevalue">￥30</span> <span
									class="part_item_priceunit"></span>

							</span></li>

							<li onmouseover="showPriceTip(this)"
								onmouseout="hidePriceTip(this)" class="interval cancel"><span
								distance="30000" month="24">空气滤清器</span>
								<div class="help">
									<div style="display: none;">
										<p>发动机工作时需要大量空气，空气滤清器用于过滤其中的灰尘及各种杂质，让空气更清洁，发动机燃烧更充分、运行更安全。</p>
									</div>
								</div> <a href="javascript:;" price="50" unit="个" amount="1"
								isbind="false" groupname="" partid="K03" partname="空气滤清器"
								orderby="3" ispossible="" isneed="True">取消</a> <span
								class="part_item_price"> <span
									class="part_item_pricetitle"></span> <span
									class="part_item_pricevalue">￥50</span> <span
									class="part_item_priceunit"></span>

							</span></li>

							<li onmouseover="showPriceTip(this)"
								onmouseout="hidePriceTip(this)" class=" cancel"><span
								distance="30000" month="24">汽油滤清器</span>
								<div class="help">
									<div style="display: none;">
										<p>汽油滤清器用于过滤掉汽油的水分及杂质，从而使发动机燃室内燃烧更充分、性能最优化，同时也为发动机提供了最佳保护，比如腐蚀和磨损等。</p>
									</div>
								</div> <a href="javascript:;" price="30" unit="个" amount="1"
								isbind="false" groupname="" partid="K06" partname="汽油滤清器"
								orderby="4" ispossible="" isneed="True">取消</a> <span
								class="part_item_price"> <span
									class="part_item_pricetitle"></span> <span
									class="part_item_pricevalue">￥30</span> <span
									class="part_item_priceunit"></span>

							</span></li>

							<li onmouseover="showPriceTip(this)"
								onmouseout="hidePriceTip(this)" class="interval cancel"><span
								distance="30000" month="24">空调滤清器</span>
								<div class="help">
									<div style="display: none;">
										<p>空调滤清器类似于房间的空气净化器，主要作用是过滤车厢空气中的花粉、微尘，防止汽车尾气、工业废气、臭氧或是其他刺激性气体侵入车内，保护驾乘人员的身体健康。</p>
									</div>
								</div> <a href="javascript:;" price="80" unit="个" amount="1"
								isbind="false" groupname="" partid="K04" partname="空调滤清器"
								orderby="5" ispossible="" isneed="True">取消</a> <span
								class="part_item_price"> <span
									class="part_item_pricetitle"></span> <span
									class="part_item_pricevalue">￥80</span> <span
									class="part_item_priceunit"></span>

							</span></li>


						</ul>
					</div>
				</div>

				<!-- begin possible  -->
				<div class="part_itemlist" id="possible_partlist">
					<div class="part_item_subject">
						<h2>可能需要更换的项目</h2>
					</div>
					<div class="part_item_option">
						<ul>

							<li onmouseover="showPriceTip(this)"
								onmouseout="hidePriceTip(this)" class="interval cancel"><span
								distance="7500" month="6">机油</span>
								<div class="help">
									<div style="display: none;">
										<p>机油就是发动机运转的润滑油，能对发动机起到润滑、清洁、冷却、密封、减磨等作用，对于降低发动机零件的磨损，延长使用寿命有着重要的意义。</p>
									</div>
								</div> <a href="javascript:;" price="175" unit="升" amount="5"
								isbind="true" groupname="oil" partid="K01" partname="机油"
								orderby="1" ispossible="" isneed="True">选择</a> <span
								class="part_item_price"> <span
									class="part_item_pricetitle">参考价：</span> <span
									class="part_item_pricevalue">￥175</span> <span
									class="part_item_priceunit">(5升)</span>

							</span></li>

							<li onmouseover="showPriceTip(this)"
								onmouseout="hidePriceTip(this)" class=" cancel"><span
								distance="7500" month="6">机油滤清器</span>
								<div class="help">
									<div style="display: none;">
										<p>机油滤清器是过滤机油的部件，用于过滤机油中含有的胶质、杂质、水分和添加剂，让发动机运行更顺畅、更安全。</p>
									</div>
								</div> <a href="javascript:;" price="30" unit="个" amount="1"
								isbind="true" groupname="oil" partid="K02" partname="机油滤清器"
								orderby="2" ispossible="" isneed="True">选择</a> <span
								class="part_item_price"> <span
									class="part_item_pricetitle">参考价：</span> <span
									class="part_item_pricevalue">￥30</span> <span
									class="part_item_priceunit"></span>

							</span></li>

							<li onmouseover="showPriceTip(this)"
								onmouseout="hidePriceTip(this)" class="interval cancel"><span
								distance="30000" month="24">空气滤清器</span>
								<div class="help">
									<div style="display: none;">
										<p>发动机工作时需要大量空气，空气滤清器用于过滤其中的灰尘及各种杂质，让空气更清洁，发动机燃烧更充分、运行更安全。</p>
									</div>
								</div> <a href="javascript:;" price="50" unit="个" amount="1"
								isbind="false" groupname="" partid="K03" partname="空气滤清器"
								orderby="3" ispossible="" isneed="True">取消</a> <span
								class="part_item_price"> <span
									class="part_item_pricetitle"></span> <span
									class="part_item_pricevalue">￥50</span> <span
									class="part_item_priceunit"></span>

							</span></li>

						</ul>
					</div>
				</div>
				<!-- //end possible -->
			</div>

			<div class="part_right partitem_container">
				<div class="part_itemlist" id="baoyang_partbill">
					<div class="part_item_subject">
						<h2 style="font-size: 16px;">四轮子车管家推荐保养方案清单</h2>
					</div>
					<div class="part_item_option">
						<table class="part_item_selected">
							<tbody>
								<tr class="table_th">
									<th class="table_title_name">项目</th>
									<th class="table_title_price">参考价</th>
									<th class="table_title_opear">操作</th>
								</tr>

								<tr>
									<td><span class="part_item_span_first" distance="7500"
										month="6">机油</span></td>
									<td class="part_item_price_td"><span
										class="part_item_span_first part_item_priceopear">￥</span> <span
										class="part_item_price">175</span> <span
										class="part_item_priceunit">(5升)</span></td>
									<td class="table_title_opear"><a href="javascript:;"
										price="175" unit="升" amount="5" isbind="true" groupname="oil"
										partid="K01" partname="机油" orderby="1" ispossible=""
										isneed="True">删除</a></td>
								</tr>

								<tr>
									<td><span class="part_item_span_first" distance="7500"
										month="6">机油滤清器</span></td>
									<td class="part_item_price_td"><span
										class="part_item_span_first part_item_priceopear">￥</span> <span
										class="part_item_price">30</span> <span
										class="part_item_priceunit"></span></td>
									<td class="table_title_opear"><a href="javascript:;"
										price="30" unit="个" amount="1" isbind="true" groupname="oil"
										partid="K02" partname="机油滤清器" orderby="2" ispossible=""
										isneed="True">删除</a></td>
								</tr>

								<tr>
									<td><span class="part_item_span_first" distance="30000"
										month="24">空气滤清器</span></td>
									<td class="part_item_price_td"><span
										class="part_item_span_first part_item_priceopear">￥</span> <span
										class="part_item_price">50</span> <span
										class="part_item_priceunit"></span></td>
									<td class="table_title_opear"><a href="javascript:;"
										price="50" unit="个" amount="1" isbind="false" groupname=""
										partid="K03" partname="空气滤清器" orderby="3" ispossible=""
										isneed="True">删除</a></td>
								</tr>

								<tr>
									<td><span class="part_item_span_first" distance="30000"
										month="24">汽油滤清器</span></td>
									<td class="part_item_price_td"><span
										class="part_item_span_first part_item_priceopear">￥</span> <span
										class="part_item_price">30</span> <span
										class="part_item_priceunit"></span></td>
									<td class="table_title_opear"><a href="javascript:;"
										price="30" unit="个" amount="1" isbind="false" groupname=""
										partid="K06" partname="汽油滤清器" orderby="4" ispossible=""
										isneed="True">删除</a></td>
								</tr>


							</tbody>
						</table>
					</div>
					<div class="part_price_total">
						参考总价：<span class="part_price_total_opear">￥</span><span
							class="part_price_total_price">685</span>
					</div>
					<div class="part_button_baojia">
						<a href="<%=request.getContextPath()%>/service/choose.action"
							class="tostep2 on">确定了，查看商家报价 >></a>
					</div>


				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
		<%
			}
			if (request.getParameter("act") != null
					&& request.getParameter("act").equals("zx")) {
		%>
		<div class="part_right partitem_container" style="width: 700px;">
			<div class="part_itemlist" id="baoyang_partbill">
				<div class="part_item_subject">
					<h2 style="font-size: 16px;">四轮子车管家推荐保养方案清单</h2>
				</div>
				<div class="part_item_option">
					<table class="part_item_selected">
						<tbody>
							<tr class="table_th">
								<th class="table_title_name">项目</th>
								<th class="table_title_price">参考价</th>
								<th class="table_title_opear">操作</th>
							</tr>

							<tr>
								<td><span class="part_item_span_first" distance="7500"
									month="6">机油</span></td>
								<td class="part_item_price_td"><span
									class="part_item_span_first part_item_priceopear">￥</span> <span
									class="part_item_price">175</span> <span
									class="part_item_priceunit">(5升)</span></td>
								<td class="table_title_opear"><a href="javascript:;"
									price="175" unit="升" amount="5" isbind="true" groupname="oil"
									partid="K01" partname="机油" orderby="1" ispossible=""
									isneed="True">删除</a></td>
							</tr>

							<tr>
								<td><span class="part_item_span_first" distance="7500"
									month="6">机油滤清器</span></td>
								<td class="part_item_price_td"><span
									class="part_item_span_first part_item_priceopear">￥</span> <span
									class="part_item_price">30</span> <span
									class="part_item_priceunit"></span></td>
								<td class="table_title_opear"><a href="javascript:;"
									price="30" unit="个" amount="1" isbind="true" groupname="oil"
									partid="K02" partname="机油滤清器" orderby="2" ispossible=""
									isneed="True">删除</a></td>
							</tr>

							<tr>
								<td><span class="part_item_span_first" distance="30000"
									month="24">空气滤清器</span></td>
								<td class="part_item_price_td"><span
									class="part_item_span_first part_item_priceopear">￥</span> <span
									class="part_item_price">50</span> <span
									class="part_item_priceunit"></span></td>
								<td class="table_title_opear"><a href="javascript:;"
									price="50" unit="个" amount="1" isbind="false" groupname=""
									partid="K03" partname="空气滤清器" orderby="3" ispossible=""
									isneed="True">删除</a></td>
							</tr>

							<tr>
								<td><span class="part_item_span_first" distance="30000"
									month="24">汽油滤清器</span></td>
								<td class="part_item_price_td"><span
									class="part_item_span_first part_item_priceopear">￥</span> <span
									class="part_item_price">30</span> <span
									class="part_item_priceunit"></span></td>
								<td class="table_title_opear"><a href="javascript:;"
									price="30" unit="个" amount="1" isbind="false" groupname=""
									partid="K06" partname="汽油滤清器" orderby="4" ispossible=""
									isneed="True">删除</a></td>
							</tr>


						</tbody>
					</table>
				</div>
				<div class="part_price_total">
					参考总价：<span class="part_price_total_opear">￥</span><span
						class="part_price_total_price">685</span>
				</div>
				<div class="part_button_baojia">
					<a href="<%=request.getContextPath()%>/service/choose.action"
						class="tostep2 on">确定了，查看商家报价 >></a>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>
		<%}%>


	</div>
	
</body>
</html>
