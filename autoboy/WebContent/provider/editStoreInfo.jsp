<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>

<head>

<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">
<title>养车客商家后台：设置店铺信息</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/mootools.js"></script>
<style type="text/css">
.changePtohoBox {
	padding: 10px 10px 10px 300px;
	
	clear: both;
}

.changePtohoBoxInner {
	float: left;
	width: 280px;
	margin-left: -280px;
	_margin-left: -140px;
	height: 320px;
	overflow: hidden;
}

.changeImageBox {
	height: 200px;
	width: 260px;
	overflow: hidden;
	position: relative;
	z-index: 3;
	background: #ccc;
}

.controlCursor {
	height: 186px;
	width: 120px;
	overflow: hidden;
	float: left;
	background: url(<%=request.getContextPath()%>/image/changebox.jpg)	no-repeat;
	position: relative;
}

.bigLink {
	height: 20px;
	line-height: 20px;
	margin-top: 10px
}

.bigLink a,.bigLink input {
	display: inline-block;
	height: 20px;
	padding: 0 10px;
	background: #7092da;
	font-size: 14px;
	text-decoration: none !important;
	color: #fff;
	margin-right: 10px;
	cursor: pointer;
	border: 0
}

.controlCursor input {
	border: 0px;
	background: transparent;
}

.controlCursor label,.sbbutton {
	display: inline-block;
	width: 120px;
	height: 33px;
	position: absolute;
	top: 0px;
	cursor: pointer;
}

.controlCursor label input {
	visibility: hidden;
	width: 120px;
	height: 33px;
}

.controlCursor .sbbutton {
	bottom: 0px;
	top: auto;
}

#headlogo {
	filter: Alpha(opacity = 0);
	opacity: 0;
	cursor: pointer;
	font-size: 28px;
	outline: none;
	hide-focus: expression(this.hideFocus = true);
	left: -295px;
	top: 0px;
	position: absolute;
	cursor: pointer;
}

.controlCursor a {
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	display: block;
	height: 32px;
	line-height: 32px;
	text-align: center;
	text-decoration: none;
}

.dragging {
	border: solid 2px red;
}
.ul-80 li {
	float:none;
	padding-left:30px;
}
</style>

</head>

<body class="logged-out ytype" screen_capture_injected="true">
	<div id="user-info">
		<div class="pcontent-title">
			<h1>商家店铺信息设置</h1>
		</div>
		<div class="tab_menu" style="margin:10px 16px;">
			<div style="float: left;margin: 0 20px 0 0;">
				<label style="font-weight: bold">上传店招</label>
			</div>
			<div>
				<div id="provider-dz" style="clear: both;margin: 10px 0; background-color: #f5f5f5;float:left;" >
					<img src='${pageContext.request.contextPath}/<s:if test="provider.LOGO == null">image/b_licence_default.png</s:if><s:else>uploadimage/provider/<s:property value="provider.LOGO" /></s:else>' style="width:230px; height: 123px;"/>
				</div>
				<div style="float: left;margin-top: 106px;margin-left: 10px;"><a href=""  class="btn btn-small btn-primary" id="select-0">更换店招</a></div>
			</div>
		</div>
		
			
		<!-- 上传店面环境图片 -->
		<div style="padding:20px;clear:both;">
		<form action="<%=request.getContextPath()%>/ajax/common/uploadProviderImgs.action" method="post" enctype="multipart/form-data" id="form-batch">
			<div>
				<label style="font-weight: bold">上传店铺展示图片</label><span style="display: inline-block; margin-left: 10px; ">（支持批量上传，最多上传5张图片，图片大小不得超过2M，格式为（.jpg	| .gif | .png | .jpeg））</span>
				
			</div>
			<!-- 批量上传 begin -->
			<div  id="batchdiv" style="width: 700px; height: 340px; background-color: #f5f5f5; padding: 5px; margin-top: 10px; ">
				<div style="width: 100%; height: 100%;">
					
					<div id="upload-status" style="margin:10px;">
						<p style="width: 260px;float: left;">
							<a href="#" id="file-browse" class="btn btn-small">选择图片</a> 
							<a href="#" id="file-clear" class="btn btn-small">取消选择</a> 
							<a href="#" id="file-upload" class="btn btn-small btn-primary">上传图片</a>
						</p>
						<div>
							<span class="overall-title"></span>
							<span class="progress overall-progress"></span>
							<span class="progress-text"></span>
						</div>
					</div>
					<ul id="pic-list" style="width: 700px; height: 300px; clear:both;border: 1px solid rgb(240, 240, 240); background-color: rgb(255, 255, 255);">
					</ul>	
				</div>
			</div>
			<!-- 批量上传 end -->
			</form>
		</div>
		<!-- 上传店面环境图片 -->
	</div>


