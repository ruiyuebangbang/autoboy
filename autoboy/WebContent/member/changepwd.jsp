<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>

<head>

<title></title>

</head>

<body>
	<div id="change-pwd" class="change-pwd"	style="margin:40px; display: block;">
		<s:form cssClass="pwd-form" action="changePassword" method="post">	
			<fieldset class="form-section item">
				<label for="currpwd">当前密码<span>*</span></label> 
				<input type="text" name="currpwd" id="currpwd"	class="input" placeholder="" maxlength="15" value="">
				<font color='red'><s:property value="errors['currpwd'][0]" /></font>
				<p class="tip-msg tipMsg"></p>
			</fieldset>
			
			<fieldset class="form-section item">
				<label for="newpwd">新密码<span>*</span></label> 
				<input type="text" name="newpwd" id="newpwd" class="input" placeholder="" value="">
				<font color='red'><s:property value="errors['newpwd'][0]" /></font>
				<p class="zipcode-tip" id="zipcodeTip"></p>
				<p class="tip-msg tipMsg"></p>
			</fieldset>
			<fieldset class="form-section item">
				<label for="renewpwd">确认新密码<span>*</span></label> 
				<input type="text"	name="renewpwd" class="input" id="renewpwd" placeholder="" value="">
				<font color='red'><s:property value="errors['renewpwd'][0]" /></font>
				<p class="zipcode-tip" id="zipcodeTip">					
				</p>
				<p class="tip-msg tipMsg"></p>
			</fieldset>
			<fieldset class="form-section item">
				<button type="submit" class="btn btn-primary btn-small" id="addNewAddrSure">确认修改</button>
				<button type="button" class="btn btn-small" id="addNewAddrCancel">取消</button>
			</fieldset>
		</s:form>
	</div>
</body>
</html>
