<%@ page contentType="text/html; charset=utf-8"%>

<html>
   
<head>
	
	<meta name="description" content="专业汽车保养、维修服务平台">
	<meta name="keywords" content="">
	<title>修改管理员密码</title>
  	<link rel="StyleSheet" href="css/main.css" type="text/css">
  	
</head>

<body class="logged-out ytype" screen_capture_injected="true">
<div id="user-info">
<div class="pcontent-title"><h1>修改管理员密码</h1></div>
<form id="shop_form" action="?act=submit" method="post" status="-1">
    <table class="form_table mb40">
      <tbody>
        <tr>
          <td class="td_label w150">商户ID</td>
          <td>
            <input type="text" maxlength="10" readonly="readonly" disabled="disabled" class="td_txt w190" value="100159">
          </td>
        </tr>
        <tr>
          <td class="td_label w150">商户帐号</td>
          <td>
            <input type="text" maxlength="50" readonly="readonly" disabled="disabled" class="td_txt w190" value="bobo@hotmail.com">
          </td>
        </tr>
        <tr>
          <td class="td_label w150">店名</td>
          <td>
            <input type="text" name="shop_name" maxlength="50" class="td_txt w350 not_null" value="东明维修">
            <span class="cr">*</span>
          </td>
        </tr>
        <tr>
          <td class="td_label w150">商户昵称</td>
          <td>
            <input type="text" name="nickname" maxlength="50" class="td_txt w190" value="">
          </td>
        </tr>
        <tr>
          <td class="td_label w150">负责人</td>
          <td>
            <input type="text" name="shop_header" maxlength="10" class="td_txt w190 not_null" value="kevin">
            <span class="cr">*</span>
          </td>
        </tr>
        <tr>
          <td class="td_label w150">负责人电话</td>
          <td>
            <input type="text" name="shop_header_phone" maxlength="20" class="td_txt w190 not_null" value="12345678911">
            <span class="cr">*</span>
          </td>
        </tr>
        <tr>
          <td class="td_label w150">店面区域</td>
          <td>
            <select name="city" id="city" class="not_null">
              <option value="">--请选择--</option>
              
               <option value="021" selected="selected">上海</option>
              
               <option value="023">南京</option>
              
               <option value="0512">苏州</option>
              
               <option value="0595">泉州</option>
              
            </select>
             <span class="cr">*</span>
            <select name="district" id="district">
              <option value="">--请选择--</option>
              
              <option value="02101" selected="selected">浦东新区</option>
              
              <option value="02102">徐汇区</option>
              
              <option value="02103">黄浦区</option>
              
              <option value="02104">闵行区</option>
              
              <option value="02105">闸北区</option>
              
              <option value="02106">虹口区</option>
              
              <option value="02107">杨浦区</option>
              
              <option value="02108">长宁区</option>
              
              <option value="02109">松江区</option>
              
              <option value="02110">嘉定区</option>
              
              <option value="02111">普陀区</option>
              
              <option value="02112">静安区</option>
              
              <option value="02113">宝山区</option>
              
              <option value="02114">青浦区</option>
              
              <option value="02115">金山区</option>
              
              <option value="02116">奉贤区</option>
              
            </select>
            <select name="distarea" id="distarea">
              <option value="">--请选择--</option>
              
              <option value="0210101">张江</option>
              
              <option value="0210102">世纪公园</option>
              
              <option value="0210103" selected="selected">金桥</option>
              
              <option value="0210104">陆家嘴</option>
              
              <option value="0210105">上南地区</option>
              
              <option value="0210106">塘桥</option>
              
              <option value="0210107">源深体育中心</option>
              
              <option value="0210108">康桥/周浦</option>
              
              <option value="0210110">金杨地区</option>
              
              <option value="0210111">川沙</option>
              
              <option value="0210112">三林地区</option>
              
              <option value="0210113">碧云社区</option>
              
              <option value="0210114">外高桥</option>
              
              <option value="0210115">八佰伴</option>
              
              <option value="0210116">惠南镇</option>
              
              <option value="0210117">临沂/南码头</option>
              
              <option value="0210118">东明</option>
              
              <option value="0210119">浦东机场</option>
              
              <option value="0210120">北蔡</option>
              
            </select>
          </td>
        </tr>
        <tr>
          <td class="td_label w150">店面地址</td>
          <td>
            <input type="text" name="shop_address" maxlength="100" class="td_txt w350 not_null" value="浦东金桥">
            <span class="cr">*</span>
          </td>
        </tr>
        <tr>
          <td class="td_label w150">传真</td>
          <td>
            <input type="text" name="fax" maxlength="20" class="td_txt w190" value="">
          </td>
        </tr>
        <tr>
          <td class="td_label w150">邮编</td>
          <td>
            <input type="text" name="zip_code" maxlength="20" class="td_txt w190" value="      ">
          </td>
        </tr>
        <tr>
          <td class="td_label w150">微博帐号</td>
          <td>
            <input type="text" name="weibo" maxlength="20" class="td_txt w190" value="">
          </td>
        </tr>
        <tr>
          <td class="td_label w150">QQ</td>
          <td>
            <input type="text" name="qq" maxlength="20" class="td_txt w190" value="">
          </td>
        </tr>
        <tr>
          <td class="td_label w150">MSN</td>
          <td>
            <input type="text" name="msn" maxlength="20" class="td_txt w190" value="">
          </td>
        </tr>
        <tr>
          <td class="td_label w150">店面电话</td>
          <td>
            <input type="text" name="shop_phone" maxlength="20" class="td_txt w190" value="">
          </td>
        </tr>
        <tr>
          <td class="td_label w150">Email</td>
          <td>
            <input type="text" name="email" maxlength="50" class="td_txt w190" value="">
          </td>
        </tr>
        <tr>
          <td></td>
          <td class="cr">
            注：'*' 标示内容为必填项
          </td>
        </tr>
        <!--
        <tr>
          <td></td>
          <td><a href="Forget.aspx">忘记密码</a></td>
        </tr>
        -->
        <tr>
          <td></td>
          <td>
            <div>
              <input type="submit" value="提交修改" class="mt10">
              <span class="cr" id="submit_tip"></span>
            </div>
          </td>
        </tr>
      </tbody>
    </table>   
</form>
</div>
</body>
</html>
