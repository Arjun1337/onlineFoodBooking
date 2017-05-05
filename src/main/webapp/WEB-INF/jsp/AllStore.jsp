<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宅食网上订餐系统 订餐界面</title>
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
	$.fn.raty.defaults.path = 'resources/images';
	getAllStore();
	$("#modiUserInfoForm").submit(function(e){
	var formData = new FormData($(this)[0]);
		$.ajax({
			type:"post",
			data:formData,
			url:"modifyUserInfo",
			contentType: false,
            processData: false,
			success:function(data){
				if(data==true){
					$("#jgrowl").jGrowl("修改信息成功");
					$("#modiUserModal").modal("hide");
					getUserInfo();
					
				}else{
					$("#jgrowl").jGrowl("修改信息失败");
				}
			}
		});
	});
	$("#changepwdForm").submit(function(e){
		var oPwd = $("#oPwd").val();
		var nPwd = $("#nPwd").val();
		$.ajax({
			type:"post",
			data:"oPwd="+oPwd+"&nPwd="+nPwd,
			url:"modifyPwd",
			success:function(data){
				if(data==true){
					$("#jgrowl").jGrowl("修改密码成功");
					$("#changepwdModal").modal("hide");
				}else{
					$("#jgrowl").jGrowl("修改密码失败");
				}
			}
		});
	});
	
	$("form#addStoreForm").submit(function(e){
    
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
                $("#jgrowl").jGrowl("申请店铺成功");
                getStoreInfo();
            },
            error: function(){
                	$("#jgrowl").jGrowl("申请店铺失败");
            }
        });

        return false;
    
    
	});
	$('#sStarttime').timepicki({increase_direction:'up'});
	$('#sEndtime').timepicki({increase_direction:'up'});
})
//获取所有店铺
function getAllStore() {
	$('.content').hide();
	$('#content').show();
	$('#getAllStore').contents().remove();
	$('#orderContent').hide();
	$('li').removeClass('active');
	$('#allStoreli').addClass('active');
	$.ajax({
		type : "get",
		url : "getAllStore",
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
//		    	table.append(tbody);
//		    	$('#AllStore').replaceWith(table);
// 			var size = Object.keys(result).length;
// 			console.log(size);
// 			var j=0;
//		    if(size%3==0){
//		    	size=size/3;
//		    }else{
//		    	size=(size/3)+1;
//		    }
//		    console.log(size);
		    var str = "";
			var div0 =$('<div class="navbar navbar-inner block-header"></div>');
		    div0.append('<div class="muted pull-left">所有店铺</div>');
		    div0.append('<a onclick="{$(\'#myModal\').modal(\'show\')};getCart();"   class="btn btn-primary pull-right tooltip-bottom"  data-original-title="查看购物车"><i class="icon-shopping-cart icon-white"></i></a>');
		    $("#getAllStore").append(div0);
            var div1 = $('<div class="block-content collapse in"></div>')  ;
		    var list = new Array();
		    for(var i=0;i< Object.keys(result).length;i=i+4){//i0 j0 j1j2 i3 j3j4j5 i6 i
		    	var div2 = $('<div class="row-fluid padd-bottom"></div>') ;
		    	
		    	j =i;
		    	list=new Array();
		    	for(j;j<i+4&&j<Object.keys(result).length;j++){
		    		if(result[j].sStatus!=3){
		    			continue;
		    		}
		    		str = "";
		    		str = str +'<div class="span3 well thumbnail">'
		    		+'<span class="label label-important pull-left"><i class=" icon-fire icon-white"></i>销量:'+result[j].sAllsale+'</span><br>'
		    		+'<h4 align="center" > '+result[j].sName +'</h4>'
		    		+' <a onclick="enterStore(' +result[j].sId  + ')" class="thumbnail">'
		    		+'<img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="'+result[j].sImg+'">'
		    		+'</a><p>'
		    		+'<div id="star'+j+'" ><input type="button" value="进入店铺" onclick="enterStore(' +result[j].sId  +",\'"+result[j].sName+ '\')" class="pull-right btn  btn-inverse" /></div>'
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
//获取店铺申请情况
function getStoreApplyInfo(){
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
		    $("#storeInfoTable").append("<tr><th>店铺名称</th><th>店铺描述</th><th>店铺地址</th><th>运营时间</th><th>店铺图片</th><th>店铺资格证</th><th>店铺状态</th></tr>")
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
		    	tr.append('<td>' + result[i].sDesc + '</td>');
		    	tr.append('<td>' + result[i].sAddress + '</td>');
		    	tr.append('<td>' + result[i].sStarttime +'~'+result[i].sEndtime+ '</td>');
		    	tr.append('<td><img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="' + result[i].sImg+ '"></td>');
		    	tr.append('<td><img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="' + result[i].sCertimg+ '"></td>');
		    	tr.append('<td><span class="label label-important">' + status + '</span></td>');
		    	$('#storeInfoTable ').append(tr);
		    	tr=$('<tr></tr>');
		    }
		}
	});
}
//星
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
//		    $('#Table ').append('<tr><th>菜品名称</th><th>菜品描述</th><th>菜品价格</th><th>菜品剩余数量</th><th>菜品图片</th></tr>');
//		   	for(var i=0;i<Object.keys(result).length;i++){
//		    	tr.append('<td>' + result[i].fName + '</td>');
//		    	tr.append('<td>' + result[i].fDesc + '</td>');
//		    	tr.append('<td>' + result[i].fPrice + '</td>');
//		    	tr.append('<td>' + result[i].fNumber + '</td>');
//		    	tr.append('<td>' + result[i].fImg + '</td>');
//		    	tr.append('<td><input type="text" id="n' + result[i].fId+ '"></td>');
//		    	tr.append('<td><input type="button" value="I want!" onclick="choiceStore(' +result[i].fId  + ')"></td>');
//		    	$('#Table').append(tr);
//		    	tr=$('<tr></tr>');
//		    }
//		    $('#Table ').append('<tr><td><input type="button" value="back" onclick="getAllStore()"></td></tr>');
//		    table.append(tbody);
//	    	$('#AllStore').replaceWith(table);
			var str = "";
			$("#getAllStore").contents().remove();
			var div0 =$('<div class="navbar navbar-inner block-header"></div>');
		    div0.append('<div class="muted pull-left">'+result.sName+'<a class=" tooltip-bottom"  data-original-title="店铺详细信息" onclick="showStoreInfo('+id+')"><i class="icon-exclamation-sign icon-black"></i></a></div>');
		    div0.append('<a onclick="{$(\'#myModal\').modal(\'show\')};getCart();"   class="btn btn-primary pull-right tooltip-bottom"  data-original-title="查看购物车"><i class="icon-shopping-cart icon-white"></i></a>');
		    div0.append('<button class="btn btn-inverse pull-right tooltip-bottom"  data-original-title="获取评论" onclick="getComment('+id+')"><i class="icon-list-alt icon-white"></i></button>');
		    $("#getAllStore").append(div0);
            var div1 = $('<div class="block-content collapse in"></div>')  ;
		    var list = new Array();
		    for(var i=0;i< Object.keys(result).length;i=i+4){//i0 j0 j1j2 i3 j3j4j5 i6 i
		    	var div2 = $('<div class="row-fluid padd-bottom"></div>') ;
		    	
		    	j =i;
		    	list=new Array();
		    	for(j;j<i+4&&j<Object.keys(result.foods).length;j++){
		    		
		    		str = "";
		    		str = str +'<div class="span3 well thumbnail">'
		    		+'<h4 align="center" > '+result.foods[j].fName +'</h4>'
		    		+' <a  class="thumbnail">'
		    		+'<img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="'+result.foods[j].fImg+'">'
		    		+'</a><label>'+result.foods[j].fDesc+'</label><br />'
		    		+'<label class="pull-left"><span class="label label-inverse">价格:</span>&nbsp;'
		    		+'<span class="label label-important">'+result.foods[j].fPrice+'元</span></label>'
//		    		+'<label class="pull-left"><span class=" label label-inverse">数量:</span>&nbsp;'
		    		+'<button class=" pull-right btn-success" onclick="choiceStore(' +result.foods[j].fId  +',' +id+')"><i class="icon-shopping-cart icon-white"></i></button> '
		    		+'<label class="pull-right"><span class="label label-info">剩余个数：'+result.foods[j].fNumber+'个</span>'
		    		+'<input type="text" class="pull-right" style="width: 30px;" value="1" id="n' + result.foods[j].fId+ '"></label>'
		    		
		    		div2.append(str);
		    		
		    	}
		    	
		    	div1.append(div2);
		    	$("#getAllStore").append(div1);
		    	$('.tooltip-bottom').tooltip({ placement: 'bottom' });
		    	putStar(list);
		}
	}
});
}
//获得店铺资料
function showStoreInfo(id){
	$("#storeInfoModal").modal("show");
	$.ajax({
		type : "post",
		url : "getStoreInfo",
		data:"sId="+id,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		success : function(result) {
			$('#storeInfoDiv').contents().remove();
			var list = new Array();
			var lDiv = $("<div class='pull-left'></div>");
			var rDiv = $("<div ></div>");
			lDiv.append('<img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="'+result.sImg+'"><br />');
			lDiv.append('<div id="storeStar"><span span class="label label-inverse pull-left">店铺评分:&emsp;</span></div>');
			var stars= new Object();
		    stars.name="storeStar";
		    stars.point=result.sPoint;
		    
		    rDiv.append('<span span class="label label-inverse">店铺名称：</span>&emsp;<b>'+result.sName+'</b><br />');
		    rDiv.append('<span span class="label label-inverse">店铺地址：</span>&emsp;<b>'+result.sAddress+'</b><br />');
		    rDiv.append('<span span class="label label-inverse">营业时间：</span>&emsp;<b>'+result.sStarttime+'~'+result.sEndtime+'</b><br />');
		    rDiv.append('<span span class="label label-inverse">店铺描述：</span><p>'+result.sDesc+'</p>');
		    $("#storeInfoDiv").append(lDiv);
		    $("#storeInfoDiv").append(rDiv);
		    list.push(stars);
		    putStar(list);
		}
		
	});
}
//获取店铺评论
function getComment(sid){
	$("#commentModal").modal("show");
	$.ajax({
		type : "get",
		url : "getStoreComment",
		data:"sId="+sid,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			var list = new Array();
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
		}
	});
}
//添加购物车
function choiceStore(id,sid){
	var number = $("#n"+id).val();
	$.ajax({
		type : "get",
		url : "addCart",
		data:"caFid="+id+"&caNumber="+number ,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			if(result==false){
				$("#jgrowl").jGrowl("添加购物车失败");
			}
			$("#jgrowl").jGrowl("添加购物车成功");
			enterStore(sid);
		}
	});
}
//获取购物车信息
var allPrice= 0;
function getCart(){
	$.ajax({
		type : "get",
		url : "getCart",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			allPrice= 0;
			var tr = $('<tr></tr>');
		    var tbody = $('<tbody></tbody>');
		    var table = $('<table></table>');
		    
		   $('#Cart').empty();
		    $('#Cart ').append('<tr><th>菜品名称</th><th>菜品数量</th><th>菜品价格</th><th>操作</th></tr>');
		    for(var i=0;i< Object.keys(result).length;i++){
		    	tr.append('<td>' + result[i].food.fName + '</td>');
		    	tr.append('<td>' + result[i].caNumber + '</td>');
		    	tr.append('<td>' + result[i].food.fPrice*result[i].caNumber + '</td>');
		    	tr.append('<td><input type="button" class="btn btn-danger" value="删除" onclick="delCart(' +result[i].caId  + ')"></td>');
		    	$('#Cart').append(tr);
		    	tr=$('<tr></tr>');
		    	allPrice=parseFloat((allPrice + result[i].food.fPrice*result[i].caNumber).toFixed(2));
		    }
		    if(Object.keys(result).length!=0){
		    	var sid = result[0].food.fSid;
		    	$('#Cart').append('<button class=" btn btn-success pull-left"  onclick="showBuyWay('+allPrice +','+sid+')" ><i class=" icon-shopping-cart icon-white"></i>总价:'+allPrice+'</button');
			}else{
		    $('#Cart').append('<button disabled="disabled" class=" btn btn-success pull-left"  ><i class=" icon-shopping-cart icon-white"></i>总价:'+allPrice+'</button');
			}    
		}
	});
}
//显示支付方式
function showBuyWay(allprice,sid){
	$('#showBuyWayDiv').contents().remove();
	$("#showBuyWayDiv").append('<button onclick="buy('+allprice+','+sid+')" ><img data-src="holder.js/260x180"  style="width: 100%; height: 180px;" class="tooltip-bottom"  data-original-title="货到付款" src="resources/images/hdfk.jpg"></button>&emsp;');
	$("#showBuyWayDiv").append('<img data-src="holder.js/260x180" class="tooltip-bottom"  data-original-title="在线支付(暂不支持)" style="width: 40%; height: 180px;" src="resources/images/zxzf.jpg">');
	$("#showBuyWayModal").modal("show");
	$('.tooltip-bottom').tooltip({ placement: 'bottom' });
	
}
//删除购物车
function delCart(id){
	
	$.ajax({
		type : "get",
		url : "delCart",
		data:"caId="+id ,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			if(result==true){
			$("#jgrowl").jGrowl("删除成功");
				getCart();
			}else{
				$("#jgrowl").jGrowl("删除失败");
				getCart();
			}
		}
	});
}
//结账
function buy(allPrice,sid){
	$.ajax({
		type : "get",
		url : "buy",
		data:"allPrice="+allPrice+"&sId="+sid,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			if(result==true){
				$("#jgrowl").jGrowl("购买成功");
				$("#showBuyWayModal").modal("hide");
				getCart();
			}else{
				$("#jgrowl").jGrowl("购买失败");
				getCart();
			}
		}
	});
}
//获取订单
function getOrder(){
	$('.content').hide();
	$('#orderContent').show();
	$('li').removeClass('active');
	$('#orderli').addClass('active');
	$.ajax({
		type : "get",
		url : "getUserOrder",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			$('#orderTable').empty();
			var tr = $('<tr></tr>');
		    var tbody = $('<tbody></tbody>');
		    var table = $('<table></table>');
		    $('#orderTable ').append('<tr><th>订单号</th><th>店铺名</th><th>订单细节</th><th>订单总价</th><th>下单日期</th><th>订单状态</th><th>订单操作</th></tr>');
		    for(var i=0;i< Object.keys(result).length;i++){
		    	tr.append('<td>' + result[i].oId + '</td>');
		    	tr.append('<td>' + result[i].store.sName + '</td>');
		    	tr.append('<td>' + result[i].oDetail + '</td>');
		    	tr.append('<td>' + result[i].oPrice + '</td>');
		    	tr.append('<td>' + result[i].oDate + '</td>');
		    	var status;
		    	switch(result[i].oStatus){
		    		case "0":status = '下单'; break;
		    		case "1":status = '接单'; break;
		    		case "2":status = '送达'; break;
		    		case "3":status = '交易成功'; break;
		    	}
		    	tr.append('<td>' + status + '</td>');
				if(result[i].oStatus=='2'){
					tr.append('<td><input type="button" class="btn btn-danger" value="确认收货" id="handle" onclick="handle(' +result[i].oId  + ','+result[i].oStatus+')"></td>');
				}else{
					tr.append('<td><input type="button" class="btn " value="确认收货" id="handle" disabled="disabled"></td>');
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
				$("#commentAlert").modal("show");
    				$("#aCoOid").val(oId);
 					$("#aCoUid").val(<%=session.getAttribute("userId")%>);
 					var d  = new Date();
					var sdate = "";
					sdate += d.getFullYear()+"年";
					sdate += (d.getMonth()+1)+"月";
					sdate += d.getDay()+"日";
					sdate += d.getHours()+"时";
					sdate += d.getMinutes()+"分";
					$("#aCoDate").val(sdate);
					$('#comStar').raty({
						click: function (score, evt) {
			  	 			$("#getStar").val(score);	
			  	 		}
					});
			}else{
				$("#jgrowl").jGrowl("更改失败");
			}
		}
	});
}
//获取用户信息
function getUserInfo(){
	$('.content').hide();
	$('li').removeClass('active');
	$('#userInfoContent').show();
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
//评论
function comment(){
	var oId = $("#aCoOid").val();
	var uId = <%=session.getAttribute("userId")%>;
	var d  = new Date();
	var sdate = "";
	sdate += d.getFullYear()+"年";
	sdate += (d.getMonth()+1)+"月";
	sdate += d.getDay()+"日";
	sdate += d.getHours()+"时";
	sdate += d.getMinutes()+"分";
	var content = $("#coContent").val();
	var point =$("#getStar").val();
	$.ajax({
           type: "POST",
           url: "addComment",
           data: "coContent="+content+"&coDate="+sdate+"&coOid="+oId+"&coPoint="+point+"&coUid="+uId, 
			error : function(){
				location.href="LoginUI"
			},
           success: function(data)
           {
               if(data==true){
               	$("#jgrowl").jGrowl("评论成功");
               	$('#addcommentModal').modal('hide');
               	getOrder();
               }else{
               	$("#jgrowl").jGrowl("评论失败");
               	$('#addcommentModal').modal('hide');
               }
           }
         });
}
//填充显示用户信息
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
//申请店铺
function applyStore(){
	$('.content').hide();
	$('li').removeClass('active');
	$('#applyStoreContent').show();
	$('#applyStore').addClass('active');
}
//统计图
function getChart(){
	$('.content').hide();
	$('li').removeClass('active');
	$('#HighchartsContent').show();
	$('#chart').addClass('active');
	$.ajax({
		type : "post",
		url : "getUserOrderPrice",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		error : function(){
			location.href="LoginUI"
		},
		success : function(result) {
			
	$('#highcharts').highcharts({
        chart: {
            type: 'spline'
        },
        title: {
            text: '单次订单购买金额统计图'
        },
        subtitle: {
            text: '根据每次订单的购买金额生成的统计图'
        },
        xAxis: {
            type: 'linear',
            labels: {
                overflow: 'justify'
            }
        },
        yAxis: {
            title: {
                text: '金额 (元)'
            },
            minorGridLineWidth: 0,
            gridLineWidth: 0,
            alternateGridColor: null,
            plotBands: [{ // Light air
                from: 0.3,
                to: 1.5,
                color: 'rgba(68, 170, 213, 0.1)',
                label: {
                    style: {
                        color: '#606060'
                    }
                }
            }, { // Light breeze
                from: 1.5,
                to: 3.3,
                color: 'rgba(0, 0, 0, 0)',
                label: {
                    style: {
                        color: '#606060'
                    }
                }
            }, { // Gentle breeze
                from: 3.3,
                to: 5.5,
                color: 'rgba(68, 170, 213, 0.1)',
                label: {
                    style: {
                        color: '#606060'
                    }
                }
            }, { // Moderate breeze
                from: 5.5,
                to: 8,
                color: 'rgba(0, 0, 0, 0)',
                label: {
                    style: {
                        color: '#606060'
                    }
                }
            }, { // Fresh breeze
                from: 8,
                to: 11,
                color: 'rgba(68, 170, 213, 0.1)',
                label: {
                    style: {
                        color: '#606060'
                    }
                }
            }, { // Strong breeze
                from: 11,
                to: 14,
                color: 'rgba(0, 0, 0, 0)',
                label: {
                    style: {
                        color: '#606060'
                    }
                }
            }, { // High wind
                from: 14,
                to: 15,
                color: 'rgba(68, 170, 213, 0.1)',
                label: {
                    style: {
                        color: '#606060'
                    }
                }
            }]
        },
        tooltip: {
            valueSuffix: ' 元'
        },
        plotOptions: {
            spline: {
                lineWidth: 5,
                states: {
                    hover: {
                        lineWidth: 5
                    }
                },
                marker: {
                    enabled: false
                }
            }
        },
        series: [{
        	name: '购买金额',
            data: result
        }],
        navigation: {
            menuItemStyle: {
                fontSize: '10px'
            }
        }
    });
    }
	});
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
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li class="active" id="allStoreli">
                            <a onclick="getAllStore()"><i class="icon-chevron-right"></i> 所有店铺</a>
                        </li>
                        <li id="orderli">
                            <a onclick="getOrder()"><i class="icon-chevron-right"></i> 订单信息</a>
                        </li>
                        <li id="UserInfo">
                            <a onclick="getUserInfo()"><i class="icon-chevron-right"></i>个人信息</a>
                        </li>
                        <li id="applyStore">
                            <a onclick="applyStore()"><i class="icon-chevron-right"></i>申请店铺</a>
                        </li>
                        <li id="storeInfo">
                            <a onclick="getStoreApplyInfo()"><i class="icon-chevron-right"></i> 查看店铺申请状态</a>
                        </li>
                        <li id="chart">
                            <a onclick="getChart()"><i class="icon-chevron-right"></i> 查看购买统计图</a>
                        </li>
                    </ul>
                </div>
<!--<h1>success</h1>
	<table id="Table">
			<tr></tr>
	</table>
	<table id="Cart">
	</table>
	<table id="orderTable" style="display: none;word-break:break-all; word-wrap:break-all;" width="1000"></table>
	<form style="display: none;" id="comment">
		<input type="hidden" name="coDate" id="aCoDate"><br />
		<input type="hidden" name="coUid" id="aCoUid"/><br />
		<input type="hidden" name="coOid" id="aCoOid"/><br />
		分数<input type="text" name="coPoint"><br />
		评论内容<input type="text" name="coContent" /><br />
		<input type="submit" value="submit"> 
	</form>-->
	<div class="span9 content" id="content">
		<div class="row-fluid">
            <!-- block -->
            <div class="block" id="getAllStore">
                <!--<div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">所有店铺</div>
                   	<a onclick="{$('#myModal').modal('show')};getCart();"   class="btn btn-primary pull-right"><i class="icon-shopping-cart icon-white"></i></a>
                </div>
                <div class="block-content collapse in" id="getAllStore"></div>-->
            </div>
        </div>
	</div>
	
	<!-- 订单 -->
				<div class="row-fluid content" style="display: none;" id="orderContent">
                        <div class="span9">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">订单</div>
                                </div>
                                <div class="block-content collapse in" id="orderDiv">
                                    <table class="table table-striped" id="orderTable"></table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                
            </div>
            <!-- 订单 -->
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
             <!-- 统计图栏-->
				<div class="row-fluid content" style="display: none;" id="HighchartsContent">
                        <div class="span9">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">购买统计图</div>
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
				<div class="row-fluid content" style="display: none;" id="applyStoreContent">
                        <div class="span9">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">店铺申请</div>
                                </div>
                                <div class="block-content collapse in">
                                    <form id="addStoreForm" action="javascript:;" enctype="multipart/form-data" method="post">
                                    	<!--店铺名称<input type="text" class="input-xlarge focused"  id="sName" name="sName"/>
                                    	资格许可证<input type="file" class="input-xlarge focused" id="sImg" name="Img" />
                                    	<input type="submit" value="申请"/>-->
                                    	<fieldset>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">店铺名称</label>
                                                      <div class="controls">
                                                      <input type="text" class="input-xlarge focused" data-rule="店铺名称:required" id="sName" name="sName"/>
                                                      </div>
                                                    </div>
                                                     <div class="control-group">
                                                      <label class="control-label" for="focusedInput">店铺地址</label>
                                                      <div class="controls">
                                                      <input type="text"   name="sAddress" data-rule="店铺地址:required" /><br />
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">店铺描述</label>
                                                      <div class="controls">
                                                      <input type="text"   name="sDesc" data-rule="店铺描述:required" /><br />
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">营业时间</label>
                                                      <div class="controls">
                                                      开门时间<input type="text" id="sStarttime"  name="sStarttime"  /><br />
                                                      关门时间<input type="text"  id="sEndtime" name="sEndtime"  /><br />
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">资格许可证</label>
                                                      <div class="controls">
                                                        <input type="file" class="input-xlarge focused" id="sImg" name="Img" />
                                                      </div>
                                                    </div>
                                                     <div class="control-group">
                                                      <label class="control-label" for="focusedInput">店铺图片</label>
                                                      <div class="controls">
                                                        <input type="file"  id="Img" name="Img" data-rule="店铺图片:required" /><br />
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <div class="controls">
                                                      <input type="submit" class="btn btn-primary" value="申请"/>
                                                      </div>
                                                    </div>
                                                  </fieldset>
                                    </form>
                                    
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                
            </div>
            <!-- 店铺申请栏-->
	<!-- cart model -->
	<div id="myModal" class="modal hide">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">&times;</button>
			<h3>购物车</h3>
		</div>
		<div class="modal-body">
			<table id="Cart" class="table table-striped" width="100%"></table>
		</div>
	</div>
	<!--cart model -->
	<!-- storeInfo model -->
	<div id="storeInfoModal" class="modal hide">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">&times;</button>
			<h3>店铺详细信息</h3>
		</div>
		<div class="modal-body" id="storeInfoDiv">
			
		</div>
	</div>
	<!--storeInfo model -->
	<!-- showBuyWay model -->
	<div id="showBuyWayModal" class="modal hide" >
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">&times;</button>
			<h3>支付方式</h3>
		</div>
		<div class="modal-body" id="showBuyWayDiv" style="height: 350px;">
			
		</div>
	</div>
	<!--showBuyWay model -->
	<!-- comment alert -->
	<div id="commentAlert" class="modal hide">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">&times;</button>
			<h3>确认成功</h3>
		</div>
		<div class="modal-body">
			<p>是否要对菜品评价</p>
		</div>
		<div class="modal-footer">
			<a data-dismiss="modal" class="btn btn-primary" href="#" onclick="{$('#addcommentModal').modal('show')}">是</a>
			<a data-dismiss="modal" class="btn close" onclick="getOrder()">不</a>
		</div>
	</div>
	<!-- comment alert -->
	<!--getcomment model -->
		<div id="commentModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>评论内容</h3>
			</div>
		<div class="modal-body">
			<table id="commentTable"  class="table table-striped">
				
			</table>
		</div>
	</div>
	<!--getcomment model -->
	<!-- addcomment model -->
	<div id="addcommentModal" class="modal hide">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button">&times;</button>
			<h3>评价</h3>
		</div>
		<div class="modal-body">
			<input type="hidden"  id="getStar"/><br />
			分数:<div id="comStar"></div><br />
			<input type="hidden" name="coOid" id="aCoOid"/><br />
			评论内容:<input type="text" id="coContent" class="input-xlarge focused"/><br />
			<input type="button" class="btn btn-primary" value="提交" onclick="comment()"> 
		</div>
	</div>
	<!--addcomment model -->
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
				用户名称<input type="text" id="muName" name="uName"><br />
				用户手机<input type="text" id="muPhone" name="uPhone"><br />
				用户所属街道<input type="text" id="muStreet" name="uStreet" ><br />
				用户详细地址<input type="text" id="muAddress" name="uAddress" ><br />
				<input type="hidden" id="muPwd" name="uPwd"><br />
				<input type="hidden" id="muAccount" name="uAccount"><br />
				<input type="submit" class="btn btn-danger"  value="修改" />
			</form>
		</div>
	</div>
	<!--changeUserInfo model -->
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
				确认新密码<input type="password" id="muStreet" data-rule="确认密码: required;match(nPwd);" name="uStreet" ><br />
				<input type="submit"  class="btn btn-primary pull-right"  value="修改" />
			</form>
		</div>
	</div>
	<!--changepwd model -->
	</div>
        </div>
    </body>	
</html>