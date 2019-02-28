$(function(){
	
	$('#registerFrom').bind('valid.form', function(){
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
			location.href="FoodManagerInfo";
			}
		}
	});
}
function adminLogin(){
	var account = $('#account').val();
	var pwd = $("#pwd").val();
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