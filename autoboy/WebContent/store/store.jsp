<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>

<head>

<meta name="description" content=“">
<meta name="keywords" content="">
<title></title>
<link rel="StyleSheet"
	href="<%=request.getContextPath() %>/css/main.css" type="text/css">

</head>

<body>
	<div class="yck-box">
		<div id="store-top">
			<div class="top-info">
				<div class="store-name">
					<h1><s:property value="provider.SHORT_NAME"/></h1>

				</div>
				<div class="rows">
					<s:property value="provider.ADDRESS"/> <a href="/stores/100054/map.html">查看地图</a>
				</div>

				<div class="rows">
					<div class="rows-item">服务热线: <s:property value="provider.SERVICE_PHONE"/></div>
					<div class="rows-item">营业时间: <s:property value="provider.SERVICE_TIME"/></div>
				</div>
				<div class="rows vote_order">

					<div class="rows-item">
						<div class="vote">
							<div class="user_rate_vote">
								<span>信用评分:</span>

								<div class="rating">
									<i class="star-img stars_5" title="5.0 star rating"> <img
										alt="5.0 star rating" class="offscreen" height="303"
										src="/auto/image/stars_map.png" width="84">
									</i>
								</div>

							</div>
						</div>
						<div class="qualification floatleft">
							<span>认证资质 <s:property value="provider.QUALIFICATION"/></span>
						</div>
						<div class="help floatleft">
							<div style="display: none;">
								<p>汽车维修资质须经汽车维修行业管理部门依据国家标准进行资质认证，根据认证企业技师人数、场地大小等规模大小分一类、二类、三类；[查看详情]</p>
							</div>
						</div>
						<div class="floatleft xxpf">
							<span><s:if test="provider.HAS_BOND == 1">
                            先行赔付</s:if></span>
						</div>
					</div>


				</div>
			</div>
			<div class="shopimg">
				<img src="<%=request.getContextPath() %>/uploadimage/<s:property value='provider.LOGO'/>"
					width="200px" height="150px">
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="yck-box">
		<div style="margin:10px;">
		<div class="mod_tabs">
			<div class="mod_hd" style="position: relative;">
				<a href="/drama/dramaQuestion.xhtml?dramaid=164392638"
					class="more button bigBt redBt" style="top: 5px;"><span>立即预约</span></a>
				<ul class="nav_tabs" id="nav_tabsDiv">
					<li class="select" id="ygTab"><a href="/drama/164392638">商家介绍</a></li>
					<li id="vpTab"><a href="/drama/164392638/videolist">车型&服务</a></li>
					<li id="walaTab"><a href="/drama/164392638/commentlist">车主点评<em>(10)</em></a></li>

				</ul>
			</div>
		</div>
		<div class="mod_wrap">
			<div class="mod_content">
                <s:if test="brands.size() > 0">
				<div class="store_item">
					<div class="store_title">
						<h1>服务品牌</h1>
					</div>
					<div class="brandlist">
                        <s:iterator value="brands" >
						<span class="brand_209"><s:property value="cname"/></span> 
                        </s:iterator>

					</div>
				</div>
                </s:if>
				<div class="store_item">
					<div class="store_title">
						<h1>商家介绍</h1>
					</div>
					<div class="intro">
						<span style="LINE-HEIGHT: 22px; FONT-FAMILY: 宋体; COLOR: rgb(51, 51, 51); FONT-SIZE: 13px">&nbsp;
						<s:property value="provider.REMARK"/>	</span>
					</div>
				</div>

				<div class="store_item">
					<div class="store_title">
						<h1>图片展示</h1>
					</div>
					<div class="photolist">
                        <s:if test="provider.IMG1 != null">
						<p>                    
							<img src="<%=request.getContextPath() %>/uploadimage/<s:property value='provider.IMG1'/>" >
						</p>
                        </s:if>
						<s:if test="provider.IMG2 != null">
						<p>                    
							<img src="<%=request.getContextPath() %>/uploadimage/<s:property value='provider.IMG2'/>" >
						</p>
                        </s:if>
                        <s:if test="provider.IMG3 != null">
						<p>                    
							<img src="<%=request.getContextPath() %>/uploadimage/<s:property value='provider.IMG3'/>" >
						</p>
                        </s:if>
                        <s:if test="provider.IMG4 != null">
						<p>                    
							<img src="<%=request.getContextPath() %>/uploadimage/<s:property value='provider.IMG4'/>" >
						</p>
                        </s:if>
                        <s:if test="provider.IMG5 != null">
						<p>                    
							<img src="<%=request.getContextPath() %>/uploadimage/<s:property value='provider.IMG5'/>" >
						</p>
                        </s:if>

						<div class="clear"></div>
					</div>
				</div>
			</div>
			<div class="mod_right">
				<div class="box">
					<div class="title">
						<h1>商家优惠</h1>
					</div>
					<div class="box-content">
						<ul class="box-items">
							<li class="box-item"><a href="" title="" target="_blank">店庆特惠2.16-3.16全套小保养8.5折</a></li>
							<li class="box-item"><a href="" title="" target="_blank">韩泰轮胎9.5折，免人工费</a></li>
							<li class="box-item"><a href="" title="" target="_blank">2.16-3.16全套小保养8.5折</a></li>
							<li class="box-item"><a href="" title="" target="_blank">2.16-3.16全套小保养8.5折</a></li>
							<li class="box-item"><a href="" title="" target="_blank">2.16-3.16全套小保养8.5折</a></li>

						</ul>
					</div>
				</div>
				<div class="box">
					<div class="title">
						<h1>附近商家</h1>
					</div>
					<div class="box-content">
						<ul class="box-items">
							<li class="box-item"><a href="" title="" target="_blank">欢乐跑道（银都路）</a></li>
							<li class="box-item"><a href="" title="" target="_blank">欢乐跑道（银都路）</a></li>
							<li class="box-item"><a href="" title="" target="_blank">欢乐跑道（银都路）</a></li>
							<li class="box-item"><a href="" title="" target="_blank">欢乐跑道（银都路）</a></li>
							<li class="box-item"><a href="" title="" target="_blank">欢乐跑道（银都路）</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		</div>
	</div>
	<script type="text/javascript"
		src="http://www.bimawen.com/scripts/jquery/jquery-1.7.1.min.js"></script>

	<script type="text/javascript">
$(document).ready(function () {
    $(".help").hover(function (e) {
        $(this).eq(0).find("div").show();
    }, function () {
        $(this).eq(0).find("div").hide();
    });
})

</script>
</body>

</html>