<link rel="stylesheet" type="text/css" href="<s:url value='/css/Roar.css' />">
<script type="text/javascript" src="<s:url value='/scripts/Swiff.Uploader.js' />"></script>
<script type="text/javascript" src="<s:url value='/scripts/FancyUpload2.js' />"></script>
<script type="text/javascript" src="<s:url value='/scripts/Fx.ProgressBar.js' />"></script>
<script type="text/javascript" src="<s:url value='/scripts/Roar.js' />"></script>

<script type="text/javascript">
window.addEvent('domready', function() {
	 
	var log = new Roar({
		container: $('user_avatar'),
		position: 'topRight',
		duration: 5000
	});
 
	var link = $('select-0');
	var linkIdle = link.get('html');
 
	function linkUpdate() {
		if (!swf.uploading) return;
		var size = Swiff.Uploader.formatUnit(swf.size, 'b');
		link.set('html', '<span class="small">' + swf.percentLoaded + '% of ' + size + '</span>');
	}
 
	// Uploader instance
	var swf = new Swiff.Uploader({
		path: '<%=request.getContextPath()%>/css/uploader.swf',
		url: '<%=request.getContextPath()%>/ajax/common/uploadDZ.action',
		verbose: true,
		queued: false,
		multiple: false,
		target: link,
		instantStart: true,
		typeFilter: {
			'Images (*.jpg, *.jpeg, *.gif, *.png)': '*.jpg; *.jpeg; *.gif; *.png'
		},
		fileSizeMax: 2 * 1024 * 1024,
		onSelectSuccess: function(files) {
			//if (Browser.Platform.linux) window.alert('Warning: Due to a misbehaviour of Adobe Flash Player on Linux,\nthe browser will probably freeze during the upload process.\nSince you are prepared now, the upload will start right away ...');
			//log.alert('Starting Upload', 'Uploading <em>' + files[0].name + '</em> (' + Swiff.Uploader.formatUnit(files[0].size, 'b') + ')');
			this.setEnabled(false);
		},
		onSelectFail: function(files) {
			log.alert('<em>' + files[0].name + '</em> 上传失败!', '请更换小于2M的图片上传.');
		},
		appendCookieData: true,
		onQueue: linkUpdate,
		onFileComplete: function(file) {
 			if (file.response.error) {
				log.alert('上传失败', '上传 <em>' + this.fileList[0].name + '</em> 失败, 请重新上传.');
			} else {
				var url = "<%=request.getContextPath()%>/uploadimage/provider/"+JSON.decode(file.response.text, true).hash; // secure decode
				$('provider-dz').set('src', url);			
			}
 
			file.remove();
			this.setEnabled(true);
		},
		onComplete: function() {
			link.set('html', linkIdle);
		}
	});
 
	// Button state
	link.addEvents({
		click: function() {
			return false;
		},
		mouseenter: function() {
			this.addClass('hover');
			swf.reposition();
		},
		mouseleave: function() {
			this.removeClass('hover');
			this.blur();
		},
		mousedown: function() {
			this.focus();
		}
	});
 
});

</script>
<script type="text/javascript">

