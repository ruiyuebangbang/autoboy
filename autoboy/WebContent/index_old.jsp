<%@ page contentType="text/html; charset=utf-8"%>

<html>
   
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Language" content="CN">
	<meta http-equiv="imagetoolbar" content="no">
  	<meta name="viewport" content="width=1020">
	<title></title>
  	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
  	<link rel="StyleSheet" href="css/main.css" type="text/css">
  	<style>
  	body {
	/*background: #453b3b;
	}
  	#wrap {
	/*background: transparent url(image/bg_ad.jpg) center 0 no-repeat;
	padding-top:150px;*/
	}
  	</style>
</head>

<body class="logged-out ytype" screen_capture_injected="true">
<div id="slz-banner">
	<h2 class="diff">四轮子与众不同</h2>
	<ul class="checks">
		<li>7,000维修服务商提供优质服务</li>
		<li>10，000车主的放心选择</li>
		<li>全场正品保障，假一赔十</li>
		<li>四轮子维权，先行赔付</li>
		<li>车主点评分享，车生活不再孤单</li>
		
	</ul>
	
	<a href="/eserve/appointment">
		<img id="slz-apointButton" src="<%=request.getContextPath()%>/image/appointment.png" origsrc="http://static.pepboys.com/images/eServe2.0/appoint_button_lg_noroll.png" oversrc="http://static.pepboys.com/images/eServe2.0/pepboys_services/appoint_button_lg_roll.png" alt="Click now to schedule a service appointment">
	</a>
	<p id="slz-apointText">您已经预约好了？<br><a href="/eserve/appointment/history">查看进度</a></p>
	
</div>	
		
