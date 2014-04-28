<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
     java.util.Enumeration e;
     System.out.println("*****************attribute names**************");
     for (e = request.getAttributeNames() ; e.hasMoreElements() ;) {
        String name = e.nextElement().toString();         
        System.out.println(name);
        System.out.println(request.getAttribute(name));
     }
     System .out.println("*****************parameter names**************");
     for (e = request.getParameterNames() ; e.hasMoreElements() ;) {
        String name = e.nextElement().toString();         
        System.out.println(name);
        System.out.println(request.getParameter(name));
     }
    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<meta http-equiv="imagetoolbar" content="no">
<title>养车客商家后台：汽车品牌管理</title>
<script src="../scripts/jquery-1.11.0.js"></script>
<script language="javascript">
function f_selServiceCat(sel) {
	$('#selCategory').val(sel);
	//alert($('#selCategory').val());
	document.forms[0].submit();
}
function f_selService(sel) {
	$('#eService_providerProduct_service_id').val(sel);
	document.forms[0].submit();
}
function f_selBrand(sel) {
	$('#eService_providerProduct_brand_id').val(sel);
	document.forms[0].submit();
}
function f_selName(sel) {
	$('#eService_providerProduct_name').val(sel);
	//alert($('#eService_providerProduct_name').val());
	document.forms[0].submit();
}
function f_updateprice(sel) {
    alert(sel);

}
</script>

</head>