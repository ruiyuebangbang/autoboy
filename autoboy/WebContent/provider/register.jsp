<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.rg/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="/auto/favicon.ico" type="image/x-icon">
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<title>养车客：让每个车主车生活变得简单、好玩</title>
<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/main.css"
	type="text/css">
<link rel="StyleSheet"
	href="<%=request.getContextPath()%>/css/register.css" type="text/css">
<link rel="StyleSheet"
	href="<%=request.getContextPath()%>/css/autoboys.css" type="text/css">
<style>
.simple-header {
	width: 990px;
	margin: 10px auto;
}

.simple-header .reg-logo {
	background: url(../image/yck_logo.gif) no-repeat;
	width: 340px;
	float: left;
	height: 70px;
}

.simple-header h1 {
	padding-top: 30px;
	float: left;
	font: 24px/24px "微软雅黑", "宋体";
	color: #333;
}

.container {
	clear: both;
	width: 990px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid #ccccc8;
}
.W_login_form .info_list dt {
	width: 80px;
	float: left;
	text-align: right;
	line-height: 38px;
}
.W_login_form .info_list dd {
	width:470px;
	float:left;
}
.W_login_form .info_list dd select {
	height: 34px;
width: 100px;
margin-right: 6px;
}
.loginbox .W_login_form{
	padding-left:20px;
}
.W_login_form .info_list {
margin: 0 0 20px;
position: relative;
clear: both;
height: 30px;
}
</style>
<script src="../scripts/jquery-1.11.0.js"></script>
</head>