<div class="clearfix layout-block layout-a layout-boder">
	<div class="column column-alpha main">
		<h2>常规服务</h2>
		<ul class="home-1 clearfix">
	      <li> <img src="image/service-by.png" class="pic">
	        <div class="cont">
	          <a href="#"><h3>汽车保养</h3></a>
	          <p>汽车保养、添加空调冷媒、添加防冻液、动机清洗、喷油嘴清洗、节气门清洗、内清洗、空调清洗...</p>
	        </div>
	      </li>
	      <li class="even"> <img src="image/service-mr.png" class="pic">
	        <div class="cont">
	          <a href="#"><h3>汽车美容</h3></a>
	          <p>划痕修复、钣金喷漆、凹凸修复、快速补漆、贴膜、定做座椅套、座椅包真皮...</p>
	        </div>
	      </li>
	      <li>  <img src="image/service-wx.png" class="pic">
	        <div class="cont">
	          <a href="#"><h3>汽车维修</h3></a>
	          <p>划痕修复、钣金喷漆、凹凸修复、快速补漆、贴膜、定做座椅套、座椅包真皮...</p>
	        </div>
	      </li>
	      <li class="even"> <img src="image/service-gz.png"  class="pic">
	        <div class="cont">
	          <h3>汽车改装</h3>
	          <p>划痕修复、钣金喷漆、凹凸修复、快速补漆、贴膜、定做座椅套、座椅包真皮...</p>
	        </div>
	      </li>
	      
	      
	    </ul>
	
		<!-- 服务点评 -->
		<div class="ysection clearfix" id="activity-feed" data-component-bound="true">
			<div class="header-width-ui">
				<h2>最新点评</h2>
				<div class="hd-ui">
					<ul class="tabs-pill js-tabs hidden" data-component-bound="true">
						<li data-tab-id="near_you" class="tab inline-block selected">
						<a href="#">Near You</a>
						<span class="unread-count hidden"></span>
						</li>
					</ul>
				</div>
			</div>
			<div class="content">
				<div class="feeds feed-module">
					<ul class="content-list">
						<li data-section-id="near_you" data-component-bound="true">
							<ul class="ylist ylist-bordered">
                            	<li class="media-block clearfix review-block media-block-large">
							        <div class="media-avatar">
							        	<div class="photo-box pb-60s">
							            	<a href="/user_details?userid=XMtGk5ULY6JBbgWWTEvSVQ">
							                	<img alt="" class="photo-box-img" height="60" src="http://s3-media3.ak.yelpcdn.com/photo/L8cJE3jigLXjlOev0jYGIw/60s.jpg" width="60">
							            	</a>
							    		</div>
									</div>
							        <div class="media-story">
							        	<div class="feed-content">
							        		<div class="media-title item-title width-full clearfix">
							            		<div class="title-text">
							                    	车主<a class="user-name" href="/user_details?userid=XMtGk5ULY6JBbgWWTEvSVQ" data-hovercard-id="sR3vpz_4-kRxY3LMRjuEbg">王师傅</a>
							 						评论了     
							 						<a class="biz-name" href="/biz/jeffreys-natural-pet-foods-san-francisco#hrid:4dIwn9-QQC5DcmFRPHcDkA" data-hovercard-id="43b2bIeKYYTx5J_kaQsaaw">东吴汽车维修公司</a>
												</div>
									            <div class="time-stamp">
									                1小时以前
									            </div>
									        </div>
									        <div class="item-description">
							            		<div class="biz-rating biz-rating-very-large clearfix">
							        				<div>
							                
												        <div class="rating">
												        <i class="star-img stars_5" title="5.0 star rating">
												            <img alt="5.0 star rating" class="offscreen" height="303" src="/auto/image/stars_map_very_large.png" width="84">
												        </i>
												    </div>
							
							
							        			</div>
							            		<span class="rating-qualifier">2/10/2014</span>
							
							    			</div>
							
							        		<p class="js-content-expandable" data-component-bound="true">
							                	<span class="js-content-toggleable">
							                	上周六 1月11去做的大保，感觉和4s店保养的比起来要快很多，还不用排队，关键价格比4S 店便宜一半左右，用的机油还是合成机油（4S是矿物机油）。保养之后开出来感觉就是不一样，动力提升很明显，声音听起来也比原来要小且很匀速，不像以前时高时低。之前有时红油门时声音很大，动力还上不去,现在开了两天，没有这种情况出现了。
							                	</span>
							        		</p>
										</div>
							    	</div>
															    
							    </li>
							    <li class="media-block clearfix review-block media-block-large">
							        <div class="media-avatar">
							        	<div class="photo-box pb-60s">
							            	<a href="/user_details?userid=XMtGk5ULY6JBbgWWTEvSVQ">
							                	<img alt="" class="photo-box-img" height="60" src="http://s3-media3.ak.yelpcdn.com/photo/L8cJE3jigLXjlOev0jYGIw/60s.jpg" width="60">
							            	</a>
							    		</div>
									</div>
							        <div class="media-story">
							        	<div class="feed-content">
							        		<div class="media-title item-title width-full clearfix">
							            		<div class="title-text">
							                    	车主<a class="user-name" href="/user_details?userid=XMtGk5ULY6JBbgWWTEvSVQ" data-hovercard-id="sR3vpz_4-kRxY3LMRjuEbg">王师傅</a>
							 						评论了     
							 						<a class="biz-name" href="/biz/jeffreys-natural-pet-foods-san-francisco#hrid:4dIwn9-QQC5DcmFRPHcDkA" data-hovercard-id="43b2bIeKYYTx5J_kaQsaaw">东吴汽车维修公司</a>
												</div>
									            <div class="time-stamp">
									                1小时以前
									            </div>
									        </div>
									        <div class="item-description">
							            		<div class="biz-rating biz-rating-very-large clearfix">
							        				<div>
							                
												        <div class="rating">
												        <i class="star-img stars_5" title="5.0 star rating">
												            <img alt="5.0 star rating" class="offscreen" height="303" src="/auto/image/stars_map_very_large.png" width="84">
												        </i>
												    </div>
							
							
							        			</div>
							            		<span class="rating-qualifier">2/10/2014</span>
							
							    			</div>
							
							        		<p class="js-content-expandable" data-component-bound="true">
							                	<span class="js-content-toggleable">
							                	上周六 1月11去做的大保，感觉和4s店保养的比起来要快很多，还不用排队，关键价格比4S 店便宜一半左右，用的机油还是合成机油（4S是矿物机油）。保养之后开出来感觉就是不一样，动力提升很明显，声音听起来也比原来要小且很匀速，不像以前时高时低。之前有时红油门时声音很大，动力还上不去,现在开了两天，没有这种情况出现了。
							                	</span>
							        		</p>
										</div>
							    	</div>
							
							    
							    </li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 服务点评 -->
		<!-- 推荐服务商 -->
		<div class="ysection clearfix new-business-openings">
			<h2>为您推荐</h2>
			<ul class="photo-box-list clearfix" data-component-bound="true">
		    	<li>
		        	<div class="photo-box has-overlay biz-listing-photo">
		        		<img alt="De Afghanan Kabob House" class="photo-box-img" height="130" src="image/supplier-1.jpg" width="206">
						<div class="photo-box-overlay dynamic js-overlay" style="bottom: -18px;">
		            		<div class="clearfix">
		                    	<a class="biz-name" href="/auto/store/store.action" data-hovercard-id="ojo6bysNcMWbgalqpTFm9Q">宝德4S店（ss中春路）</a>
								<div class="biz-rating biz-rating-medium clearfix">
		                			<div class="rating">
								        <i class="star-img stars_5" title="5.0 star rating">
								            <img alt="5.0 star rating" class="offscreen" height="303" src="/auto/image/stars_map.png" width="84">
								        </i>
								    </div>
									<span class="review-count rating-qualifier">3 reviews</span>
								</div>
							</div>
		                	<div class="additional-info js-hidden-info">
		                            <span class="neighborhood-str-list"> Tenderloin </span>						
		                	</div>
				        </div>
			            <a class="biz-shim" href="/auto/store/store.action">
			        		<span class="offscreen">De Afghanan Kabob House</span>
			    		</a>
			    	</div>
		        </li>
		        <li>
		        	<div class="photo-box has-overlay biz-listing-photo">
		        		<img alt="De Afghanan Kabob House" class="photo-box-img" height="130" src="image/supplier-1.jpg" width="206">
						<div class="photo-box-overlay dynamic js-overlay" style="bottom: -18px;">
		            		<div class="clearfix">
		                    	<a class="biz-name" href="/auto/store/store.action" data-hovercard-id="ojo6bysNcMWbgalqpTFm9Q">奔驰4S店（张江路）</a>
								<div class="biz-rating biz-rating-medium clearfix">
		                			<div class="rating">
								        <i class="star-img stars_5" title="5.0 star rating">
								            <img alt="5.0 star rating" class="offscreen" height="303" src="/auto/image/stars_map.png" width="84">
								        </i>
								    </div>
									<span class="review-count rating-qualifier">3 reviews</span>
								</div>
							</div>
		                	<div class="additional-info js-hidden-info">
		                            <span class="neighborhood-str-list"> Tenderloin </span>						
		                	</div>
				        </div>
			            <a class="biz-shim" href="/auto/store/store.action">
			        		<span class="offscreen">De Afghanan Kabob House</span>
			    		</a>
			    	</div>
		        </li>
		        <li>
		        	<div class="photo-box has-overlay biz-listing-photo">
		        		<img alt="De Afghanan Kabob House" class="photo-box-img" height="130" src="image/supplier-1.jpg" width="206">
						<div class="photo-box-overlay dynamic js-overlay" style="bottom: -18px;">
		            		<div class="clearfix">
		                    	<a class="biz-name" href="/auto/store/store.action" data-hovercard-id="ojo6bysNcMWbgalqpTFm9Q">宝马4S店（中春路）</a>
								<div class="biz-rating biz-rating-medium clearfix">
		                			<div class="rating">
								        <i class="star-img stars_5" title="5.0 star rating">
								            <img alt="5.0 star rating" class="offscreen" height="303" src="/auto/image/stars_map.png" width="84">
								        </i>
								    </div>
									<span class="review-count rating-qualifier">3 reviews</span>
								</div>
							</div>
		                	<div class="additional-info js-hidden-info">
		                            <span class="neighborhood-str-list"> Tenderloin </span>						
		                	</div>
				        </div>
			            <a class="biz-shim" href="/auto/store/store.action">
			        		<span class="offscreen">De Afghanan Kabob House</span>
			    		</a>
			    	</div>
		        </li>
			</ul>
			
			       
		</div>
		<!-- 推荐服务商 -->
	</div>
	<div class="column column-beta sidebar">
		
		<div class="ysection clearfix service-title ">
			<h2>四轮子服务流程 </h2>
		</div>
		<div class="sidebar-box service-content">
			<ul>
				<li>
					<div class="num num-1"><span class="active"></span></div>
					<div class="step-1">
			          <h3>发布需求(It's free)</h3>
			          <p>简单注册后您就能通过四轮子智能推荐系统发布服务需求</p>
			        </div>
				</li>
				<li>
					<div class="num num-2"><span class="active"></span></div>
					<div class="step-1">
			          <h3>获取服务方案</h3>
			          <p>获取专业维修服务商提供的服务方案，浏览服务商服务评价，选择高质量服务商</p>
			        </div>
				</li>
				<li>
					<div class="num num-3"><span class="active"></span></div>
					<div class="step-1">
			          <h3>到场实施服务</h3>
			          <p>约定时间，到服务商现场实施服务</p>
			        </div>
				</li>
				<li>
					<div class="num num-4"><span class="active"></span></div>
					<div class="step-1">
			          <h3>对服务进行点评</h3>
			          <p>对服务商现场环境、服务质量、服务态度等进行点评</p>
			        </div>
				</li>
			</ul>
		</div>
		
		<div class="ysection clearfix service-title">
			<h2>保养问答 </h2>
		</div>
		<div class="sidebar-box faq-content">
				<ul class="question_list">
					<li><a href="">在结冰的路面上爬坡要注意什么？</a></li>
					<li><a href="">下雪天如何预防的汽车的积雪？</a></li>
					<li><a href="">下雪了，蓄电池结冰了，咋办呢，以后下雪前要对蓄电池做什么防护工作？</a></li>
					<li><a href="">今天清晨出门发现雨刮器被雪水粘在挡风玻璃上，能直接用热水冲洗么？</a></li>
					<li><a href="">下雪天汽车挡风结冰或者起雾，或结冰有什么好办法解决吗？尤其是内挡风！</a></li>
					<li><a href="">下雪天如何预防的汽车的积雪？</a></li>
					<li><a href="">下雪了，蓄电池结冰了，咋办呢，以后下雪前要对蓄电池做什么防护工作？</a></li>
					<li><a href="">今天清晨出门发现雨刮器被雪水粘在挡风玻璃上，能直接用热水冲洗么？</a></li>
					
                </ul>
			</div>
		</div>
		
	</div>
 
</body>
</html>
