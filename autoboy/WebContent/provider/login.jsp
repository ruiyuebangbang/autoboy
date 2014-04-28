<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.rg/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/auto/favicon.ico" type="image/x-icon">
<title>养车客：简单车生活</title>
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<link rel="StyleSheet"
	href="<%=request.getContextPath()%>/css/main.css" type="text/css">
<link rel="StyleSheet"
	href="<%=request.getContextPath()%>/css/autoboys.css" type="text/css">
<link rel="StyleSheet"
	href="<%=request.getContextPath()%>/css/login.css" type="text/css">
<style>
body {
	background-color: #fff;
	margin: 0;
	padding: 0;
}

.simple-header {
	width: 200px;
	margin: 0 auto;
	height: 80px;
}

.simple-header .reg-logo {
	background: url(<%=request.getContextPath()%>/image/logo_logon.gif)
		no-repeat;
	height: 70px;
	margin: 0 auto;
}

.simple-header h1 {
	padding-top: 30px;
	float: left;
	font: 24px/24px "微软雅黑", "宋体";
	color: #333;
}
.container {
	clear: both;
	margin: 0 auto;
	padding: 20px 0 30px;
	background-color: #f5f5f1;
	background: url(../image/logon_bg.jpg) repeat-x;
}

.field-error {
	color: rgb(221, 75, 57);
	margin: -20px 0px 8px;
	font-size: 13px;
	line-height: 22px;
	clear: left;
}

.G_nologin_main {
	width: 390px;
	margin: 0 auto;
	padding: 0;
}

.login-title {
	text-align: center;
	padding: 10px;
}

.login-title h1 {
	font: 24px/24px '微软雅黑', '宋体';
	color: #333;
}

.W_login_form .no_reg {
	padding: 0;
	border-bottom: none;
	height: 61px;
}
.no_reg_tip {
color:#fff;
}
.no_reg_tip a {
color:#fff;
}
</style>


</head>

<body>
	<div id="wrap">
		<div class="simple-header clear">
			<div class="reg-logo">
				<a href="<%=request.getContextPath()%>/" class="logo"> <img
					src="<%=request.getContextPath()%>/image/blank.gif" alt="养车客"
					width="200" height="70">
				</a>
			</div>


		</div>
		<div class="login-title">
			<h1>养车客车生活服务平台商家管理系统</h1>
		</div>
		<!--  div super-container start -->
		<div class="container">

			<div class="G_nologin_main clear">
				<div class="loginbox">
					<div class="W_login_form">
						<form id="loginForm"
							action="<%=request.getContextPath()%>/provider/provider_login.action"
							method="post">
							<table class="wwFormTable">
								<div class="info_list" style="background-color: #fff;">
									<label class="username"> <input class="G_input"
										type="text" name="username" id="userName" alt="输入登录邮箱或手机号码"
										 autocomplete="off" value="<s:property value='username'/>">

									</label>
								</div>
								<s:property value="errors['member.username'][0]" escape="false" />
								<div class="info_list" style="background-color: #fff;">
									<label class="password"> <input class="G_input"
										type="password" name="password" id="password" alt="输入登录密码">
									</label>
								</div>
								<s:property value="errors['member.password'][0]" escape="false" />
								<div class="info_list clear">
									<input type="hidden" name="captchaId" id="myLoginCaptcha"
										value=""> <label class="verify"
										style="background-color: #fff;"> <input type="text"
										class="G_input captcha" id="myLoginCaptchaInput"
										name="captcha" alt="输入验证码">
									</label> <img id="myLoginCaptchaImg" width="80" height="30"
										src="/auto/image/blank.gif"
										onclick="silunziUtil.refreshCaptcha('myLoginCaptcha')"
										style="cursor: pointer; margin: 10px 0px 0px 30px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;"
										title="看不清楚，请点击换一张图片">

								</div>
								<s:property value="errors['member.captcha'][0]" escape="false" />
								<div class="info_list no_reg clear">
									
										<span class="no_reg_tip" >还没入驻，<a href="/auto/provider/provider_register.action" title="申请入驻" class="ml10" style="font-size:16px;font-weight:bold;">申请入驻</a></span>
										<!-- a href="javascript:void(0)" class="btn btn-large btn-block btn-primary" style="width: 120px; float: left;" id="sbmit">登录</a -->
										<input type="submit" value="登录" class="btn btn-large btn-block btn-primary" style="width: 120px; float: left;"></input>
										<s:hidden name="returnURL"/>
								</div>


							</table>
						</form>





					</div>
				</div>
			</div>

			<script type="text/javascript" src="/auto/scripts/mootools.js"></script>
			<script type="text/javascript"
				src="/auto/scripts/silunzi.js?n=silunzi-util&v=2014022209"></script>
			<script type="text/javascript">
				window.addEvent('domready', function() {
					lunziUtil.textOver('.G_input');
					silunziUtil.refreshCaptcha('myLoginCaptcha');
					$$(".info_list").getElements(
							"input[type='text'],input[type='password']").each(
							function(items, i) {
								items.addEvents({
									'focus' : function() {
										this.getParent('label').addClass(
												'focus_username');
									},
									'blur' : function() {
										var el = this.getParent('label')
												.removeClass('focus_username');
									}
								});
							});
					$('sbmit').addEvent('click', function(e) {
						e.preventDefault();
						vForm = $("loginForm");
						var isValid = validateForm(vForm);
						if (isValid)
							$("loginForm").submit();
						return false;
					})

				});
				function focusError(that, text) {
					that = that.getParent();
					var el = that.getParent();
					if (!that.retrieve('error')) {
						that.addClass('focus_error');
						var s = el.getStyle('margin-bottom').toInt(), error = new Element(
								'div', {
									'html' : text,
									styles : {
										'color' : '#dd4b39',
										'margin' : '-' + s + 'px 0 8px 0',
										'font-size' : '13px',
										'line-height' : '22px'
									}
								}).inject(el, 'after');
						that.store('error', error);
					} else {
						that.addClass('focus_error');
						that.retrieve('error').show().innerHTML = text;
					}
				}

				function remmoveError(el) {
					el = $(el).getParent();
					if (!el.retrieve('error'))
						return;
					el.retrieve('error').hide();
					el.removeClass('focus_error');
				}

				function validateForm(form) {
					var nval = $('userName').value;
					var mycaptcha = $('myLoginCaptchaInput').value;
					if (nval == '') {
						$("userName").focus();
						//focusError($('userName'),'登录邮箱或手机号码不能为空！');
						return false;
					} else
						remmoveError("password");
					if ($("password").value == '') {
						$("password").focus();
						//focusError($('password'),'登录密码不能为空！');
						return false;
					} else
						remmoveError('password');
					if (mycaptcha == '') {
						$('myLoginCaptchaInput').focus();
						//focusError($('myLoginCaptchaInput'),'验证码不能为空！');
						return false;
					} else
						remmoveError('myLoginCaptchaInput');
					return true;
				}
			</script>


			<div style="clear: both;"></div>
		</div>


	</div>

</body>
</html>
