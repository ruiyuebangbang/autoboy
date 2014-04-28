<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<title>养车客商家后台：设置店铺信息</title>
<script src="../scripts/jquery-1.11.0.js"></script>
</head>
<body>
	<div class="pcontent-title">
		<h1>商家店铺信息设置</h1>
	</div>
	<div>
		<s:form action="uploadImage" method="post"
			enctype="multipart/form-data">
			<div style="float: left; margin: 0 20px 0 0;">
				<input type="radio" name="selImage" value="logo" id="loaddz"
					onchange="javascript:changeUpload(this);"
					<s:if test='null==picType||picType=="logo"'>checked="true"</s:if>>
				<label for="loaddz">上传店招</label>
			</div>
			<div>
				<input type="radio" name="selImage" value="normal" id="loadpic"
					onchange="javascript:changeUpload(this);"
					<s:if test='null!=picType&&picType!="logo"'>checked="true"</s:if>>
				<label for="loadpic">上传店铺图片</label>
			</div>
			
				<s:hidden name="provider.ID" />
				<s:file name="image" onchange="javascript:$('form').submit();" />
		</s:form>
	</div>
	

	<div class="changePtohoBox" id="dzDom"
		<s:if test='null==picType||picType=="logo"'>style="display:block"</s:if>
		<s:else>style="display:none"</s:else>>

		<div id="dragable1"	style="position: absolute; left: 0; top: 0; z-index: 33; width: 260px; height: 200px; background-color: #fff; cursor: url('http://static5.gewara.com/css/home/href.cur'), default; *cursor: url('http://static5.gewara.com/css/home/href.cur'); filter: alpha(opacity = 10); opacity: 0.1;"></div>
			<img id="corp" style="position: relative; left: 0px; top: 0px;"	src="<%=request.getContextPath()%>/uploadimage/<s:property value="provider.LOGO"/>">
	</div>

	<!-- 上传店面环境图片 -->
	<div id="injectDom"
		<s:if test='null==picType||picType=="logo"'>style="display:none"</s:if>
		<s:else>style="display:block"</s:else>>
		<div
			style="width: 585px; height: 350px; border: 1px solid rgb(240, 240, 240); background-color: rgb(255, 255, 255); background-position: initial initial; background-repeat: initial initial;">
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG1"/>'>
			</div>
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG2"/>'>
			</div>
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG3"/>'>
			</div>
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG4"/>'>
			</div>
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG5"/>'>
			</div>
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG6"/>'>
			</div>
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG7"/>'>
			</div>
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG8"/>'>
			</div>
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG9"/>'>
			</div>
			<div class="mycur"
				style="width: 100px; height: 100px; float: left; margin: 5px; background-color: #f5f5f5; overflow: hidden; position: relative; border: 3px solid rgb(254, 254, 254); background-position: initial initial; background-repeat: initial initial;">
				<img
					src='<%=request.getContextPath()%>/uploadimage/<s:property value="provider.IMG10"/>'>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		function changeUpload(obj) {

			if (obj.checked && obj.id == "loaddz") {
				//$("#uploadImage_isLogo").val("true");
				$("#injectDom").css("display", "none");
				$("#dzDom").css("display", "block");
			} else {
				//$("#uploadImage_isLogo").val("false");
				$("#dzDom").css('display', 'none');
				$("#injectDom").css('display', 'block');

			}
			return true;

		}
	</script>
</body>
</html>