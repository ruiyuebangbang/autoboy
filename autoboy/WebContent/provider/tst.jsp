<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/mootools.js"></script>
</head>
<body>
<s:form action="uploadLogo" id="headlogoForm"
							method="post" enctype="multipart/form-data">
<s:hidden name="provider.ID"/>
<s:file name="logo"  onchange="javascript:$('headlogoForm').submit()"/>

</s:form>
</body>
</html>