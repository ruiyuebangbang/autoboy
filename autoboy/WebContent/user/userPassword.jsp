<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>密码设置</title>
<s:head />
<style type="text/css">
@import url(style.css);
</style>
<script language=javascript>
function verifyPass() {
	if(document.forms[0].editPassword_user_password.value == "") {
		alert("密码不能为空");
		return false;
	} 
	if(document.forms[0].editPassword_user_password.value != document.forms[0].editPassword_user_nickName.value) {
		alert("两次密码不一致");
		return false;
	}
	return true;
}
</script>
</head>
<body>

<div class="pcontent-title">
		<h1>密码设置</h1>
	</div>
<div style="margin:20px 30px;">

<s:form onsubmit="return verifyPass();">
		<s:password name="user.password" label="新密码" />
		<s:password name="user.nickName" label="重复密码" />
		<s:submit value="提交" />

</s:form>
</div>
</body>
</html>