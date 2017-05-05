<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宅食网上订餐系统 商家管理界面</title>
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
        <script type='text/javascript'src='resources/js/timepicki.js'></script>
        <link rel='stylesheet' type='text/css'href='resources/css/timepicki.css'/>
        <script src="resources/js/highcharts.js"></script>
<script>
$(function(){
	
	$.fn.raty.defaults.path = 'resources/images'; 	//星星图片地址
	//获取用户所属店铺
	getUserStore();
//	$("form#addStoreForm").submit(function(e){
    $('#addStoreForm').bind('valid.form', function(){
    //disable the default form submission
        event.preventDefault();
        //grab all form data  
        var formData = new FormData($(this)[0]);
        $.ajax({
            url: 'addStore',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                $("#jgrowl").jGrowl("申请成功");
                $("#applyStoreModal").modal("hide");
                getUserStore();
            },
            error: function(){
                	$("#jgrowl").jGrowl("申请失败");
            }
        });

        return false;
    
    
	});	
//	$("#modiUserInfoForm").submit(function(e){
		$('#modiUserInfoForm').bind('valid.form', function(){
	//disable the default form submission
        event.preventDefault();
        //grab all form data  
        var formData = new FormData($(this)[0]);
        $.ajax({
            url: 'modifyUserInfo',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                $("#jgrowl").jGrowl("修改个人资料成功");
               	$("#modiUserModal").modal("hide");
               	getUserInfo();
            },
            error: function(){
                $("#jgrowl").jGrowl("修改个人资料失败");
            }
        });

        return false;
		
	});
//	$("#modiStoreForm").submit(function(e){
		$('#modiStoreForm').bind('valid.form', function(){
	 //disable the default form submission
        event.preventDefault();
        //grab all form data  
        var formData = new FormData($(this)[0]);
        $.ajax({
            url: 'modifyStore',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                $("#jgrowl").jGrowl("修改成功");
               	$("#modiStoreModal").modal("hide");
               	getUserStore();
            },
            error: function(){
                $("#jgrowl").jGrowl("修改失败");
            }
        });

        return false;
	});
	//	$("#modiStoreForm").submit(function(e){
		$('#modiStoreImgForm').bind('valid.form', function(){
	 //disable the default form submission
        event.preventDefault();
        //grab all form data  
        
        var formData = new FormData($(this)[0]);
        $.ajax({
            url: 'modifyStoreImg',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                $("#jgrowl").jGrowl("修改成功");
               	$("#modiStoreImgModal").modal("hide");
               	getUserStore();
            },
            error: function(){
                $("#jgrowl").jGrowl("修改失败");
            }
        });

        return false;
	});
	$('#modiFoodImgForm').bind('valid.form', function(){
	 //disable the default form submission
        event.preventDefault();
        //grab all form data  
        var sid = $("#mpfsid").val();
        var formData = new FormData($(this)[0]);
        $.ajax({
            url: 'modifyFoodImg',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                $("#jgrowl").jGrowl("修改图片成功");
               	$("#modiFoodImgModal").modal("hide");
               	enterStore(sid);
               	
            },
            error: function(){
                $("#jgrowl").jGrowl("修改图片失败");
            }
        });

        return false;
	});
	$("#changepwdForm").submit(function(e){
//	$('#addStoreForm').bind('valid.form', function(){
		var oPwd = $("#oPwd").val();
		var nPwd = $("#nPwd").val();
		$.ajax({
			type:"post",
			data:"oPwd="+oPwd+"&nPwd="+nPwd,
			url:"modifyPwd",
			success:function(data){
				if(data==true){
					$("#jgrowl").jGrowl("修改成功");
					$("#changepwdModal").modal("hide");
				}else{
					$("#jgrowl").jGrowl("修改失败");
				}
			}
		});
	});
	//修改菜品提交拦截
//	$("form#modifyForm").submit(function(e){
    $('#modifyForm').bind('valid.form', function(){     
         //disable the default form submission
        event.preventDefault();
        //grab all form data  
        var formData = new FormData($(this)[0]);
		var sid = $("#mfsid").val();
        $.ajax({
            url: 'modifyFood',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                $("#jgrowl").jGrowl("修改成功");
               	$("#modiFoodModal").modal("hide");
               	enterStore(sid);
            },
            error: function(){
                $("#jgrowl").jGrowl("修改失败");
            }
        });

        return false;
         
         
	});
	//添加菜品提交拦截
