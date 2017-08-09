<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="front_default"/>
<title>商品详情</title>
</head>
<body>
<div class="page" id="page-preloader">
    <div class="content" style="margin-bottom: 50px;">
   <div class="card demo-card-header-pic">
    <div valign="bottom" class="card-header color-white no-border no-padding">
      <img class='card-cover' src="${goods.goodsImg }" alt="">
    </div>
    <div class="card-content">
      <div class="card-content-inner">
        <p class="color-gray" style="position: relative">
        	商品编号： ${goods.goodsSn }
        	<span style="position: absolute;right: 0px;">
        		<strong class="color-danger">${goods.integral}</strong> 积分
        	</span>
        </p>
        <p> ${goods.goodsName }</p>
      </div>
    </div>
    <div class="card-footer">
      <a href="#" class="link color-gray">剩余库存：${goods.goodsNumber }</a>
      <a href="#" class="link zhan">赞</a>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="list-block">
    <ul>
      <li class="item-content item-link" onclick="javascript:location.href='${ctx}/user/info'">
        <div class="item-inner" style="font-size: .7rem;">
          <div class="item-title">我的积分：</div>
          <div class="item-after">${user.integral }</div>
        </div>
      </li>
    </ul>
  </div>
    </div>
  </div>
  <div class="card" >
    <div class="card-header" style="font-size: .7rem;">商品详情</div>
    <div class="card-content">
      <div class="card-content-inner">${goods.goodsDesc}</div>
      <script type="text/javascript">
      	$.each($(".card-content-inner img"),function(){
      		$(this).attr('style','width:100%')
      	})
      </script>
    </div>
    <!-- <div class="card-footer">卡脚</div> -->
  </div>
</div>
<nav class="bar bar-tab">
			<c:choose>
				<c:when test="${ buyStatus eq '1' }">
					<a  class="tab-item external">库存不足</a>
				</c:when>
				<c:when test="${ buyStatus eq '2' }">
					<a  class="tab-item external">积分不足</a>
				</c:when>
				<c:when test="${ buyStatus eq '0' }">
					<a  class="open-preloader-title tab-item external active">立即兑换</a>
				</c:when>
			</c:choose>
			
		</nav>
    </div>
<script type="text/javascript">
$(function () {
	  'use strict';
	//加载提示符
	$(document).on("pageInit", "#page-preloader", function(e, id, page) {
	$(page).on('click','.zhan', function () {
			 $.toast('赞');
	});
	  $(page).on('click','.open-preloader-title', function () {
		  
		  $.confirm('确定使用${goods.integral}积分兑换本商品吗？', function () {
			  
			  $.showIndicator();
	            var data = "id=${goods.id }";
				$.ajax({
					type: "POST",
				    url: "${ctx}/goods/exchange",
				    data: data,
				    dataType: "json",
				    success: function(ret){
				    	$.hideIndicator();
						if(ret.code == 200){//登录成功
	                    	//parent.location.href =ret.data.callback;
							$.alert("兑换成功！<br/>我们的工作人员会在3个工作日内与你联系",function(){
								window.location.reload();
							});
							
						}else{
							$.alert(ret.message);
						}
					}
				});
			  
	          
	      })
	  });
	});
	 $.init();
});
</script>
</body>
</html>