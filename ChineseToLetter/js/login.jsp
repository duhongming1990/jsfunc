 <%@ page import = "java.util.*" contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib uri="/bean" prefix="bean" %>
<%@ taglib uri="/html" prefix="html" %>
<%@ taglib uri="/logic" prefix="logic" %>
<%@ page import = "cn.com.chx.util.Login"%>
<%@ taglib uri="/websitetag" prefix="websitetag" %>
<%@ page import="cn.com.chx.ou.util.*,cn.com.chx.util.*" %>
<% 
   Login login = (Login) request.getSession(false).getAttribute("CHX-LOGIN-FORM");
   if(login!=null){
     response.sendRedirect("dispatch.jsp");
   }
%>
<!doctype html>
<html>
<head>
<title>登录</title>
<link href="css/login.css" type="text/css" rel="stylesheet">
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<script type="text/javascript" src="http://1.beautyimpress.sinaapp.com/jquerycdn/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/jQuery.Hz2Py-min.js"></script>
</head>

<body>
<div class="warp login-box">
  <div class="login-swf">
    <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="740" height="280">
      <param name="movie" value="images/admin3.swf">
      <param name="quality" value="high">
      <param name="wmode" value="opaque">
      <param name="swfversion" value="8.0.35.0">
      <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
      <param name="expressinstall" value="Scripts/expressInstall.swf">
      <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
      <!--[if !IE]>-->
      <object type="application/x-shockwave-flash" data="images/admin3.swf" width="740" height="280">
        <!--<![endif]-->
        <param name="quality" value="high">
        <param name="wmode" value="opaque">
        <param name="swfversion" value="8.0.35.0">
        <param name="expressinstall" value="Scripts/expressInstall.swf">
        <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
        <div>
          <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
          <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
        </div>
        <!--[if !IE]>-->
      </object>
      <!--<![endif]-->
    </object>
  </div>
  <div class="login-form">
  	<% if (login==null) {
    String sCmd = (String)request.getAttribute("cmd");
	 if (sCmd==null) sCmd = "";
  %>
<script type="text/javascript">
$(function (){
	$("#usercode_py").live("keyup keydown change blur",function (){
		$("#usercode").val($(this).toPinyin());
	});
});
</script>
    <form name="LoginForm"  action="/root/LoginAction.do"  method="POST">
    	<input name="actionType" type="hidden" value="login"/>
    	<input name="cmd" type="hidden" value="<%=sCmd%>"/>
      <div class="login-item">
        <input name="usercode_py" type="text" class="login-text" id="usercode_py" />
		 <input name="usercode" type="hidden" class="login-text" id="usercode" />
      </div>
      <div class="login-item">
        <input name="pwd" type="password" class="login-text" id="pwd"/>
      </div>
      <div class="login-btn">
        <input type="submit" name="button" id="button" value="" class="login-btn">
        <input type="image" alt="重置"  width="60" height="21" align="center" src="images/btn_cz.jpg" onclick="javascript:document.forms['LoginForm'].reset(); return false;" />
      </div>	
    </form>
    <%String error =(String)request.getAttribute("error");
             if(error!=null&&!error.equals("")){%>
          <div style="color: red;"><%=error %></div>
          <% }%>
    <%}%>
  </div>
</div>
<script type="text/javascript">
swfobject.registerObject("FlashID");
</script>
</body>
</html>
