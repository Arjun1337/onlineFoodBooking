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