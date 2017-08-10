<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="front_default"/>
<title>编号认证</title>
<script type='text/javascript' src="${ctxStatic}/vue/vue.js"></script>
</head>
<body>
<div class="page" id="page" v-cloak>
<!-- 
<header class="bar bar-nav">
  <h1 class="title">编号认证</h1>
</header> -->
<div class="content">
	<div class="list-block">
    <ul>
      <!-- Text inputs -->
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">会员编号：</div>
            <div class="item-input">
              <input type="hidden" v-model='callback'>
			  <input type="tel" v-model="sn">
            </div>
          </div>
        </div>
      </li>
     
    </ul>
  </div>
  <div class="content-block">
    <div class="row">
      <div class="col-100"><a href="#" @click="login" class="button button-big button-fill button-success">下一页</a></div>
    </div>
  </div>
</div>
</div>
<script type="text/javascript">
new Vue({
	el:'#page',
	data:{
		callback: '${callback }',
		sn: '',
	},
	beforeCreate: function(){
		if(self != top){
			top.location.href = self.location.href;
		}
	},
	methods: {
		login: function () {
			if(!this.sn){
				$.toast("请输入会员编号");
				return false
			}
			$.showIndicator();
            var data = "sn="+this.sn+"&callback="+this.callback;
			$.ajax({
				type: "POST",
			    url: "${ctx}/user",
			    data: data,
			    dataType: "json",
			    success: function(ret){
			    	$.hideIndicator();
					if(ret.code == 200){//登录成功
                    	parent.location.href =ret.data.callback;
					}else{
						$.toast(ret.message);
					}
				}
			});
		}
	}
});
$.init();
</script>
</body>
</html>