//	$("form#addForm").submit(function(e){
	$('#addForm').bind('valid.form', function(){
//   var formData = new FormData($(this)[0]);
//
//   $.ajax({
//      url: "addFood",
//      type: 'POST',
//      data: formData,
//      success: function (data) {
//          if(data==true){
//             	$.jGrowl("添加成功");
//             	$("#addFoodModal").modal("hide");
//             	enterStore(sid);
//             }else{
//             	$.jGrowl("添加失败");
//             } 
//      }
//  });
    
    //disable the default form submission
        event.preventDefault();
        //grab all form data  
        var formData = new FormData($(this)[0]);
		var sid = $("#afsid").val();
        $.ajax({
            url: 'addFood',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                $("#jgrowl").jGrowl("添加成功");
               	$("#addFoodModal").modal("hide");
               	enterStore(sid);
            },
            error: function(){
                	$("#jgrowl").jGrowl("添加失败");
            }
        });

        return false;
    
    
	});	
	$('#asStarttime').timepicki({increase_direction:'up'});
	$('#asEndtime').timepicki({increase_direction:'up'});
	$('#msStarttime').timepicki({increase_direction:'up'});
	$('#msEndtime').timepicki({increase_direction:'up'});
})

//获取店铺评论
function getComment(sid){
	$("#commentModal").modal("show");
	var list = new Array();
	$.ajax({
		type : "get",
		url : "getStoreComment",
		data:"sId="+sid,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		success : function(result) {
			$("#commentTable").empty();
			var tr = $('<tr></tr>');
		    var tbody = $('<tbody></tbody>');
		    var table = $('<table></table>');
		    $("#commentTable").append("<tr><th>评论用户</th><th>评论分数</th><th>评论内容</th><th>评论日期</th></tr>")
		    for(var i=0;i< Object.keys(result).length;i++){
		    	if(result==null){
		    		continue;
		    	}
		    	tr.append('<td>' + result[i].user.uName + '</td>');
		    	tr.append('<td><div id="coStar'+i+'" ></div></td>');
		    	var stars= new Object();
		    	stars.name="coStar"+i;
		    	stars.point=result[i].coPoint;
		    	list.push(stars);
		    	tr.append('<td>' + result[i].coContent + '</td>');
		    	tr.append('<td>' + result[i].coDate + '</td>');
		    	$('#commentTable ').append(tr);
		    	tr=$('<tr></tr>');
		    }
		    putStar(list);
//		    	$('#AllStore').replaceWith(table);
		}
		
	});
	
}
//获取用户所属店铺
function getUserStore(){
	$('.content').hide();
	$('#content').show();
	$('#getAllStore').contents().remove();
	$('#orderContent').hide();
	$('li').removeClass('active');
	$('#allStoreli').addClass('active');
	
	$.ajax({
		type : "get",
		url : "getUserStore",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
//			$('#Table').empty();
//			var tr = $('<tr></tr>');
//		    var tbody = $('<tbody></tbody>');
//		    var table = $('<table></table>');
//		    $('#Table ').append('<tr><th>店铺名称</th><th>店铺描述</th><th>店铺评分</th><th>店铺总销量</th><th>店铺图片</th></tr>');
//		    for(var i=0;i< Object.keys(result).length;i++){
//		    	tr.append('<td>' + result[i].sName + '</td>');
//		    	tr.append('<td>' + result[i].sDesc + '</td>');
//		    	tr.append('<td>' + result[i].sPoint + '</td>');
//		    	tr.append('<td>' + result[i].sAllsale + '</td>');
//		    	tr.append('<td>' + result[i].sImg + '</td>');
//		    	tr.append('<td><input type="button" value="enter" onclick="enterStore(' +result[i].sId  + ')"></td>');
//		    	$('#Table ').append(tr);
//		    	tr=$('<tr></tr>');
//		    }
		    
//		    	$('#AllStore').replaceWith(table);
			var str = "";
			var div0 =$('<div class="navbar navbar-inner block-header"></div>');
		    div0.append('<div class="muted pull-left">所有店铺</div>');
		    div0.append('<button class="btn btn-warning pull-right tooltip-bottom"  data-original-title="申请店铺" onclick="showAddStore()"><i class="icon-plus icon-white"></i></button>');
		    $("#getAllStore").append(div0);
            var div1 = $('<div class="block-content collapse in"></div>')  ;
		    var list = new Array();
		    for(var i=0;i< Object.keys(result).length;i=i+4){//i0 j0 j1j2 i3 j3j4j5 i6 i
		    	var div2 = $('<div class="row-fluid padd-bottom"></div>') ;
		    	
		    	j =i;
		    	list=new Array();
		    	for(j;j<i+4&&j<Object.keys(result).length;j++){
		    		var sNAME = "'"+result[j].sName+"'";
		    		var status ="";
		    		switch(result[j].sStatus){
		    			case 0:
		    				status='<span class="label">申请中</span>';
		    				break;
		    			case 1:
		    				status='<span class="label">申请成功</span>';
		    				break;
		    			case 2:
		    				status = '<span class="label">申请失败</span>';
		    				break;
		    			case 3:
		    				status ='<span class="label label-success">正常运营</span>';
		    				break;
		    			case 4:
		    				status = '<span class="label">暂停营业</span>';
		    				break;
		    		}
		    		str = "";
		    		str = str +'<div class="span3 well thumbnail">'
		    		+status
		    		+'<button class="btn-danger pull-right tooltip-bottom"  data-original-title="暂停营业" onclick="delStore(' +result[j].sId +')"><i class="icon-remove icon-white"></i></button>'
		    		+'<button class="btn-primary  pull-right tooltip-bottom"  data-original-title="修改店铺信息" onclick="showModifyStore(\'' +result[j].sName+"\',"+result[j].sId +",\'"+result[j].sDesc +"\',\'"+result[j].sStarttime +"\',\'"+result[j].sEndtime +"\',\'"+result[j].sAddress + '\')"><i class="icon-wrench icon-white"></i></button><br />'
		    		+'<h4 align="center" > '+result[j].sName +'</h4>'
		    		+' <a onclick="showModifyStoreImg(' +result[j].sId  + ')" class="thumbnail tooltip-bottom"  data-original-title="修改图片">'
		    		+'<img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="'+result[j].sImg+'">'
		    		+'</a><p>'
		    		+'<div id="star'+j+'" ><input type="button" value="进入店铺" onclick="enterStore(' +result[j].sId +')" class="pull-right btn  btn-inverse" /></div>'
		    		+'</p></div>';
		    		div2.append(str);
		    		
		    		var stars= new Object();
		    		stars.name="star"+j;
		    		stars.point=result[j].sPoint;
		    		list.push(stars);
		    	}
		    	div1.append(div2);
		    	$("#getAllStore").append(div1);
		    	$('.tooltip-bottom').tooltip({ placement: 'bottom' });
		    	putStar(list);
		    }
		}
	});
}
//修改店铺图片
function showModifyStoreImg(sid){
	$("#mssId").val(sid);
	$("#modiStoreImgModal").modal("show");
}
//修改菜品图片
function showModifyFoodImg(id,sid){
	$("#mpfsid").val(sid);
	$("#mpfId").val(id);
	$("#modiFoodImgModal").modal("show");
}
//显示添加店铺
function showAddStore(){
	$("#applyStoreModal").modal("show");
}
//填充显示修改店铺的模态框
function showModifyStore(name,id,desc,starttime,endtime,address){
	$("#msId").val(id);
	$("#msName").val(name);
	$("#msDesc").val(desc);
	$("#msAddress").val(address);
	$("#msStarttime").val(starttime);
	$("#msEndtime").val(endtime);
	$("#modiStoreModal").modal("show");
}
function delStore(id){
	changeStoreStatus(id,4);
}
//设置星级
function putStar(list){
	for(var i=0;i<list.length;i++){
		console.log(list[i].name+list[i].point);
	$('#'+list[i].name).raty({ readOnly: true, score: list[i].point });
	}
}
//获取店铺菜品
function enterStore(id){
	$.ajax({
		type : "get",
		url : "getFoodByStoreId",
		data:"sId="+id,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
//			var tr = $('<tr></tr>');
//		    var tbody = $('<tbody></tbody>');
//		    var table = $('<table></table>');
//		   $('#Table').empty();
//		   getOrder(id);
//		   
//		  	$('#Table ').append('<tr><td><input type="button" value="add" onclick="showAddFood('+id+')"></td></tr>');
//		    $('#Table ').append('<tr><th>菜品名称</th><th>菜品描述</th><th>菜品价格</th><th>菜品剩余数量</th><th>菜品图片</th></tr>');
//		    for(var i=0;i< Object.keys(result).length;i++){
//		    	tr.append('<td>' + result[i].fName + '</td>');
//		    	tr.append('<td>' + result[i].fDesc + '</td>');
//		    	tr.append('<td>' + result[i].fPrice + '</td>');
//		    	tr.append('<td>' + result[i].fNumber + '</td>');
//		    	tr.append('<td>' + result[i].fImg + '</td>');
//		    	eval("food"+i+"={fName:'"+result[i].fName+"',fDesc:'"+result[i].fDesc+"',fPrice:'"+result[i].fPrice+"',fNumber:'"+result[i].fNumber+"',fImg:'"+result[i].fImg+"',fSid:'"+id+"',fId:'"+result[i].fId+"'};");
//		    	tr.append('<td><input type="button" value="modify" onclick="showModify(food' +i + ')"></td>');
//		    	tr.append('<td><input type="button" value="delete" onclick="del(food' +i+')"></td>');
//		    	$('#Table').append(tr);
//		    	tr=$('<tr></tr>');
//		    }
//		    $('#Table ').append('<tr><td><input type="button" value="back" onclick="getUserStore()"></td></tr>');
//		    table.append(tbody);
//	    	$('#AllStore').replaceWith(table);
				
			var str = "";
		    $("#getAllStore").contents().remove();
		    var div0 =$('<div class="navbar navbar-inner block-header"></div>');
		    switch(result.sStatus){
		    		case 0:status="申请中";break;
		    		case 1:status="申请成功";break;
		    		case 2:status = "申请失败";break;
		    		case 3:status ="正常运营";break;
		    		case 4:status ="暂停营业";break;
		    	}
		    	if(result.sStatus!=3){
		    
		    	div0.append('<div class="muted pull-left"><span class="label label-inverse">'+result.sName+'</span>&emsp;<span class="label">'+status+'</span></div>');
		    }else{
		    	div0.append('<div class="muted pull-left"><span class="label label-inverse">'+result.sName+'</span>&emsp;<span class="label label-success">'+status+'</span></div>');
		    }
		    div0.append('<button class="btn btn-info pull-right tooltip-bottom"  data-original-title="开店" onclick="changeStoreStatus('+id+',3,'+result.sStatus+')"><i class="icon-eye-open icon-white"></i></button>');
		    div0.append('<button class="btn tooltip-bottom btn-warning pull-right" data-original-title="添加菜品" onclick="showAddFood('+id+')"><i class="icon-plus icon-white"></i></button>');
		    div0.append('<button class="btn btn-inverse pull-right tooltip-bottom" data-original-title="获得评论" onclick="getComment('+id+')"><i class="icon-list-alt icon-white"></i></button>');
		    $("#getAllStore").append(div0);
            var div1 = $('<div class="block-content collapse in"></div>')  ;
		    var list = new Array();
		    for(var i=0;i< Object.keys(result).length;i=i+4){//i0 j0 j1j2 i3 j3j4j5 i6 i
		    	 var div2 = $('<div class="row-fluid padd-bottom " ></div>') ;
		    	
		    	j =i;
		    	list=new Array();
		    	for(j;j<i+4&&j<Object.keys(result.foods).length;j++){
		    		str = "";
		    		eval("food"+j+"={fName:'"+result.foods[j].fName+"',fDesc:'"+result.foods[j].fDesc+"',fPrice:'"+result.foods[j].fPrice+"',fNumber:'"+result.foods[j].fNumber+"',fImg:'"+result.foods[j].fImg+"',fSid:'"+id+"',fId:'"+result.foods[j].fId+"'};");
		    		str = str +'<div class="span3 well thumbnail">'
		    		+'<button class="btn-danger pull-right tooltip-bottom" data-original-title="删除" onclick="del(food' +j+')"><i class="icon-remove icon-white"></i></button>'
		    		+'<button class="btn-primary  pull-right tooltip-bottom" data-original-title="修改" onclick="showModify(food' +j + ')"><i class="icon-wrench icon-white"></i></button><br />'
		    		+'<h4 align="center" > '+result.foods[j].fName +'</h4>'
		    		+' <a onclick="showModifyFoodImg(' +result.foods[j].fId +','+ result.sId + ')" class="thumbnail tooltip-bottom"  data-original-title="修改图片">'
		    		+'<img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="'+result.foods[j].fImg+'">'
		    		+'</a><label>'+result.foods[j].fDesc+'</label><br />'
		    		+'<label class="pull-left"><span class="label label-inverse">价格:</span>&nbsp;<span class="badge badge-important">'+result.foods[j].fPrice+'元</span></label>'
		    		+'<label  class="pull-right" ><span class="label label-inverse">数量:</span>&nbsp;<span class="badge badge-success">'+result.foods[j].fNumber+'个</span></label>'
		    		div2.append(str);
		    		
		    	}
		    	div1.append(div2);
		    	$('.tooltip-bottom').tooltip({ placement: 'bottom' });	
		    	
		    	$("#getAllStore").append(div1);
		}
		}
	});
}
//删除菜品
function del(food){
	$.ajax({
		type : "get",
		url : "delFood",
		data:"fId="+food.fId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		success : function(result) {
			if(result==true){
				$("#jgrowl").jGrowl("删除成功");
				enterStore(food.fSid);
			}else{
				$("#jgrowl").jGrowl("删除失败");
			}
		}
	});
}
//显示添加菜品表
function showAddFood(id){
	$("#afsid").val(id) ;
	$("#addFoodModal").modal("show");
}
//显示修改菜品表
function showModify(food){
	$("#mfId").val(food.fId);
	$("#mfsid").val(food.fSid) ;
	$("#mfName").val(food.fName);
	$("#mfDesc").val(food.fDesc) ;
	$("#mfPrice").val(food.fPrice) ;
	$("#mfNumber").val(food.fNumber) ;
//	$("#mfImg").val(food.fImg) ;
	$("#modiFoodModal").modal("show");
}
//获取订单
function getOrder(){
	$('.content').hide();
	$('#orderContent').show();
	$('li').removeClass('active');
	$('#orderli').addClass('active');
	$.ajax({
		type : "get",
		url : "getAllOrder",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		success : function(result) {
			$('#orderTable').empty();
			var tr = $('<tr></tr>');
		    var tbody = $('<tbody></tbody>');
		    var table = $('<table></table>');
		    $('#orderTable ').append('<tr><th>订单号</th><th>店铺名</th><th>订单细节</th><th>订单总价</th><th>用户名称</th><th>用户地址</th><th>用户手机</th><th>下单日期</th><th>订单状态</th><th>订单操作</th></tr>');
		    for(var i=0;i< Object.keys(result).length;i++){
		    	tr.append('<td>' + result[i].oId + '</td>');
		    	tr.append('<td>' + result[i].store.sName + '</td>');
		    	tr.append('<td>' + result[i].oDetail + '</td>');
		    	tr.append('<td>' + result[i].oPrice + '</td>');
		    	tr.append('<td>' + result[i].user.uName + '</td>');
		    	tr.append('<td>' + result[i].user.uStreet+result[i].user.uAddress + '</td>');
		    	tr.append('<td>' + result[i].user.uPhone + '</td>');
		    	tr.append('<td>' + result[i].oDate + '</td>');
		    	var status;
		    	switch(result[i].oStatus){
		    		case "0":status = '下单'; break;
		    		case "1":status = '接单'; break;
		    		case "2":status = '送达'; break;
		    		case "3":status = '交易成功'; break;
		    	}
		    	tr.append('<td><span class="label label-info">' + status + '</span></td>');
				if(result[i].oStatus!='2'&&result[i].oStatus!='3'){
					tr.append('<td><input type="button" class="btn btn-danger" value="处理" id="handle" onclick="handle(' +result[i].oId  + ','+result[i].oStatus+')"></td>');
				}else{
					tr.append('<td><input type="button" class="btn" value="处理" disabled="disabled"></td>');
				}
				$('#orderTable ').append(tr);
		    	tr=$('<tr></tr>');
		    }
		    
//		    	$('#AllStore').replaceWith(table);
		}
	});
}
//改变订单状态
function handle(oId,status){
	$.ajax({
		type : "get",
		url : "changeStatus",
		data:"oId="+oId+"&status="+status,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			if(result==true){
				$("#jgrowl").jGrowl("处理成功");
				getOrder();
			}else{
				$("#jgrowl").jGrowl("处理失败");
			}
		}
	});
}
function getUserInfo(){
	$('.content').hide();
	$('#userInfoContent').show();
	$('li').removeClass('active');
	$('#UserInfo').addClass('active');
	
	$.ajax({
		type : "post",
		url : "getUserInfo",
		data:"uId="+<%=session.getAttribute("userId")%>,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			$('#userInfoTable').empty();
			var tr = $('<tr></tr>');
		    var tbody = $('<tbody></tbody>');
		    var table = $('<table></table>');
		    $('#userInfoTable ').append('<tr><th>用户名称</th><th>用户手机</th><th>用户街道</th><th>用户详细地址</th><th>操作</th></tr>');
		    	tr.append('<td>' + result.uName + '</td>');
		    	tr.append('<td>' + result.uPhone + '</td>');
		    	tr.append('<td>' + result.uStreet + '</td>');
		    	tr.append('<td>' + result.uAddress + '</td>');
//		    	var user = {uName:"'"+result.uName+"'"};
				eval("user={uName:'"+result.uName+"',uPhone:'"+result.uPhone+"',uPower:'"+result.uPower+"',uStreet:'"+result.uStreet+"',uAddress:'"+result.uAddress+"',uPwd:'"+result.uPwd+"',uAccount:'"+result.uAccount+"',uId:'"+result.uId+"'};");
				tr.append('<td><input type="button" class="btn btn-primary" value="修改个人资料" onclick="showChangeUserInfo()"><input type="button" class="btn btn-danger" value="修改密码" onclick="{$(\'#changepwdModal\').modal(\'show\')}"></td>');
				$('#userInfoTable ').append(tr);
		    	tr=$('<tr></tr>');
		    
//		    	$('#AllStore').replaceWith(table);
		}
	});
}
function showChangeUserInfo(){
	$("#muId").val(user.uId);
	$("#muName").val(user.uName);
	$("#muAccount").val(user.uAccount) ;
	$("#muPhone").val(user.uPhone) ;
	$("#muStreet").val(user.uStreet) ;
	$("#muAddress").val(user.uAddress) ;
	$("#muPwd").val(user.uPwd) ;
	$("#muPower").val(user.uPower);
	$("#modiUserModal").modal("show");
}
function getStoreInfo(){
	$('.content').hide();
	$('#storeInfoContent').show();
	$('li').removeClass('active');
	$('#storeInfo').addClass('active');
	$.ajax({
		type : "get",
		url : "getUserStore",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
		$("#storeInfoTable").empty();
			var tr = $('<tr></tr>');
		    var tbody = $('<tbody></tbody>');
		    var table = $('<table></table>');
		    $("#storeInfoTable").append("<tr><th>店铺名称</th><th>店铺图片</th><th>店铺资格证</th><th>店铺状态</th></tr>")
		    for(var i=0;i< Object.keys(result).length;i++){
		    	if(result[i].sStatus==3||result[i].sStatus==4){
		    		continue;
		    	}
		    	var status ="";
		    	switch(result[i].sStatus){
		    		case 0:status="申请中";break;
		    		case 1:status="申请成功";break;
		    		case 2:status = "申请失败";break;
		    		case 3:status ="正常运营";break;
		    		case 4:status ="暂停营业";break;
		    	}
		    	tr.append('<td>' + result[i].sName + '</td>');
		    	tr.append('<td><img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="' + result[i].sImg+ '"></td>');
		    	tr.append('<td><img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="' + result[i].sCertimg+ '"></td>');
		    	if(result[i].sStatus!=3){
		    	tr.append('<td><span class="label label-important">' + status + '</span></td>');
		    	}else{
		    		tr.append('<td><span class="label label-success">' + status + '</span></td>');
		    	}
		    	$('#storeInfoTable ').append(tr);
		    	tr=$('<tr></tr>');
		    }
		}
	});
}
//改变店铺状态 删除
function changeStoreStatus(id,status,ostatus){
	if((status==3||status==4)&&(ostatus==0||ostatus==2)){
		$("#jgrowl").jGrowl("申请未通过");
	}else{
	$.ajax({
		type : "get",
		url : "changeStoreStatus",
		data:"sId="+id+"&sStatus="+status ,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			if(result==false){
				$("#jgrowl").jGrowl("修改失败");
			}
			$("#jgrowl").jGrowl("修改成功");
			getUserStore();
		}
	});
	}
}
//统计图
function getChart(){
	$('.content').hide();
	$('li').removeClass('active');
	$('#HighchartsContent').show();
	$('#chart').addClass('active');
	$.ajax({
		type : "post",
		url : "getUserStoreAllSaler",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			
	$('#highcharts').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '所属店铺总销量统计图'
        },
        subtitle: {
            text: '统计所属的店铺的销量'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: '销量'
            }

        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> <br/>'
        },

        series: [{
            name: 'Brands',
            colorByPoint: true,
            data:result
        }]
    });
    }
	});
}
</script>
</head>
<body>
<!--<h1>food manager</h1>
<table id="Table"></table>
<form name="modifyForm" style="display: none;" id="modifyForm">
	<input type="hidden" id="mfId"  name="fId"><br />
	<input type="hidden" id="mfsid" name="fSid"><br />
	菜品名称<input type="text" id="mfName" name="fName"><br />
	菜品描述<input type="text" id="mfDesc" name="fDesc"><br />
	菜品价格<input type="text" id="mfPrice" name="fPrice"><br />
	菜品剩余数量<input type="text" id="mfNumber" name="fNumber"><br />
	菜品图片<input type="text" id="mfImg" name="fImg"><br />
	<input type="submit"   value="modify" />
