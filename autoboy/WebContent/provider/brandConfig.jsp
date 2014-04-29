<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<meta http-equiv="imagetoolbar" content="no">
<title>养车客商家后台：维修品牌设置</title>
<style>
	.b-shortcut span {
		display:block;
	}
	#brandForm ul {
		width: 700px;
		float: left;
		
	}
	#brandForm ul li {
		width: 130px;
		float: left;
		margin: 2px 0 2px 10px;
	}
</style>
</head>
<body>
<div class="pcontent-title"><h1>维修品牌设置</h1></div>
<s:form id="brandForm" method="post" theme="simple">
<div class="b-shortcut" style="width: 20px; float: left; margin-left: 20px;">
<span style="margin-top:2px;">A</span>
<span style="margin-top:4px;">B</span>
<span style="margin-top:56px;">C</span>
<span style="margin-top:4px;">D</span>
<span style="margin-top:30px;">F</span>
<span style="margin-top:6px;">G</span>
<span style="margin-top:4px;">H</span>
<span style="margin-top:54px;">J</span>
<span style="margin-top:32px;">K</span>
<span style="margin-top:30px;">L</span>
<span style="margin-top:54px;">M</span>
<span style="margin-top:6px;">O</span>
<span style="margin-top:4px;">Q</span>
<span style="margin-top:6px;">R</span>
<span style="margin-top:4px;">S</span>
<span style="margin-top:30px;">W</span>
<span style="margin-top:30px;">X</span>
<span style="margin-top:4px;">Y</span>
<span style="margin-top:4px;">Z</span>
</div>
<s:checkboxlist list="brandList" listKey="code" listValue="cname" value="pbCodeList" name="pbCodeList" />
<div style="clear:both;"></div>

<div style="clear:both;width:100%;text-align:center; padding:20px 0;">
<input type="submit" class="btn btn-small btn-primary" value="选好了，提交">
</div>
</s:form>
</body>
</html>