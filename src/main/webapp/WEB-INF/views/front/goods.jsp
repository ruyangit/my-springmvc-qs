<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="front_default"/>
<title>商品信息</title>
</head>
<body>
<div class="page-group">
    <div id="page-infinite-scroll-bottom" class="page">
  <div class="content infinite-scroll" data-distance="100" style="margin-bottom: 50px;">
    <div id="list-content">
      
    </div>
    <!-- 加载提示符 -->
    <div class="infinite-scroll-preloader">
      <div class="preloader">
      </div>
    </div>
  </div>
  <nav class="bar bar-tab">
			<a class="create-popup tab-item external">查看积分</a>
		</nav>
</div>

    </div>
<script type="text/javascript">
$(function() {
	
	//无限滚动
	  $(document).on("pageInit", "#page-infinite-scroll-bottom", function(e, id, page) {
	    var loading = false;
	    // 每次加载添加多少条目
	    var pageNo = 1;
	    var pageSize = 5;
	    // 最多可加载的条目
	    var maxItems = 0;
	    var lastIndex = $('#list-content div.card').length;
	    
	    
	    function addItems(pageNo,cb) {
	    	
	    	var data = "pageNo="+pageNo+"&pageSize="+pageSize;
			$.ajax({
				type: "GET",
			    url: "${ctx}/goods/list",
			    data: data,
			    dataType: "json",
			    success: function(ret){
					 maxItems = ret.data.count;
					 // 生成新条目的HTML
				      var html = '';
				      for (var i = 0; i <ret.data.list.length; i++) {
				    	var item = ret.data.list[i];
				        //html += '<li class="item-content"><div class="item-inner"><div class="item-title">新条目</div></div></li>';
					  	if(item.goodsImg){
					    	html += '<div onclick="gotoUrl(\'${ctx}/goods/detail?id='+item.id+'\')" class="card demo-card-header-pic"><div valign="bottom" class="card-header color-white no-border no-padding"><img class="card-cover" src="'+item.goodsImg+'" alt=""></div>';
					        //html += '<div class="card demo-card-header-pic"><div valign="bottom" class="card-header color-white no-border no-padding"><img class="card-cover" src="'+item.goodsImg+'" alt=""></div><div class="card-content"><div class="card-content-inner"><p class="color-gray" style="position: relative">商品编号：'+item.goodsSn+'<span style="position: absolute;right: 0px;"><strong class="color-danger">'+item.integral+'</strong> 积分</span></p><p>'+item.goodsName+'</p></div></div><div class="card-footer"><a href="#" class="link color-gray">库存：'+item.goodsNumber+'</a>';
				        }else{
					        html += '<div onclick="gotoUrl(\'${ctx}/goods/detail?id='+item.id+'\')" class="card demo-card-header-pic"><div class="card-content"><div class="card-content-inner"><p>'+item.goodsName+'</p></div></div>';
				        }
					    //if(item.goodsImg){
					   //     html += '<div class="card demo-card-header-pic"><div valign="bottom" class="card-header color-white no-border no-padding"><img class="card-cover" src="'+item.goodsImg+'" alt=""></div><div class="card-content"><div class="card-content-inner"><p class="color-gray" style="position: relative">商品编号：'+item.goodsSn+'<span style="position: absolute;right: 0px;"><strong class="color-danger">'+item.integral+'</strong> 积分</span></p><p>'+item.goodsName+'</p></div></div><div class="card-footer"><a href="#" class="link color-gray">库存：'+item.goodsNumber+'</a>';
				       // }else{
					    //    html += '<div class="card demo-card-header-pic"><div class="card-content"><div class="card-content-inner"><p>'+item.goodsName+'</p><p class="color-gray" style="position: relative">商品编号：'+item.goodsSn+'<span style="position: absolute;right: 0px;"><strong class="color-danger">'+item.integral+'</strong> 积分</span></p></div></div><div class="card-footer"><a href="#" class="link color-gray">库存：'+item.goodsNumber+'</a>';
				        //}
				        //if(item.goodsNumber<=0){
					    //    html += '<a href="#" class="link color-gray">暂无库存</a>'
				       // }else{
					     //   html += '<a href="${ctx}/goods/detail?id='+item.id+'" class="link">兑换</a>'
				       // }
				        //html += '</div></div>'
				        html += '</div>'
				      }
				      cb(html);
				}
			});
	    	
	      
	    }
	    
	    addItems(1,function(html){
	    	$("#list-content").empty();
	    	$('#list-content').append(html);
	    	lastIndex = $('#list-content div.card').length;
	        if (lastIndex >= maxItems) {
	          // 加载完毕，则注销无限加载事件，以防不必要的加载
	          $.detachInfiniteScroll($('.infinite-scroll'));
	          // 删除加载提示符
	          $('.infinite-scroll-preloader').hide();
	          return;
	        }
	    })
	    $(page).off('infinite');
	    $(page).on('infinite', function() {
	    	 $('.infinite-scroll-preloader').show();
	   	      // 如果正在加载，则退出
	   	      if (loading) return;
	   	      // 设置flag
	   	      loading = true;
	   	      // 模拟1s的加载过程
	   	      setTimeout(function() {
	   	        // 重置加载flag
	   	        loading = false;
	   	     	lastIndex = $('#list-content div.card').length;
		        if (lastIndex >= maxItems) {
		          // 加载完毕，则注销无限加载事件，以防不必要的加载
		          $.detachInfiniteScroll($('.infinite-scroll'));
		          // 删除加载提示符
		          $('.infinite-scroll-preloader').hide();
		          return;
		        }
		        ++pageNo;
	   	        addItems(pageNo,function(html){
	   	        	$('#list-content').append(html);
	   	        });
	   	        // 更新最后加载的序号
	   	        $.refreshScroller();
	   	      }, 1000);
	   	    });
	   
	  });
	
	
	  
	 $(".create-popup").on("click",function(){
		 $.alert('我的积分：${user.integral }<br/><span style="color:#ff9630">推荐订婚礼即得500积分</span>',['温馨提示']);
	 });
	
	  $.init();
})
function gotoUrl(url){
		location.href=url;
	}
</script>
</body>
</html>