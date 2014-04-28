<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>上传文件</title>

<script src="/auto/scripts/jquery-1.11.0.js" type="text/javascript"></script>

<script>

function uploadImgFn(){

var del = "<a href='#this' onclick='uploadImgFnDel()' title='删除'>×</a>&nbsp;";

$('#uploadImgValue').html(del);

var imgName = $('#uploadImg').val().substr($('#uploadImg').val().lastIndexOf("\\")+1);

var imgNewName = imgName.substr(0,20);

$('#uploadImgValue').append(imgNewName);

}

function uplaodImgFnTell(){

$('#uploadImgHiddenTell').val('1');

}

function uploadImgFnDel(){

$('#uploadImg').val('');

$('#uploadImgValue').html('');

$('#uploadImgHiddenTell').val('0');

}

function update(){

if( $('#uploadImgHiddenTell').val() == '1'){

alert('上传文件');

}

else{

alert('异步交互')

}

$('#formContent').focus();

}

</script>

<style>

body a {

text-decoration:none;

color:#983c1b;

}

body a:hover {

color:#024c9f;

}

#layout{

margin:0 auto;

padding:10px;

width:500px;

border:1px solid #333;

text-align:right;

}

#formContent{

width:300px;

height:50px;

overflow:auto;

}

#uploadImg {

filter:alpha(opacity=0);

opacity:0;

width:30px;

position:relative;

z-index:98;

}

.uploadImgValue {

font-size:12px;

color:#666;

position:relative;

left:30px;

*left:5px;

}

*html .uploadImgValue {

font-size:12px;

color:#666;

position:relative;

left:65px;

}

#uploadImgTxt {

color:#983c1b;

font-size:14px;

position:relative;

left:30px;

z-index:97px;

}

*html #uploadImgTxt {

color:#983c1b;

font-size:14px;

position:relative;

left:75px;

z-index:97px;

}

#formButton{

position:relative;

z-index:99;

}

</style>

</head>

<body>

<div id="layout">

<form action="upload.html" method="post" enctype="multipart/form-data">

<p><textarea id="formContent" name="formContent" tabindex="1"></textarea></p>

<p><span id="uploadImgValue" class="uploadImgValue"></span>&nbsp;&nbsp;<span id="uploadImgTxt">图片</span>

<input type="file" name="uploadImg" value="浏览文件"  id="uploadImg" onchange="uploadImgFn();uplaodImgFnTell()" accept= "image/jpeg,image/gif,image/png" title="上传图片" onmouseover="$('#uploadImgTxt').css('color','#024c9f');" onmouseout="$('#uploadImgTxt').css('color','#983c1b');"/>

&nbsp;

<input type="button" value="加入列队" onclick="update()" id="formButton" tabindex="2"/></p>

<p><input type="hidden" id="uploadImgHiddenTell" value="0" /></p>

</form>

</div>

</body>

</html>
