<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="front_default"/>
<title>账户信息</title>
</head>
<body>
<div class="page">
   <div class="content">
   <div class="list-block">
    <ul>
      <li class="item-content">
        <div class="item-inner">
          <div class="item-title">姓名：</div>
          <div class="item-after">${user.name }</div>
        </div>
      </li>
      <li class="item-content">
        <div class="item-inner">
          <div class="item-title">会员编号：</div>
          <div class="item-after">${user.sn }</div>
        </div>
      </li>
      <li class="item-content">
        <div class="item-inner">
          <div class="item-title">剩余积分：</div>
          <div class="item-after">${user.integral }</div>
        </div>
      </li>
    </ul>
  </div>
  </div>
</div>

<script type="text/javascript">
$(function() {
	 
})
</script>
</body>
</html>