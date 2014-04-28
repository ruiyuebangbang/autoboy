<%@ page contentType="text/html; charset=utf-8"%>
<style type="text/css">
.ui_top_nav{position:relative; z-index:2; _position:static;}
.ui_logins{position:relative; z-index:0; float:right;}
.ui_cityChoose{z-index:10px;}
.ui_warning_header{position:absolute; overflow:visible; width:200px; right:115px; height:auto; line-height:20px; top:15px; text-align:left; color:#666;}
.ui_warning_header .inner{position:relative; padding:5px 0;}
.ui_warning_header i{display:inline-block; font-family:'SimSun'; font-size:16px; font-style:normal; height:22px; line-height:26px; overflow:hidden; position:absolute;}
.ui_warning_header .t{color:#FFE3BB; right:10px;top:-13px;}
.ui_warning_header i.t i{color:#FFFFDD; left:0; top:1px;}
.ui_warning_header a{color:#c30; padding:0;}
.ui_warning_header a:hover{color:#c30; text-decoration:underline!important;}
.ui_userBox{float:left}
.ui_getRd{float:right;}

</style>

<div class="ui_userBox">
	<img class="ui_dHead" width="30" height="30" alt="" style="display:none;" src="http://img6.gewara.com/cw30h30/img/default_head.png"/>
	<a href="javascript:showLogin(refreshPage);">登录</a>|<a href="/register.xhtml?tagNo=13929496225654808" target="_blank">注册</a>
</div>
<a href="/everday/acct/mygift.xhtml" target="_blank" class="ui_getRd">领红包</a>
<div class="dialogic" id="logins" style="display:none;">
	<div style="width:530px;overflow:hidden;padding-bottom:10px;clear: both;position: relative;">
		<div style="width:140px;position: relative;margin-right:-1px;float:left;color:#999;text-align: right;font-size:14px;padding-top:5px;">
			<ul style="width:100%;">
				<li data-for="eventAccount" style="margin-bottom:10px; border:1px solid #fb9; border-right:1px solid #eee; height:48px;line-height:48px;padding-right:10px;border-right-color:#fff;cursor: pointer;font-weight: bold;color:#333">账户登录</li>
				<li data-for="eventPhone" id="even_dphone" style="margin-bottom:10px; border:1px solid #eee; border-right:none; margin-right:1px; height:48px;line-height:48px;padding-right:10px;cursor: pointer;background:#F7F7F7;">手机动态码登录</li>
			</ul>
			<div style="font-size:14px;color:#999;margin:15px 0 5px;text-align: left;">其它账号登录<span style="margin-left:10px;padding-right:12px; font-size:12px; color:#c30; background:url(http://static5.gewara.com/css/global/selectBar_arrow.png) right center no-repeat;cursor:pointer;" onclick="$('openMoreLink').toggle();">更多</span></div>
			<div style="height:104px;overflow: hidden;text-align: right;position: relative;">
				<a data-type="loginevent" href="/login/sinaLogin.xhtml" title="新浪账号登录" style="display: inline-block;width:50px;height:50px;background:#ff9999 url(http://static5.gewara.com/css/global/pub_icon.png) 0 -74px no-repeat;float:left;margin:2px 2px 0 0;cursor:pointer;color:#fff;overflow:hidden;line-height:86px;font-size:11px;text-align:center;text-indent:-100px;" target="_blank">微博</a>
				<a data-type="loginevent" href="/login/qqLogin.xhtml" title="QQ账号登录" style="display: inline-block;width:50px;height:50px;background:#a8dbf6 url(http://static5.gewara.com/css/global/pub_icon.png) -52px -74px no-repeat;float:left;margin:2px 2px 0 0;cursor:pointer;color:#fff;overflow:hidden;line-height:86px;font-size:11px;text-align:center;text-indent:-100px;" target="_blank">QQ</a>
				<a data-type="loginevent" href="/login/alipayLogin.xhtml" title="支付宝账号登录" style="display: inline-block;width:50px;height:50px;background:#ffcc99 url(http://static5.gewara.com/css/global/pub_icon.png) -102px -74px no-repeat;float:left;margin:2px 2px 0 0;cursor:pointer;color:#fff;overflow:hidden;line-height:86px;font-size:11px;text-align:center;text-indent:-100px;" target="_blank">支付宝</a>
				<a data-type="loginevent" href="/login/chinapayLogin.xhtml" title="银联在线支付账号登录" style="display: inline-block;width:50px;height:50px;background:#cce4bb url(http://static5.gewara.com/css/global/pub_icon.png) -152px -74px no-repeat;float:left;margin:2px 2px 0 0;cursor:pointer;color:#fff;overflow:hidden;line-height:86px;font-size:11px;text-align:center;text-indent:-100px;" target="_blank">在线支付</a>
				<div class="jointly" id="openMoreLink" style="position: absolute;right:10px;top:3px;background: #fff;width:16px;height:100%;display: none;">
					<a href="/login/kaixinLogin.xhtml" target="_blank" data-type="loginevent" title="开心账号登录"><img src="http://static5.gewara.com/css/images/blank.gif" style="background-position:0 -80px;" height="16" width="16"/></a>
					
					<a href="/login/sdoLogin.xhtml" target="_blank" data-type="loginevent" title="盛大账号登录"><img src="http://static5.gewara.com/css/images/blank.gif" align="middle" style="background-position:0 -96px;" height="16" width="16"/></a>
					<a href="/login/dbLogin.xhtml" target="_blank" data-type="loginevent" title="豆瓣账号登录"><img src="http://static5.gewara.com/css/images/blank.gif" style="background-position:0 -64px;" height="16" width="16"/></a>
					<a href="/login/139Login.xhtml" target="_blank" data-type="loginevent" title="139邮箱账号登录"><img src="http://static5.gewara.com/css/images/blank.gif" align="middle" style="background-position:0 -128px;" height="16" width="20"/></a>
				</div>
			</div>
		</div>
		<div style="width:352px;border-left:1px solid #fb9;height:100%;overflow:hidden;padding:5px 0 0 35px;float:left;">
			<div id="eventAccount" data-type="loginPanel">
				<form action="javascript:loginTo();">
					<div style="margin-bottom:20px;">
						<label style="border:1px solid #ccc; border-radius:2px;box-shadow:1px 1px 1px 0 #eaeaea inset;color:#ccc;height:30px;padding:9px 3px 3px 54px;display:block;width:290px;background:url(http://static5.gewara.com/css/global/pub_icon.png) no-repeat;"><input type="text" id="loginname" autocomplete="off" class="focusText" style="border:0 none;width:290px;height:24px;color:#808080;font:22px/24px verdana,lucida,arial,helvetica,'宋体',sans-serif;vertical-align: -3px;outline: none;background:#fff;" alt="注册邮箱/手机号码"/></label>
					</div>
					<div style="margin-bottom:20px;">
						<label style="border:1px solid #ccc; border-radius:2px;box-shadow:1px 1px 1px 0 #eaeaea inset;color:#ccc;height:30px;padding:9px 3px 3px 54px;display:block;width:290px;background:url(http://static5.gewara.com/css/global/pub_icon.png) 0 -35px no-repeat;"><input type="password" id="loginpassword" autocomplete="off" class="focusText" style="border:0 none;width:290px;height:24px;color:#808080;font:22px/24px verdana,lucida,arial,helvetica,'宋体',sans-serif;vertical-align: -3px;outline: none;background:#fff;" alt="登录密码"/></label>
					</div>
					<div style="margin-bottom:20px;position: relative;">
						<input type="hidden" name="captchaId"  id="dialogLoginCaptcha"/>
						<label style="border:1px solid #ccc; border-radius:2px;box-shadow:1px 1px 1px 0 #eaeaea inset;color:#ccc;height:30px;padding:9px 5px 3px;display:block;width:168px;"><input type="text" class="focusText" autocomplete="off" id="dialogLoginCaptchaInput" name="captcha" alt="验证码" style="border:0 none;width:168px;height:24px;color:#808080;font:22px/24px verdana,lucida,arial,helvetica,'宋体',sans-serif;vertical-align: -3px;outline: none;background:#fff;"/></label>
						<img id="dialogLoginCaptchaImg" width="80" height="30" src="http://static5.gewara.com/css/images/blank.gif" style="cursor: pointer;position: absolute;left:200px;top:6px;" onclick="GewaraUtil.refreshCaptcha('dialogLoginCaptcha')" title="看不清楚，请点击换一张图片"/>
					</div>
					<div style="position: relative;padding-bottom:10px;">
						<input type="submit" value="登&nbsp;&nbsp;&nbsp;录" style="display:block;width:180px;height:60px;background:url(http://static5.gewara.com/css/global/pub_icon.png) -11px -1323px no-repeat;font:30px/60px '微软雅黑',Arial,Helvetica,'宋体';color:#fff;text-align:center;cursor:pointer;border:0px;"/>
						<span style="position: absolute;left:195px;top:32px;font-size:14px;">
							<a href="/forgetPassword.xhtml" style="color:#333;margin-right:5px">忘记密码？</a>|<a href="/register.xhtml" style="color:#333;margin-left:10px">免费注册</a>
						</span>
					</div>
				</form>
			</div>
			<div id="eventPhone" style="display: none;" data-type="loginPanel">
				<form action="javascript:loginToPhone();">
					<div style="margin-bottom:20px;">
						<label style="border:1px solid #ccc; border-radius:2px;box-shadow:1px 1px 1px 0 #eaeaea inset;color:#ccc;height:30px;padding:9px 3px 3px 54px;display:block;width:290px;background:url(http://static5.gewara.com/css/global/pub_icon.png) 0 -1240px no-repeat;"><input type="text" class="focusText" maxlength="11" name="mobile" id="loginMobile" autocomplete="off" value="" onkeyup="GewaraUtil.replaceStr(this);" style="border:0 none;width:290px;height:24px;color:#808080;font:22px/24px verdana,lucida,arial,helvetica,'宋体',sans-serif;vertical-align: -3px;outline: none;background:#fff;" alt="手机号码"/></label>
					</div>
					<div style="margin-bottom:20px;position: relative;display: block;" id="showCaptcha">
						<label style="border:1px solid #ccc; border-radius:2px;box-shadow:1px 1px 1px 0 #eaeaea inset;color:#ccc;height:30px;padding:9px 5px 3px;display:block;width:168px;"><input type="text" class="focusText" id="innerLoginCaptchaInput" value="" name="captcha" alt="验证码" autocomplete="off" style="border:0 none;width:168px;height:24px;color:#808080;font:22px/24px verdana,lucida,arial,helvetica,'宋体',sans-serif;vertical-align: -3px;outline: none;background:#fff;"/></label>
						<input type="hidden" name="captchaId"  id="innerLoginCaptcha">
						<img id="innerLoginCaptchaImg" width="80" height="30" src="http://static5.gewara.com/css/images/blank.gif" style="cursor: pointer;position: absolute;left:200px;top:6px;" onclick="GewaraUtil.refreshCaptcha('innerLoginCaptcha')" title="看不清楚，请点击换一张图片"/>
					</div>
					<div style="margin-bottom:20px;position: relative;">
						<span style="cursor:pointer;font-size:14px;width:152px;text-align: center;display: block;height:40px;line-height:40px;border:1px solid #ccc;background:#f7f7f7;color:#000;border-radius:3px;" id="botton_count_on">点击获取动态码</span>
						<i style="position: absolute;left:170px;font-style: normal;top:10px;color:gray">稍后手机将收到动态码短信</i>
					</div>
					<div style="margin-bottom:20px;">
						<label style="border:1px solid #ccc; border-radius:2px;box-shadow:1px 1px 1px 0 #eaeaea inset;color:#ccc;height:30px;padding:9px 3px 3px 54px;display:block;width:290px;background:url(http://static5.gewara.com/css/global/pub_icon.png) 0 -35px no-repeat;"><input type="text"  class="focusText" name="checkpass" id="DTPassword" autocomplete="off" value="" style="border:0 none;width:290px;height:24px;color:#808080;font:22px/24px verdana,lucida,arial,helvetica,'宋体',sans-serif;vertical-align: -3px;outline: none;background:#fff;" alt="动态码"/></label>
					</div>
					<div style="position: relative;padding-bottom:10px;">
						<input type="submit" value="登&nbsp;&nbsp;&nbsp;录"  style="display:block;width:180px;height:60px;background:url(http://static5.gewara.com/css/global/pub_icon.png) -11px -1323px no-repeat;font:30px/60px '微软雅黑',Arial,Helvetica,'宋体';color:#fff;text-align:center;cursor:pointer;border:0px;"/>
						<span style="position: absolute;left:195px;top:32px;font-size:14px;">
							<a href="/forgetPassword.xhtml" style="color:#333;margin-right:5px">忘记密码？</a>|<a href="/register.xhtml" style="color:#333;margin-left:10px">免费注册</a>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var isPhnoeCode = false;
loginToPhone = function(){
	var loginMobile = $('loginMobile').value;
	var DTPassword = $('DTPassword').value;
	if(!$chk(loginMobile)){$('loginMobile').focus();return;}
	if(!$chk(DTPassword)){$('DTPassword').focus();return;}
	var url = "/ajax/mobile/asynchLogin.xhtml";
	var values = GewaraUtil.getValues('eventPhone');
	GewaraUtil.mask();
	GewaraUtil.sendRequest(url, values, function(result){
		GewaraUtil.unmask();
		if(result.success){http://localhost/
			GewaraUtil.member={'login':true, 'memberid':result.id,'nickname': result.nickname,'isMobile':result.isMobile};
			if(loginCallback) loginCallback();
			gewa.util.container['logins'].dispose('logins');
		}else{
			if(result.refreshCaptcha){
				$('showCaptcha').show();
				GewaraUtil.refreshCaptcha('innerLoginCaptcha');
				isPhnoeCode = true;
			}
			if(result.errorMap){
				Object.each(result.errorMap,function(value,key){
					gewa.util.focusErroe($('logins').getElement('input[name='+key+']'),value);
				})
			}
			if(result.msg)gewa.util.focusErroe('DTPassword',result.msg);
		}
   });
}

window.addEvent('domready', function(){
	var loginMenu = $$('#logins li');
	loginMenu.addEvent('click',function(){
		loginMenu.setStyles({'color':'#999','font-weight':'normal','border-color':'#eee','border-right':'none','margin-right':'1px','background':'#F7F7F7'});
		this.setStyles({'color':'#000','font-weight':'bold','border':'1px solid #fb9','border-right-color':'#fff','margin-right':'0','background':'#fff'});
		$('logins').getElements('div[data-type=loginPanel]').hide();
		$(this.get('data-for')).show();
		gewaUtil.textOver('.focusText');
	})
	$$('#logins input[type=text],#logins input[type=password]').addEvents({
		'focus':function(e){
			if(e)this.getParent('label').setStyles({
				'border-color':'#ff9a66',
				'box-shadow':'0 0 5px #ff9a66'
			})
		},
		'blur':function(){
			var el = this.getParent('label').setStyles({
				'border-color':'#CCCCCC',
				'box-shadow':'none'
			});
		}
	})
	$$('a[data-type=loginevent]').addEvents({
		'click':function(){gewa.util.container['logins'].dispose('logins');},
		'mouseenter':function(){chagebackground(this,true);},
		'mouseleave':function(){chagebackground(this,false);}
	})
	if(document.cookie==''){
		if($('loginBtnDV'))$('loginBtnDV').set('html', '<span class="brown">你使用的浏览器不支持cookie或你已禁用cookie！</span>');
	}
	$('botton_count_on').addEvent('click',function(){resendLogin();});
});


function chagebackground(el,flag){
	el = $(el);
	if(el.getParent('#openMoreLink'))return;
	var pos = el.getStyle('backgroundPosition').split(' ');
	pos = flag?(pos[0] + ' -80px'):(pos[0] + ' -74px')
	el.setStyles({
		'background-position':pos,
		'text-indent':flag?'0px':'-100px'
	})
}
</script>
<script type="text/javascript">
var second = 60;
GetRTimeLogin = function (){
	$('botton_count_on').removeEvents('click');
	if(second>=0){
		var txt = '';
		if($('botton_count_on')){
			if(second == 0)txt = '重新获取动态码';
			else txt = second + '秒后重新获取';
			$('botton_count_on').innerHTML = txt;
		}
		second = second-1;
		setTimeout("GetRTimeLogin()",1000);
	}else {
		$('botton_count_on').addEvent('click',function(){resendLogin();});
	}  
} 
resendLogin = function(){
	if($('loginMobile').value == '' || $('loginMobile').value.length != 11){
		$('loginMobile').focus();
		return false;
	}
	if(isPhnoeCode && $('showCaptcha').getStyle('display') == 'none'){
		GewaraUtil.refreshCaptcha('innerLoginCaptcha');
		$('showCaptcha').show();
		return false;
	}
	if(isPhnoeCode && $('innerLoginCaptchaInput').value == ''){
		$('innerLoginCaptchaInput').focus();
		return false;
	}
	gewa.util.mask({'element': "botton_count_on",'title':'正在提交，请稍等...'});
	var values = {"mobile":$('loginMobile').value,'captchaId':$('innerLoginCaptcha').value,'captcha':$('innerLoginCaptchaInput').value};
	GewaraUtil.sendRequest('/ajax/mobile/achieve.xhtml', values, function(result){
		gewa.util.clearMask();
		if(result.success){
			retimeLogin();
			GewaraUtil.refreshCaptcha('innerLoginCaptcha');
			gewa.util.remmoveError($('innerLoginCaptchaInput'));
		}else{
			if(result.refreshCaptcha){
				$('showCaptcha').show();
				GewaraUtil.refreshCaptcha('innerLoginCaptcha');
			}
			if(result.msg)gewa.util.focusErroe('innerLoginCaptchaInput',result.msg);
			if(result.errorMap && result.errorMap.captcha)gewa.util.focusErroe('innerLoginCaptchaInput',result.errorMap.captcha);
			gewaUtil.textOver('.focusText');
		}
	}, 'get');
}
retimeLogin = function(){
	second = 60;
	GetRTimeLogin();
}
</script>