</form>
<form name="addForm" style="display: none;" id="addForm">
	<input type="hidden" id="afId"  name="fId"><br />
	<input type="hidden" id="afsid" name="fSid"><br />
	菜品名称<input type="text" id="afName" name="fName"><br />
	菜品描述<input type="text" id="afDesc" name="fDesc"><br />
	菜品价格<input type="text" id="afPrice" name="fPrice"><br />
	菜品剩余数量<input type="text" id="afNumber" name="fNumber"><br />
	菜品图片<input type="text" id="afImg" name="fImg"><br />
	<input type="submit"   value="add" />
</form>
<table id="orderTable" style="display: none;"></table>
<table id="commentTable">
	<tr><th>评论用户</th><th>评论分数</th><th>评论内容</th><th>评论日期</th></tr>
</table>
</body>
</html>-->
<div id="jgrowl" class="jGrowl bottom-left"></div>
		 <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" onclick="getUserStore()"> <img src="resources/images/logo.png" style="height: 30px;" alt=""></a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li >
                                <a  onclick="getUserInfo()" role="button" > <i class="icon-user"></i><%=session.getAttribute("userName")%></a>
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
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li class="active" id="allStoreli">
                            <a onclick="getUserStore()"><i class="icon-chevron-right"></i> 所有店铺</a>
                        </li>
                        <li id="orderli">
                            <a onclick="getOrder()"><i class="icon-chevron-right"></i> 订单信息</a>
                        </li>
                        <li id="UserInfo">
                            <a onclick="getUserInfo()"><i class="icon-chevron-right"></i>个人信息</a>
                        </li>
                        <li id="storeInfo">
                            <a onclick="getStoreInfo()"><i class="icon-chevron-right"></i> 查看店铺申请状态</a>
                        </li>
                        <li id="chart">
                            <a onclick="getChart()"><i class="icon-chevron-right"></i> 查看销量统计图</a>
                        </li>
                    </ul>
                </div>

	<div class="span9 content" id="content">
		<div class="row-fluid">
            <!-- block -->
            <div class="block" id="getAllStore">
                <!--<div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">所有店铺</div>
                </div>
                <div class="block-content collapse in"></div>-->
            </div>
        </div>
	</div>
	<!-- 订单栏-->
				<div class="row-fluid content" style="display: none;" id="orderContent">
                        <div class="span9">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">订单</div>

                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped" id="orderTable"></table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                
            </div>
            <!-- 订单栏-->
             <!-- 统计图栏-->
				<div class="row-fluid content" style="display: none;" id="HighchartsContent">
                        <div class="span9">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">销量统计图</div>
                                </div>
                                <div class="block-content collapse in">
                                    <div id="highcharts" style="min-width: 100%; height: 400px; margin: 0 auto"></div>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                
            </div>
            <!-- 统计图栏-->
            <!-- 店铺申请栏-->
				
            <div id="applyStoreModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>新增店铺</h3>
			</div>
		<div class="modal-body">
			<form id="addStoreForm" action="javascript:;" enctype="multipart/form-data" method="post">
                  店铺名称<input type="text" class="input-xlarge focused"  data-rule="店铺名称:required" placeholder="店铺名称" id="sName" name="sName"/><br />
                                    店铺描述<input type="text" class="input-xlarge focused"  name="sDesc" placeholder="店铺描述" data-rule="店铺描述:required" /><br />
				店铺地址<input type="text" placeholder="店铺地址"  data-rule="店铺地址:required" class="input-xlarge focused" name="sAddress" ><br />
				开店时间<input type="text"  id="asStarttime" placeholder="开店时间" class="input-xlarge focused" name="sStarttime" ><br />
				关门时间<input type="text" id="asEndtime" placeholder="关门时间"  class="input-xlarge focused" name="sEndtime" ><br />
                                    资格许可证<input type="file"  id="sImg" name="Img" data-rule="资格许可证:required" /><br />
                                    店铺图片<input type="file"  id="Img" name="Img" data-rule="店铺图片:required" /><br />
                  <input type="submit" class="btn btn-primary pull-right" value="申请"/>
            </form>
		</div>
	</div>
            <!-- 店铺申请栏-->
            <!-- 个人资料栏-->
				<div class="row-fluid content" style="display: none;" id="userInfoContent">
                        <div class="span9">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">个人资料</div>

                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped" id="userInfoTable"></table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                
            </div>
            <!-- 个人资料栏-->
            <!-- 店铺申请状态栏-->
				<div class="row-fluid content" style="display: none;" id="storeInfoContent">
                        <div class="span9">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">店铺申请状态</div>

                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped" id="storeInfoTable"></table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                
            </div>
            <!-- 店铺申请状态栏-->
	</div>
            <!-- modiFood model -->
		<div id="modiFoodModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>修改菜品</h3>
			</div>
		<div class="modal-body">
			<form name="modifyForm"  id="modifyForm" action="javascript:;" enctype="multipart/form-data" method="post">
				<input type="hidden" id="mfId"  name="fId"><br />
				<input type="hidden" id="mfsid" name="fSid"><br />
				菜品名称<input type="text" id="mfName" data-rule="菜品名称:required" name="fName"><br />
				菜品描述<input type="text" id="mfDesc" data-rule="菜品描述:required" name="fDesc"><br />
				菜品价格<input type="text" id="mfPrice" data-rule="菜品价格:required" name="fPrice"><br />
				菜品剩余数量<input type="text" id="mfNumber" data-rule="菜品剩余数量:required" name="fNumber"><br />
				<!--菜品图片<input type="file" id="afImg" data-rule="菜品图片:required" name="Img"><br />-->
				<input type="submit"   class="btn btn-primary pull-right" value="修改" />
			</form>
		</div>
	</div>
	<!--modiFood model -->
	<!-- modiFoodImg model -->
		<div id="modiFoodImgModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>修改菜品图片</h3>
			</div>
		<div class="modal-body">
			
			<form name="modiFoodImgForm"  id="modiFoodImgForm" action="javascript:;" enctype="multipart/form-data" method="post">
				<input type="hidden" id="mpfsid"  ><br />
				<input type="hidden" id="mpfId"  name="fId"><br />
				菜品图片<input type="file" class="input-file uniform_on" data-rule="菜品图片:required" id="mfImg" name="Img"><br />
				<input type="submit"   class="btn btn-primary pull-right" value="修改" />
			</form>
		</div>
	</div>
	<!--modiFoodImg model -->
	  <!-- addFood model -->
		<div id="addFoodModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>添加菜品</h3>
			</div>
		<div class="modal-body">
			<form name="addForm"  id="addForm" action="javascript:;" enctype="multipart/form-data" method="post">
				<input type="hidden" id="afId"  name="fId"><br />
				<input type="hidden" id="afsid" name="fSid"><br />
				菜品名称<input type="text" id="afName" data-rule="菜品名称:required"  name="fName" ><br />
				菜品描述<input type="text" id="afDesc" data-rule="菜品描述:required" name="fDesc" ><br />
				菜品价格<input type="text" id="afPrice" data-rule="菜品价格:required" name="fPrice" ><br />
				菜品剩余数量<input type="text" id="afNumber" data-rule="菜品剩余数量:required" value="100" name="fNumber" ><br />
				菜品图片<input type="file" id="afImg" data-rule="菜品图片:required" name="Img"><br />
				<input type="submit"  class="btn btn-primary pull-right"  value="添加" />
			</form>
		</div>
	</div>
	<!--addFood model -->
	<!-- modiStore model -->
		<div id="modiStoreModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>修改店铺资料</h3>
			</div>
		<div class="modal-body">
			<form name="modiStoreForm"  id="modiStoreForm" action="javascript:;" method="post">
				<input type="hidden" id="msId"  name="sId"><br />
				店铺名称<input type="text" id="msName" data-rule="店铺名称:required" class="input-xlarge focused" name="sName" ><br />
				店铺描述<input type="text" id="msDesc" data-rule="店铺描述:required" class="input-xlarge focused" name="sDesc" ><br />
				店铺地址<input type="text" id="msAddress" data-rule="店铺地址:required" class="input-xlarge focused" name="sAddress" ><br />
				开店时间<input type="text" id="msStarttime" data-rule="开店时间:required" class="input-xlarge focused" name="sStarttime" ><br />
				关门时间<input type="text" id="msEndtime" data-rule="关门时间:required" class="input-xlarge focused" name="sEndtime" ><br />
				<input type="submit"   class="btn btn-primary pull-right" value="修改" />
			</form>
		</div>
	</div>
	<!--modiStore model -->
	<!-- modiStoreImg model -->
		<div id="modiStoreImgModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>修改店铺资料图片</h3>
			</div>
		<div class="modal-body">
			
			<form name="modiStoreImgForm"  id="modiStoreImgForm" action="javascript:;" enctype="multipart/form-data" method="post">
				<input type="hidden" id="mssId"  name="sId"><br />
				店铺图片<input type="file" class="input-file uniform_on" data-rule="店铺图片:required" id="msImg" name="Img"><br />
				<input type="submit"   class="btn btn-primary pull-right" value="修改" />
			</form>
		</div>
	</div>
	<!--modiStoreImg model -->
	<!-- comment model -->
		<div id="commentModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>评论内容</h3>
			</div>
		<div class="modal-body">
			<table id="commentTable" class="table table-striped">
				
			</table>
		</div>
	</div>
	<!--comment model -->
	<!-- changeUserInfo model -->
		<div id="modiUserModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>修改个人信息</h3>
			</div>
		<div class="modal-body">
			<form name="modiUserInfoForm"  id="modiUserInfoForm" action="javascript:;" method="post">
				<input type="hidden" id="muId"  name="uId"><br />
				<input type="hidden" id="muPower" name="uPower"><br />
				用户名称<input type="text" data-rule="用户名称:required" id="muName" name="uName"><br />
				用户手机<input type="text" data-rule="用户手机:required" id="muPhone" name="uPhone"><br />
				用户所属街道<input type="text" data-rule="用户所属街道:required" id="muStreet" name="uStreet" ><br />
				用户详细地址<input type="text" data-rule="用户详细地址:required" id="muAddress" name="uAddress" ><br />
				<input type="hidden" id="muPwd" name="uPwd"><br />
				<input type="hidden" id="muAccount" name="uAccount"><br />
				<input type="submit"  class="btn btn-primary pull-right"  value="修改" />
			</form>
		</div>
	</div>
	<!--changeUserInfo model -->
	<!-- changepwd model -->
		<div id="changepwdModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>修改密码</h3>
			</div>
		<div class="modal-body">
			<form name="changepwdForm"  id="changepwdForm" action="javascript:;" method="post">
				旧密码<input type="password" data-rule="旧密码:required" id="oPwd" name="oPwd"><br />
				新密码<input type="password" data-rule="新密码:required" id="nPwd" name="nPwd"><br />
				确认新密码<input type="password" id="muStreet" data-rule="确认密码: required;match(nPwd);"  ><br />
				<input type="submit"  class="btn btn-primary pull-right"  value="修改" />
			</form>
		</div>
	</div>
	<!--changepwd model -->
        </div>
    </body>	
</html>
