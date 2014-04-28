<%@ page contentType="text/html; charset=utf-8"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="CN">
<meta name="description" content="专业汽车保养、维修服务平台">
<meta name="keywords" content="">

<title></title>
<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/main.css" type="text/css">
<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/question.css" type="text/css">
</head>

<body>
<div class="yck-box content">
	<div class="qa-main" style="width:670px;">
		<h2 style="margin:10px 0 10px 8px;">我要提问</h2>
		<div class="qa-part-form">
			<form name="ask" method="post" action="./ask">
				<table class="qa-form-tall-table">
					<tbody>
						<tr>
							<td class="qa-form-tall-label">一句话描述问题:
							</td>
						</tr>
						<tr>
							<td class="qa-form-tall-data">
								<input name="title" id="title" 	autocomplete="off" onchange="qa_title_change(this.value);"
								type="text" value="" class="qa-form-tall-text"></td>
						</tr>
						<tr>
							<td class="qa-form-tall-data"><span id="similar"></span></td>
						</tr>
						<tr>
							<td class="qa-form-tall-label">对问题进行详细表述（可选）:</td>
						</tr>
						<tr>
							<td class="qa-form-tall-data">
								<textarea name="a_content" style="width: 660px;height: 100px;" class="qa-form-tall-text" style="visibility: visible; display: block;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="qa-form-tall-label">添加合适标签，专家更容易找到您的提问:</td>
						</tr>
						<tr>
							<td class="qa-form-tall-data"><input name="tags" id="tags"
								autocomplete="off" onkeyup="qa_tag_hints();"
								onmouseup="qa_tag_hints();" type="text" value=""
								class="qa-form-tall-text">
								<div class="qa-form-tall-note">
									<span id="tag_examples_title" style="display: none;">Example
										tags: </span><span id="tag_complete_title" style="display: none;">Matching
										tags: </span><span id="tag_hints"></span>
								</div></td>
						</tr>
						
						<tr>
							<td class="qa-form-tall-label"><label> <input
									name="notify" id="notify"
									onclick="if (document.getElementById('notify').checked) document.getElementById('email').focus();"
									type="checkbox" value="1" checked=""
									class="qa-form-tall-checkbox"> <span id="email_shown">有用户回答本问题时，邮件通知我:</span><span
									id="email_hidden" style="display: none;">Email me if my
										question is answered or commented on</span>
							</label></td>
						</tr>
					</tbody>
					<tbody id="email_display">
						<tr>
							<td class="qa-form-tall-data"><input name="email" id="email"
								type="text" value="" class="qa-form-tall-text">
								<div class="qa-form-tall-note"></div></td>
						</tr>
					</tbody>
				</table>



			</form>
		</div>
	</div>
</div>
</body>
</html>
