<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宅食网上订餐系统 管理员界面</title>
<script src="resources/vendors/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
 <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="resources/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="resources/assets/styles.css" rel="stylesheet" media="screen">
        <script type="text/javascript" src="resources/bootstrap/js/bootstrap.js" ></script>
        <link href="resources/css/labs.css" media="screen" rel="stylesheet" type="text/css">
         <script src="resources/js/jquery.raty.js" type="text/javascript"></script>
        <script src="resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <link href="resources/vendors/jGrowl/jquery.jgrowl.css" rel="stylesheet" media="screen">
        <script src="resources/vendors/jGrowl/jquery.jgrowl.js"></script>
        <script src="resources/nice-validator/dist/jquery.validator.js?local=zh-CN"></script>
<script>
	$(function(){
		getAllStore();
	});
	
function getAllStore(){
	$.ajax({
		type : "get",
		url : "getAllStore",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			$("#getAllStore").empty();
			var tr = $('<tr></tr>');
		    var tbody = $('<tbody></tbody>');
		    var table = $('<table></table>');
		    $("#getAllStore").append("<tr><th>店铺名称</th><th>店铺图片</th><th>店铺资格证</th><th>店铺状态</th><th>店铺操作</th></tr>")
		    for(var i=0;i< Object.keys(result).length;i++){
		    	var status ="";
		    	switch(result[i].sStatus){
		    		case 0:status="申请中";break;
		    		case 1:status="申请成功";break;
		    		case 2:status = "申请失败";break;
		    		case 3:status ="正常运营";break;
		    		case 4:status ="暂停营业";break;
		    	}
		    	if(result[i].sStatus!=0){
		    		continue;
		    	}
		    	tr.append('<td>' + result[i].sName + '</td>');
		    	tr.append('<td><img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="' + result[i].sImg+ '"></td>');
		    	tr.append('<td><a onclick="showImg(\''+result[i].sCertimg+'\')" class=" tooltip-bottom" data-original-title="查看大图" ><img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="' + result[i].sCertimg+ '"> </td>');
		    	tr.append('<td>' + status + '</td>');
		    	tr.append('<td><input type="button" class="btn btn-primary" value="通过" onclick="handle('+result[i].sId+',1)"><input type="button" class="btn btn-danger" value="不通过" onclick="handle('+result[i].sId+',2)"></td>');
		    	$('#getAllStore ').append(tr);
		    	tr=$('<tr></tr>');
		    }
		    $('.tooltip-bottom').tooltip({ placement: 'bottom' });	
		}
	});
}
function handle(id,status){
	$.ajax({
		type : "get",
		url : "changeStoreStatus",
		data:"sId="+id+"&sStatus="+status ,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		success : function(result) {
			if(result==false){
				$("#jgrowl").jGrowl("审核未通过");
			}
			$("#jgrowl").jGrowl("审核通过");
			getAllStore();
		}
	});
}
function showImg(img){
	$("#picture").empty();
	$("#showImgModal").modal("show");
	$("#picture").append('<img data-src="holder.js/260x180"  style="width: 600; height: 500px;" src="' + img+ '">')
}
</script>
</head>
<body>
	<div id="jgrowl" class="jGrowl bottom-left"></div>
	<div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" onclick="getAllStore()"><img src="resources/images/logo.png" style="height: 30px;" alt=""></a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li >
                                <a onclick="getUserInfo()" role="button" > <i class="icon-user"></i> <%=session.getAttribute("userName")%></a>
                            </li>
                            <li>
                            <button class="btn btn-danger" onclick="{location.href='logout';}"><i class="icon-remove icon-white"></i></button>
                        	</li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
	<div class="container-fluid">
        <div class="row-fluid">
        	<div class="span12 content" id="content">
				<div class="row-fluid">
            	<!-- block -->
            	<div class="block" >
                	<div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">所有申请</div>
                	</div>
                <div class="block-content collapse in" >
                	 <table class="table table-striped" id="getAllStore"></table>
                </div>
            </div>
        </div>
	</div>
		</div>
            <!-- picture modal -->
            <div id="showImgModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>店铺资格证书</h3>
			</div>
		<div class="modal-body" id="picture" >
			
		</div>
	</div>
	<!--picture model -->
    </div>
</body>
</html>