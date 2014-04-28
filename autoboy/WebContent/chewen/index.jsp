<%@ page contentType="text/html; charset=utf-8"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="CN">
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">

<title></title>
<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/main.css"
	type="text/css">
<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/question.css"
	type="text/css">
</head>

<body>
	<div class="yck-box layout-a">
		<!-- search begin -->
		<div class="search full_search instant_results">
			<div class="search_contents navigator">
				<form class="search_form" action="#" onsubmit="return false;"
					method="get" name="search_form">
					<div class="search_title">
						<h2>车问答</h2>
					</div>
					<div class="search_input">
						<div class="input_wrapper in_chrome"
							id="__w2_L1pp9tY_input_wrapper">
							<span class="input_icon" id="__w2_L1pp9tY_input_icon"></span> <input
								class="question_box light" group="__w2_L1pp9tY_interaction"
								name="search_input" placeholder="Search" value=""
								autocomplete="off" maxlength="250" autofocus="autofocus"
								type="text" tabindex="1" w2cid="L1pp9tY" id="__w2_L1pp9tY_input"
								style=""><a class="clear_navigator hidden" href="#"
								id="__w2_L1pp9tY_clear">&nbsp;</a>
						</div>
					</div>
				</form>
				
			</div>
		</div>
		<!-- search end -->
		<!-- question list -->
		<div id="content">

			<div id="mainbar">
				<div style="margin-bottom: 10px;border-bottom: 1px solid #ccc;"><h2>热门问答</h2></div>
				<div class="qa-part-q-list">
							<form method="post" action="./questions">
								<div class="qa-q-list">
									
									<div class="qa-q-list-item" id="q71">
										<div class="qa-q-item-stats">
											<div class="qa-voting qa-voting-net" id="voting_71">
												<div class="qa-vote-buttons qa-vote-buttons-net">
													<input title="Click to vote up" name="vote_71_1_q71" onclick="return qa_vote_click(this);" type="submit" value="+" class="qa-vote-first-button qa-vote-up-button"> 
													<input title="Click to vote down" name="vote_71_-1_q71" onclick="return qa_vote_click(this);" type="submit" value="–" class="qa-vote-second-button qa-vote-down-button"> 
												</div>
												<div class="qa-vote-count qa-vote-count-net">
													<span class="qa-netvote-count">
														<span class="qa-netvote-count-data">0</span><span class="qa-netvote-count-pad">票</span>
													</span>
												</div>
												<div class="qa-vote-clear">
												</div>
											</div>
											<span class="qa-a-count qa-a-count-zero">
												<span class="qa-a-count-data">0</span><span class="qa-a-count-pad">回答</span>
											</span>
										</div>
										<div class="qa-q-item-main">
											<div class="qa-q-item-title">
												<a href="<%=request.getContextPath() %>/chewen/detail.action">问答系统真的不错问答系统真的不错</a>
											</div>
											<span class="qa-q-item-avatar-meta">
												<span class="qa-q-item-meta">
													<span class="qa-q-item-what">asked</span>
													<span class="qa-q-item-when">
														<span class="qa-q-item-when-data">8 seconds</span><span class="qa-q-item-when-pad"> ago</span>
													</span>
													<span class="qa-q-item-who">
														<span class="qa-q-item-who-pad">by </span>
														<span class="qa-q-item-who-data">bobo</span>
													</span>
												</span>
											</span>
											<div class="qa-q-item-tags">
												<ul class="qa-q-item-tag-list">
													<li class="qa-q-item-tag-item"><a href="./tag/bobo" class="qa-tag-link">bobo</a></li>
												</ul>
											</div>
										</div>
										<div class="qa-q-item-clear">
										</div>
									</div> <!-- END qa-q-list-item -->
									
									<div class="qa-q-list-item" id="q68">
										<div class="qa-q-item-stats">
											<div class="qa-voting qa-voting-net" id="voting_68">
												<div class="qa-vote-buttons qa-vote-buttons-net">
													<input title="You cannot vote on your own questions" type="submit" value="" class="qa-vote-first-button qa-vote-up-disabled" disabled="disabled"> 
													<input title="You cannot vote on your own questions" type="submit" value="" class="qa-vote-second-button qa-vote-down-disabled" disabled="disabled"> 
												</div>
												<div class="qa-vote-count qa-vote-count-net">
													<span class="qa-netvote-count">
														<span class="qa-netvote-count-data">0</span><span class="qa-netvote-count-pad"> votes</span>
													</span>
												</div>
												<div class="qa-vote-clear">
												</div>
											</div>
											<span class="qa-a-count">
												<span class="qa-a-count-data">1</span><span class="qa-a-count-pad"> answer</span>
											</span>
										</div>
										<div class="qa-q-item-main">
											<div class="qa-q-item-title">
												<a href="<%=request.getContextPath() %>/chewen/detail.action">汽车保养怎么弄汽车保养怎么弄</a>
											</div>
											<span class="qa-q-item-avatar-meta">
												<span class="qa-q-item-meta">
													<span class="qa-q-item-what">asked</span>
													<span class="qa-q-item-when">
														<span class="qa-q-item-when-data">41 minutes</span><span class="qa-q-item-when-pad"> ago</span>
													</span>
													<span class="qa-q-item-who">
														<span class="qa-q-item-who-pad">by </span>
														<span class="qa-q-item-who-data">Kevin</span>
													</span>
												</span>
											</span>
											<div class="qa-q-item-tags">
												<ul class="qa-q-item-tag-list">
													<li class="qa-q-item-tag-item"><a href="./tag/%E6%B1%BD%E8%BD%A6" class="qa-tag-link">汽车</a></li>
												</ul>
											</div>
										</div>
										<div class="qa-q-item-clear">
										</div>
									</div> <!-- END qa-q-list-item -->
									<div class="qa-q-list-item" id="q68">
										<div class="qa-q-item-stats">
											<div class="qa-voting qa-voting-net" id="voting_68">
												<div class="qa-vote-buttons qa-vote-buttons-net">
													<input title="You cannot vote on your own questions" type="submit" value="" class="qa-vote-first-button qa-vote-up-disabled" disabled="disabled"> 
													<input title="You cannot vote on your own questions" type="submit" value="" class="qa-vote-second-button qa-vote-down-disabled" disabled="disabled"> 
												</div>
												<div class="qa-vote-count qa-vote-count-net">
													<span class="qa-netvote-count">
														<span class="qa-netvote-count-data">0</span><span class="qa-netvote-count-pad">票</span>
													</span>
												</div>
												<div class="qa-vote-clear">
												</div>
											</div>
											<span class="qa-a-count">
												<span class="qa-a-count-data">1</span><span class="qa-a-count-pad"> 回答</span>
											</span>
										</div>
										<div class="qa-q-item-main">
											<div class="qa-q-item-title">
												<a href="./68/%E6%B1%BD%E8%BD%A6%E4%BF%9D%E5%85%BB%E6%80%8E%E4%B9%88%E5%BC%84%E6%B1%BD%E8%BD%A6%E4%BF%9D%E5%85%BB%E6%80%8E%E4%B9%88%E5%BC%84">汽车保养怎么弄汽车保养怎么弄</a>
											</div>
											<span class="qa-q-item-avatar-meta">
												<span class="qa-q-item-meta">
													<span class="qa-q-item-what">asked</span>
													<span class="qa-q-item-when">
														<span class="qa-q-item-when-data">41 minutes</span><span class="qa-q-item-when-pad"> ago</span>
													</span>
													<span class="qa-q-item-who">
														<span class="qa-q-item-who-pad">by </span>
														<span class="qa-q-item-who-data">Kevin</span>
													</span>
												</span>
											</span>
											<div class="qa-q-item-tags">
												<ul class="qa-q-item-tag-list">
													<li class="qa-q-item-tag-item"><a href="./tag/%E6%B1%BD%E8%BD%A6" class="qa-tag-link">汽车</a></li>
												</ul>
											</div>
										</div>
										<div class="qa-q-item-clear">
										</div>
									</div>	
								</div> <!-- END qa-q-list -->
								
								<div class="qa-q-list-form">
									<input type="hidden" name="code" value="0-1396364054-05ab08080de7beabe534b69c991a69ded88e97bd">
								</div>
							</form>
						</div>
				
				
				

				<br class="cbt">
				<div class="page-sizer fr">
					<a href="/questions?pagesize=15&amp;sort=newest"
						title="show 15 items per page" class="page-numbers current">15</a>
					<a href="/questions?pagesize=30&amp;sort=newest"
						title="show 30 items per page" class="page-numbers ">30</a> <a
						href="/questions?pagesize=50&amp;sort=newest"
						title="show 50 items per page" class="page-numbers ">50</a> <span
						class="page-numbers desc">每页</span>
				</div>
				<div class="pager fl">





					<span class="page-numbers current">1</span> <a
						href="/questions?page=2&amp;sort=newest" title="go to page 2">
						<span class="page-numbers">2</span>
					</a> <a href="/questions?page=3&amp;sort=newest" title="go to page 3">
						<span class="page-numbers">3</span>
					</a> <a href="/questions?page=4&amp;sort=newest" title="go to page 4">
						<span class="page-numbers">4</span>
					</a> <a href="/questions?page=5&amp;sort=newest" title="go to page 5">
						<span class="page-numbers">5</span>
					</a> <span class="page-numbers dots">…</span> <a
						href="/questions?page=466093&amp;sort=newest"
						title="go to page 466093"> <span class="page-numbers">466093</span>
					</a> <a href="/questions?page=2&amp;sort=newest" rel="next"
						title="go to page 2"> <span class="page-numbers next">
							下一页</span>
					</a>

				</div>
			</div>
			<div id="sidebar">
				<!-- 提交问题 -->
				<div class="cw-info">
					<div class="question_post_form">
						<p class=“question_post_title”>让每一个疑惑都能得到解答</p>
						<div class="question_post_button">
							<button class="btn btn-default">我要提问</button><button class="btn btn-default">我要回答</button>
						</div>
					</div>
		
				</div>
				<!-- 提交问题 -->
				<!-- 常见问题 -->
				<div class="module sidebar-related">
					<h2 class="h-related">常见问题</h2>
                    <div class="related js-gps-related-questions" data-tracker="rq=1">
                        <div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/48239?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes answered-accepted large">288
							    </div>
							</a><a href="http://stackoverflow.com/questions/48239/getting-the-id-of-the-element-that-fired-an-event-using-jquery?rq=1" class="question-hyperlink">下雪天如何预防的汽车的积雪？</a>
							</div>
							<div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/152975?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes answered-accepted large">608
							    </div>
							</a><a href="http://stackoverflow.com/questions/152975/how-to-detect-a-click-outside-an-element?rq=1" class="question-hyperlink">下雪天如何预防的汽车的积雪？</a>
							</div>
							<div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/608410?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes answered-accepted large">240
							    </div>
							</a><a href="http://stackoverflow.com/questions/608410/finding-the-type-of-an-element-using-jquery?rq=1" class="question-hyperlink">下雪天如何预防的汽车的积雪？</a>
							</div>
							<div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/4191411?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes answered-accepted default">1
							    </div>
							</a><a href="http://stackoverflow.com/questions/4191411/jquery-how-can-i-loop-over-a-set-of-elements-finding-only-those-matching-the-va?rq=1" class="question-hyperlink">下雪天如何预防的汽车的积雪？</a>
							</div>
							<div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/7308077?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes answered-accepted default">1
							    </div>
							</a><a href="http://stackoverflow.com/questions/7308077/find-element-and-set-the-value?rq=1" class="question-hyperlink">下雪天如何预防的汽车的积雪？</a>
							</div>
							<div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/9136043?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes answered-accepted default">0
							    </div>
							</a><a href="http://stackoverflow.com/questions/9136043/better-way-to-find-an-element-within-a-element?rq=1" class="question-hyperlink">Better way to find an element within a element</a>
							</div>
							<div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/17352254?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes answered-accepted default">0
							    </div>
							</a><a href="http://stackoverflow.com/questions/17352254/finding-if-there-any-element-in-the-set-has-style-display-none?rq=1" class="question-hyperlink">Finding if there any element in the set has style.display !== “none”;</a>
							</div>
							<div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/20014504?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes answered-accepted default">1
							    </div>
							</a><a href="http://stackoverflow.com/questions/20014504/a-one-liner-for-finding-the-index-of-an-element-that-has-certain-class-within-a?rq=1" class="question-hyperlink">A one-liner for finding the index of an element that has certain class within a jQuery set of elements?</a>
							</div>
							<div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/22190006?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes answered-accepted default">0
							    </div>
							</a><a href="http://stackoverflow.com/questions/22190006/how-to-find-an-element-from-within-an-on-handler?rq=1" class="question-hyperlink">How to find an element from within an on() handler</a>
							</div>
							<div class="spacer js-gps-track">
							<a href="http://stackoverflow.com/q/22250899?rq=1" title="Vote score (upvotes - downvotes)">
							    <div class="answer-votes default">0
							    </div>
							</a><a href="http://stackoverflow.com/questions/22250899/find-text-within-a-html-element-and-replacing-it-with-tag?rq=1" class="question-hyperlink">Find text within a html element and replacing it with tag</a>
							</div>
							
	                    </div>
					</div>
					<!-- 常见问题 -->			
			</div>

		</div>
		<!-- question list -->

	</div>


</body>
</html>
