<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>宅食网上订餐系统 登陆界面</title>
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
        
        <link rel="stylesheet" type="text/css" href="resources/res/passport/css/login.css?v=3.9">
<script>
	$(function(){
	
	$('#registerFrom').bind('valid.form', function(){
	//disable the default form submission
        event.preventDefault();
        //grab all form data  
        var formData = new FormData($(this)[0]);
        $.ajax({
            url: 'register',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                $.jGrowl("注册成功");
               	$("#registerModal").modal("hide");
            },
            error: function(){
                $.jGrowl("注册失败");
            }
        });

        return false;
		
	});
	
	
	})
function login(){
	
	var account = $('#account').val();
	var pwd = $("#pwd").val();
//	location.href="login?uAccount="+account+"&uPwd="+pwd;
	$.ajax({
		type : "post",
		url : "checkUser",
		data:"uAccount="+account+"&uPwd="+pwd,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		success : function(result) {
			if(result!=true){
				
				$("#errModal").modal("show");
			}else{
			location.href="AllStore";
			}
		}
	});
}
function salerLogin(){
	
	var account = $('#account').val();
	var pwd = $("#pwd").val();
//	location.href="login?uAccount="+account+"&uPwd="+pwd;
	$.ajax({
		type : "post",
		url : "salerLogin",
		data:"uAccount="+account+"&uPwd="+pwd,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		success : function(result) {
			if(result!=true){
				$("#errModal").modal("show");
				
			}else{
			location.href="FoodManager";
			}
		}
	});
}
function adminLogin(){
	var account = $('#account').val();
	var pwd = $("#pwd").val();
//	location.href="login?uAccount="+account+"&uPwd="+pwd;
	$.ajax({
		type : "post",
		url : "adminLogin",
		data:"uAccount="+account+"&uPwd="+pwd,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType:"json",
		success : function(result) {
			if(result!=true){
				$("#errModal").modal("show");
			}else{
			
			location.href="StoreManager";
			}
		}	
	});
}
function showRegister(){
	$("#registerModal").modal("show");
}
</script>
</head>
<body class="login-alone " >
<!--
	版本1
<h2>login</h2>
name:<input type="text" value="bruce" id="account"><br>
pwd:<input type="password" value="123" id="pwd"><br>
<input type="button" value="login" onclick="login()"><br>
<input type="button" value="salerLogin" onclick="salerLogin()">-->
<!--	版本2 
	<div class="container">

    <div class="container">

      <form class="form-signin" action="javascript:;" >
        <h2 class="form-signin-heading">请登录</h2>
        <button class="form-signin-heading pull-right" onclick="adminLogin()"><i class="icon-user"></i></button>
        <input type="text" class="input-block-level" placeholder="输入账户" id="account">
        <input type="password" class="input-block-level" placeholder="输入密码" id="pwd">
        
        <div  style="margin-top:30px;">
        	<div>
			<button type="button" class="btn btn-large btn-primary pull-left" onclick="login()">登陆</button>
			<button type="button" class="btn  btn-large btn-info " onclick="showRegister()">注册</button>
			</div>
			<button type="button" class="btn btn-large btn-block"  onclick="salerLogin()">商家登陆</button>
			
		</div>
		
      </form>

    </div> /container 
    </div>-->
     <div class="logina-logo" style="height: 130px">
            <a href="">
                <img src="resources/images/logo.png" height="60" alt="">
            </a>
        </div>
        <div class="logina-main main clearfix">
            <div class="tab-con">
                <form id="form-login" method="post" action="passport/ajax-login">
                    <div id='login-error' class="error-tip"></div>
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <th>账户</th>
                                <td width="245">
                                    <input  type="text" id="account" placeholder="请输入账户" autocomplete="off" value=""></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>密码</th>
                                <td width="245">
                                    <input type="password" id="pwd" placeholder="请输入密码" autocomplete="off">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td width="245"><input class="btn btn-primary" style="width: 112.5px;" type="button" onclick="login()" value="登  录">
                                	<input class="btn btn-inverse" style="width: 112.5px;" type="button" onclick="salerLogin()" value="商家登陆">
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td width="245"><input class="btn " type="button" onclick="adminLogin()" value="管理员登陆"></td>
                                <td></td>
                            </tr>
                            
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="reg">
                <p>还没有账号？<br>赶快免费注册一个吧！</p>
                <a class="reg-btn"  onclick="showRegister()">立即免费注册</a>
            </div>
        </div>
    <!-- 错误提示 -->
    <div id="errModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>登陆失败！</h3>
			</div>
		<div class="modal-body">
			请检查你的账号密码权限是否正确
		</div>
	</div>
	<!-- -->
	<!-- register-->
    <div id="registerModal" class="modal hide">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button">&times;</button>
				<h3>欢迎注册</h3>
			</div>
		<div class="modal-body">
			<form id="registerFrom" action="javascript:;" method="post" >
			<input type="hidden"   name="uPower" value="1"><br />
			账号名称<input type="text"  data-rule="账号名称:required;username;" name="uAccount"><br />
			账号密码<input type="password" data-rule="账号密码:required;password" id="uPwd" name="uPwd"><br />
			确认密码<input type="password" data-rule="确认密码:required;match(uPwd)" id="qePwd" ><br />
			用户名称<input type="text"  data-rule="用户名称:required" name="uName"><br />
			送货街道<input type="text"  data-rule="送货街道:required" name="uStreet"><br />
			详细地址<input type="text"  data-rule="详细地址:required" name="uAddress"><br />
			手机号码<input type="text"  data-rule="手机号:required;mobile" name="uPhone"><br />
			<input type="submit"  class="btn btn-warning pull-right"  value="注册" />
			</form>
		</div>
	</div>
	<!-- -->

  </body>
</html>