<body screen_capture_injected="true">
	<div id="wrap">
		<div class="simple-header clear">
			<div class="reg-logo">
				<a href="/auto" class="logo"> <img src="/auto/image/blank.gif"
					alt="养车客" width="202" height="70">
				</a>
			</div>

			<h1></h1>
		</div>
		<!--  div super-container start -->
		<div class="container">

			<div class="G_nologin_main clear">
				<s:form action="provider_register" method="post">
					<div class="loginbox">
						<div class="W_login_form" id="phoneLogin_content">
							<div style="font-size:22px;font-family: Microsoft YaHei,Hiragino Sans GB,\5b8b\4f53;margin-bottom:30px;">商家注册<span style="margin:0 10px;">您注册成功后，我们的工作人员将会在一个工作日内联系您</span></div>
							<dl class="info_list">
								<dt>手机号：</dt>
								<dd>
								<label class="inpt"> <input class="G_input"
									type="text" id="mobilePhone" name="mb.mobilePhone" alt=""
									style="width: 246px;"
									value='<s:property value="mb.mobilePhone"/>'>
								</label>
								<font color='red'><s:property value="errors['mb.mobile'][0]" escape="false" /></font>
								</dd>
							</dl>
							
							<dl class="info_list">
								<dt>登录密码：</dt>
								<dd>
								<label class="inpt"> <input class="G_input"
									type="password" id="password" name="mb.password" alt="">

								</label>
								<font color='red'><s:property value="errors['mb.password'][0]" escape="false" /></font>
								</dd>
							</dl>
							
							<dl class="info_list">
								<dt>确认密码：</dt>
								<dd>
								<label class="inpt"> <input class="G_input"
									type="password" name="mb.repassword" id="repassword"
									alt="">

								</label>
								</dd>
							</dl>
							<dl class="info_list">
								<dt>店铺名称：</dt>
								<dd>
								<label class="inpt"> <input class="G_input"
									maxlength="11" type="text" id="email" name="provider.SHORT_NAME"
									alt="" value='<s:property value="provider.SHORT_NAME"/>'>
								</label>
								<font color='red'><s:property value="errors['provider.SHORT_NAME'][0]" escape="false" /></font>
								</dd>
							
								
							</dl>
							<dl class="info_list">
								<dt>联系人：</dt>
								<dd>
								<label class="inpt"> <input class="G_input" type="text"
									id="nickName" name="mb.nickName" alt=""
									value='<s:property value="mb.nickName"/>'>

								</label>
								<font color='red'><s:property value="errors['mb.nickName'][0]" escape="false" /></font>
								</dd>
							</dl>
							<dl class="info_list">
								<dt>店铺地址：</dt>
								<dd>
									<s:select id="region1" name="region1" list="regions1"  theme="simple" cssClass="not_null" listKey="id" listValue="name" onchange="changeReg1(this.value);"></s:select> 
							    <s:select id="region2" name="region2" list="regions2"  theme="simple" cssClass="not_null" listKey="id" listValue="name" onchange="changeReg2(this.value);"></s:select> 
							    <s:select id="region3" name="provider.REGION_ID" list="regions3"  theme="simple" cssClass="not_null" listKey="id" listValue="name" ></s:select> 
								<font color='red'><s:property value="errors['provider.region'][0]" escape="false" /></font>
								</dd>
							</dl>
							<!--  dl class="info_list">
								<dt>营业执照：</dt>
								<dd>
									<img src="<%=request.getContextPath() %>/image/b_licence_default.png" border="0" width="230px" style="float:left;">
									<span style="float:left;margin: 106px 0 0 10px;"><a href="" class="btn btn-small">上传图片</a></span>
								</dd>
							</dl-->
							
							<div style="padding:10px 0 20px;clear:both;">
								<input type="checkbox" name="service2" checked="checked"
									id="service2"><label for="service2" class="ml5">我接受服务协议表明您已经阅读并同意接受养车客的</label><a
									href="/service/treaty.dhtml"
									style="margin-left: 5px; color: #333" target="_blank">商家入住协议</a>
							</div>
							<div class="info_list no_reg clear" style="text-align:center;">
								<a href="javascript:void(0);" id="sbmit"
									onclick="savePhoneReg();" class="btn btn-primary btn-large">申请入住</a>
							</div>
						</div>
					</div>
				</s:form>
				<div class="scroll_img">
					<h2>已经有养车客账号？</h2>
					<a href="/auto/provider/provider_login.action"
						class="btn btn-small btn-primary" style="margin-left: 3px;"><span>立即登录</span></a>
					<div class="cooperation clear" style="margin-top: 50px;">
						<dl>
							<dt>其它账号登录：</dt>
							<dd class="mt10" style="padding-left: 3px;">
								<a href="/login/sinaLogin.xhtml" target="_blank" title="新浪账号登录"
									class="sina"><img
									src="http://static5.silunzi.com/css/images/blank.gif"
									height="90" width="90">新浪</a> <a href="/login/qqLogin.xhtml"
									target="_blank" title="QQ账号登录" class="qq"><img
									src="http://static5.silunzi.com/css/images/blank.gif"
									height="90" width="90">腾讯</a>

							</dd>
						</dl>
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/scripts/mootools.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/scripts/silunzi.js?n=silunzi-util&v=2014022209"></script>
			<script type="text/javascript">
		window.addEvent('domready', function() {
			lunziUtil.textOver('.G_input');
			$$(".G_input").addEvents({
				'focus' : function() {
					this.getParent('label').addClass('focusInpt');
				},
				'blur' : function() {
					var el = this.getParent('label').removeClass('focusInpt');
					
					if (this.id == "nickName") {
						if (this.value != "") {
							if (!/^[\w+$\u4e00-\u9fa5]+$/.test(this.value)) {
								focusError(this, '昵称不能为特殊字符！');
							} else {
								checkNickName('nickName');
							}
						} else
							remmoveError(this);
					}
				},
				'keyup' : function(e) {
					if (e.code == 32)
						this.value = this.value.trim();
				}
			});
			$('mobilePhone').addEvent('keyup', function() {
				this.value = this.value.replace(/[^\d]/g, '');
			});
			$('sendDTPassword').addEvent('click', function() {
				resend();
			});
			$('showReCaptcha').show();
			silunziUtil.refreshCaptcha('captchaMobile');
		})
		function focusError(that, text) {
			if ($(that).retrieve('OverText')) {
				$(that).retrieve('OverText').text.hide();
			}
			that = that.getParent();
			var el = that.getParent();
			if (!that.retrieve('error')) {
				that.addClass('focus_error');
				var s = el.getStyle('margin-bottom').toInt(), error = new Element(
						'div', {
							'html' : text,
							'class' : 'icon_th',
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

		function filterFocusError(elId, data) {
			if (!$(elId))
				return;
			var hash = new Hash(data);
			hash.each(function(value, key) {
				var el = $(elId).getElement('*[name=' + key + ']');
				if (key && el) {
					focusError(el, value);
					el.focus();
				}
			});
		};
		function validateForm(values) {
			var maps = Object.filter(values, function(value, key) {
				return key != 'captchaId' && key != 'captcha' && value == '';
			})
			maps = Object.keys(maps);
			if (maps.length > 0) {
				maps = document.getElement('input[name=' + maps[0] + ']');
				maps.focus();
				return false;
			} else
				return true;
		}

		function savePhoneReg() {

			//var values = silunziUtil.getValues("phoneLogin_content"); 该行报错
			
			//if (!validateForm(values))
			//	return;
	
			if ($("#service2").prop("checked") == false) {
				//alert(3);
				lunziUtil.alert("您必须同意服务协议");
				return false;
			}
			
			/*var url = '<%=request.getContextPath()%>/provider/provider_register.action';
			silunziUtil.mask("sbmit");
			silunziUtil.sendRequest(url, values,
					function(result) {
						silunziUtil.unmask();
						if (result.success) {
							document.location = '<%=request.getContextPath()%>/main.action';
						} else {
							if (result.msg) {
								lunziUtil.alert(result.msg);
							} else {
								filterFocusError('phoneLogin_content',
										result.errorMap);
							}
						}
					});*/

					document.forms[0].submit();
					
		}

		var second = 60;
		GetRTime = function() {
			$('sendDTPassword').removeEvents('click');
			if (second >= 0) {
				var txt = '';
				if ($('sendDTPassword')) {
					if (second == 0)
						txt = '重新获取动态码';
					else
						txt = second + '秒后重新获取';
					$('sendDTPassword').innerHTML = txt;
				}
				second = second - 1;
				setTimeout("GetRTime()", 1000);
			} else {
				$('sendDTPassword').addEvent('click', function() {
					resend();
				});
			}
		}
		resend = function() {
			if ($('mobile').value == '') {
				$('mobile').focus();
				return;
			}
			if ($('captchaMobileInput').value == '') {
				$('captchaMobileInput').focus();
				return false;
			}
			lunzi.util.mask({
				'element' : "sendDTPassword",
				'title' : '正在提交，请稍等...'
			});
			var values = {
				"mobile" : $('mobile').value,
				'captchaId' : $('captchaMobile').value,
				'captcha' : $('captchaMobileInput').value
			};
			silunziUtil.sendRequest('/ajax/mobile/newRegister.xhtml', values,
					function(result) {
						lunzi.util.clearMask();
						if (result.success) {
							retime();
							remmoveError($('captchaMobileInput'));
							remmoveError($('mobile'));
						} else {
							if (result.refreshCaptcha) {
								silunziUtil.refreshCaptcha('captchaMobile');
							}
							if (result.msg) {
								lunziUtil.alert(result.msg);
							} else {
								filterFocusError('phoneLogin_content',
										result.errorMap);
								silunziUtil.refreshCaptcha('captchaMobile');
							}
						}
					}, 'get');
		}
		retime = function() {
			second = 60;
			GetRTime();
		}
		function checkNickName(tag) {
			var url = '<%=request.getContextPath()%>/auth/validateNickName.action', el = document.getElement('input[name=' + tag + ']');
					var values = {
						'tag' : tag,
						'itemvalue' : el.value
					};
					silunziUtil.sendRequest(url, values, function(result) {
						if (!result.success) {
							if (result.errorMap) {
								focusError(el, el.alt + "已被使用,请换一个！");
							} else {
								focusError(el, result.msg);
							}
						} else
							remmoveError(el);
					}.bind(this), 'get');
				}
				
				function changeReg1(reg1){	
					$.get( "../ajax/common/getRegionsByReg1.action", { regId: reg1},
					  function( data ) {  
						  //alert(data);
						  //$("#region2").empty();
						  $("#region2").html(data);
						  changeReg2($("#region2").val());
						 }
					);
				}
				function changeReg2(reg2) {
					$.get( "../ajax/common/getRegionsByReg1.action", { regId: reg2},
							  function( data ) {  
								  $("#region3").html(data);
								 }
					);
				}
			</script>

		</div>
	</div>
</body>
</html>
