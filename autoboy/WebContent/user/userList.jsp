<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Registration Page</title>
<s:head />
<style type="text/css">
@import url(style.css);
</style>
</head>
<body>

<div class="pcontent-title">
		<h1>员工账号管理</h1>
	</div>
<div style="margin:20px 30px;">

<s:form action="saveOrUpdateUser">

		<s:hidden name="user.id" />
		<s:hidden name="user.verifiedemail" />
		<s:hidden name="user.provid" />
		<s:hidden name="user.classid" />
		<s:hidden name="user.isAdmin" />
	  <tr><td>昵称:</td><td><s:textfield theme="simple" name="user.nickName"/><span class="cr">*</span><font color='red'><s:property value="errors['user.nickName'][0]" escape="false"/></font></d></tr>
		<tr>
		<td class="tdLabel"><label for="saveOrUpdateUser_user_password" class="label">密码:</label></td>
    	<td><input type="password" name="user.password" value='<s:property value="user.password" />' /><span class="cr">*</span><font color='red'><s:property value="errors['user.password'][0]" escape="false"/></font></td>
		</tr>
		<tr><td>手机:</td><td><s:textfield theme="simple" name="user.mobilePhone" /><span class="cr">*</span><font color='red'><s:property value="errors['user.mobilePhone'][0]" escape="false"/></font></td></tr>
		<tr><td>邮箱:</td><td><s:textfield theme="simple" name="user.email" /><span class="cr">*</span><font color='red'><s:property value="errors['user.email'][0]" escape="false"/></font></td></tr>
		<s:submit value="提交"/>

</s:form>
</div>
<s:if test="userList.size() > 0">
	<div class="content">
	<table class="tblist">
		<tr class="even">
			<th width="20%">昵称</th>
			<th width="20%">密码</th>
			<th width="20%">手机</th>
			<th width="20%">邮箱</th>
			<th width="20%">操作</th>
		</tr>
		<s:iterator value="userList" status="rows">
			<tr
				class="<s:if test="#rows.odd == true ">odd</s:if><s:else>even</s:else>">
				<td align="left"><s:property value="nickName" /></td>
				<td align="left">********</td>
				<td align="left"><s:property value="mobilePhone" /></td>
				<td align="left"><s:property value="email" /></td>
				<td>
					<span>
						<s:url id="editURL" action="editUser">
							<s:param name="id" value="%{id}"></s:param>
						</s:url> <s:a href="%{editURL}">修改</s:a>
					</span>
					<span>
						<s:url id="deleteURL" action="deleteUser">
							<s:param name="id" value="%{id}"></s:param>
						</s:url> <s:a href="%{deleteURL}">删除</s:a>
					</span>
				</td>
			</tr>
		</s:iterator>
	</table>
	</div>
</s:if>
</body>
</html>