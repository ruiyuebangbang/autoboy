<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="pmain">
		<b class="ptitle"><i class="icon-hand-right"></i>保养项目查询</b>
		<div class="psearch">
			<dl>
				<dt>
					已行驶： <input type="text" id="nav_CurMileage" maxlength="7" value="">
					公里；
				</dt>
				<dd>
					<span>新车购买于：</span>
					<ol>
						<li>
							<div class="newSel">
								<div class="newInput" id="nav-txt-roadyears" name="2009">2009年</div>
								<a class="NewSelBut" href="javascript:;"
									id="nav-arrow-roadyears"></a>
								<div class="clearfix"></div>
								<div style="display: none;" class="newSelLayer"
									id="nav-roadyears">
									<ul>
										<li><a class="autoitem" href="javascript:;" name="0">年份</a></li>
										<li><a class="autoitem" href="javascript:;" name="2014">2014年</a></li>
										<li><a class="autoitem" href="javascript:;" name="2013">2013年</a></li>
										<li><a class="autoitem" href="javascript:;" name="2012">2012年</a></li>
										<li><a class="autoitem" href="javascript:;" name="2011">2011年</a></li>
										<li><a class="autoitem" href="javascript:;" name="2010">2010年</a></li>
										<li><a class="autoitem" href="javascript:;" name="2009">2009年</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li>
							<div class="newSel">
								<div class="newInput" id="nav-txt-roadmonth" name="8">8月</div>
								<a class="NewSelBut" href="javascript:;"
									id="nav-arrow-roadmonth"></a>
								<div class="clearfix"></div>
								<div style="display: none;" class="newSelLayer"
									id="nav-roadmonth">
									<ul>

									</ul>
								</div>
							</div>
						</li>
						<div class="clearfix"></div>
					</ol>
					<div class="clearfix"></div>
				</dd>
			</dl>
			<div class="clearfix"></div>
			<div class="psearchBut">
				<form action="/auto/service/proposal.action">
					<button type="submit" class="btn btn-danger">确认，看看需要做哪些保养</button>
				</form>
			</div>
			<div class="c"></div>
		</div>
		<!--psearch-->
		<b class="ptitle"><i class="icon-hand-right"></i>直接选择保养项目</b>
		<div class="pproject">
			<dl>
				<dt>常规保养项目</dt>
				<dd>
					<ol>
						<li class=""><a class="" href=""></a></li>
						<li><a class="">大保养</a></li>
						
					</ol>
				</dd>
			</dl>

		</div>
		<!--pproject-->
		<div class="c"></div>
		<div class="pproject">
			<dl>
				<dt>深度养护项目</dt>
				<dd>
					<ol>
						<li><a href="fuel.html?src=nav">燃油系统养护</a></li>
						<li><a href="engine.html?src=nav" class="noborder">发动机内部养护</a></li>
						<li><a href="air-conditioning.html?src=nav">空调系统养护</a></li>
						<li><a href="transmission.html?src=nav" class="noborder">变速箱系统养护</a></li>
						<li><a href="cooling.html?src=nav">冷却系统养护</a></li>
						<li><a href="intake-exhaust.html?src=nav" class="noborder">进排气系统养护</a></li>

					</ol>
				</dd>
			</dl>
			<div class="c"></div>
		</div>

	</div>
</body>
</html>