window.addEvent('domready', function() { 
	var providerImg = "<%=request.getContextPath()%>\/uploadimage/provider/";
	var up = new FancyUpload2($('upload-status'), $('pic-list'), { // options object
		// we console.log infos, remove that in production!!
		verbose: true,
		
		// url is read from the form, so you just have to change one place
		url: $('form-batch').action,
		
		// path to the SWF file
		path: '<%=request.getContextPath()%>/css/uploader.swf',
		
		// remove that line to select all files, or edit it, add more items
		typeFilter: {
			'Images (*.jpg, *.jpeg, *.gif, *.png)': '*.jpg; *.jpeg; *.gif; *.png'
		},
		
		// this is our browse button, *target* is overlayed with the Flash movie
		target: 'file-browse',
		
		// graceful degradation, onLoad is only called if all went well with Flash
		onLoad: function() {
			//$('demo-status').removeClass('hide'); // we show the actual UI
			//$('demo-fallback').destroy(); // ... and hide the plain form
			
			// We relay the interactions with the overlayed flash to the link
			this.target.addEvents({
				click: function() {
					return false;
				},
				mouseenter: function() {
					this.addClass('hover');
				},
				mouseleave: function() {
					this.removeClass('hover');
					this.blur();
				},
				mousedown: function() {
					this.focus();
				}
			});

			// Interactions for the 2 other buttons
			
			$('file-clear').addEvent('click', function() {
				up.remove(); // remove all files
				return false;
			});

			$('file-upload').addEvent('click', function() {
				up.start(); // start upload
				return false;
			});
		},
		
		// Edit the following lines, it is your custom event handling
		
		/**
		 * Is called when files were not added, "files" is an array of invalid File classes.
		 * 
		 * This example creates a list of error elements directly in the file list, which
		 * hide on click.
		 */ 
		onSelectFail: function(files) {
			files.each(function(file) {
				
				new Element('li', {
					'class': 'validation-error',
					html: file.validationErrorMessage || file.validationError,
					title: MooTools.lang.get('FancyUpload', 'removeTitle'),
					events: {
						click: function() {
							this.destroy();
						}
					}
				}).inject(this.list, 'top');
				
			}, this);
		},
		
		/**
		 * This one was directly in FancyUpload2 before, the event makes it
		 * easier for you, to add your own response handling (you probably want
		 * to send something else than JSON or different items).
		 */
		onFileSuccess: function(file, response) {
			var json = new Hash(JSON.decode(response, true) || {});
			
			if (json.get('status') == '1') {
				file.element.addClass('file-success');
				//file.info.set('html', '<strong>Image was uploaded:</strong> ' + json.get('width') + ' x ' + json.get('height') + 'px, <em>' + json.get('mime') + '</em>)');
				var imgurl = providerImg + json.get('hash');
				//file.element.setHTML("<img src='"+imgurl+"' width='210px' height='130px'>");
				file.element.getFirst().empty();
				new Element('img', {'src': imgurl, 'width':'210px','height':'130px'}).inject(file.element.getFirst(),'inside');
				
			} else {
				file.element.addClass('file-failed');
				//file.info.set('html', '<strong>An error occured:</strong> ' + (json.get('error') ? (json.get('error') + ' #' + json.get('code')) : response));
			}
		},
		
		/**
		 * onFail is called when the Flash movie got bashed by some browser plugin
		 * like Adblock or Flashblock.
		 */
		onFail: function(error) {
			switch (error) {
				case 'hidden': // works after enabling the movie and clicking refresh
					alert('To enable the embedded uploader, unblock it in your browser and refresh (see Adblock).');
					break;
				case 'blocked': // This no *full* fail, it works after the user clicks the button
					alert('To enable the embedded uploader, enable the blocked Flash movie (see Flashblock).');
					break;
				case 'empty': // Oh oh, wrong path
					alert('A required file was not found, please be patient and we fix this.');
					break;
				case 'flash': // no flash 9+ :(
					alert('To enable the embedded uploader, install the latest Adobe Flash plugin.')
			}
		}
		
	});
	
});

	</script>
</body>
</html>
