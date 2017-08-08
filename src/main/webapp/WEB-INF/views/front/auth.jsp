<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="front_default"/>
<title>认证</title>
</head>
<body>
<div class="page">
<c:if test="${not empty message}">
<script type="text/javascript">$.toast('${message}');</script>
</c:if>
<header class="bar bar-nav">
  <h1 class="title">编号认证</h1>
</header>
<div class="content">
<form action="${ctx }/user" method="post" id="myform">
	<div class="list-block">
    <ul>
      <!-- Text inputs -->
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">会员编号</div>
            <div class="item-input">
              <input type="hidden" name="callback" value="${callback }">
			<input type="tel" name="sn" id="sn">
            </div>
          </div>
        </div>
      </li>
     
    </ul>
  </div>
  <div class="content-block">
    <div class="row">
      <div class="col-100"><a href="#" id="submitBtn" class="button button-big button-fill button-success">下一页</a></div>
    </div>
  </div>

</form>
</div>
</div>
<script type="text/javascript">
$(function(){
	$("#submitBtn").on("click",function(){
		if($("#sn").val()==''){
			$.toast("请输入会员编号");
			return false
		}else{
			$("#myform").submit();
		}
	})
});
</script>
</body>
</html>