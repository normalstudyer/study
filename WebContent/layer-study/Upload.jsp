<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/29
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    session.setAttribute("path", path);
    session.setAttribute("basePath",basePath);
%>
<html>
<head>
    <title>upload模块快速使用</title>
    <script src="${basePath}layer-v3.1.1/layer/layer.js"></script>
    <script src="${basePath}jquery/jquery-3.3.1.min.js"></script>

    <script src="${basePath}layui-v2.4.1/layui/layui.js"></script>
    <link rel="stylesheet" href="${basePath}layui-v2.4.1/layui/css/layui.css">
</head>
<body>
<button type="button" class="layui-btn" id="test1">
    <i class="layui-icon">&#xe67c;</i>上传图片
</button>
<div class="layui-upload-list"  style="height: 200px;">
    <img class="layui-upload-img" id="test-upload-normal-img" style="height:100px;">
    <p id="test-upload-demoText"></p>
</div>
<script>
    layui.use('upload',function(){
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem:'#test1',//绑定元素
            data:{name:'1111'},
            url:'${basePath}root/upload',//上传接口
            before:function(obj){
              //预读本地文件实例
                obj.preview(function (index,file,result) {
                    $("#test-upload-normal-img").attr("src",result);
                });
            },
            done:function(res){
                //上传完毕回调
                if(res.code>0){
                    layer.msg("上传失败");
                }else{
                    layer.msg("上传成功");
                }
                console.log(res);
            },
            error:function () {
                //请求异常回调
                var demoText = $("#test-upload-demoText");
                demoText.html('<span style="color:#FF5722;">上传失败</span><a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click',function(){
                    uploadInst.upload();
                });
            }
        });
    });
</script>
<%--<button type="button" class="layui-btn layui-btn-primary" id="picList">

    <i class="layui-icon">&#xe61f;</i>选择文件

</button>

<button type="button" class="layui-btn" id="manyPicUpload">
    <i class="layui-icon"></i>开始上传

</button>
<script>
layui.use('upload',function() {
var $ = layui.jquery, upload = layui.upload;

//图片上传
upload.render({
elem : '#test2',
url : 'root/upload',
multiple : false,
auto : false,
bindAction : '#1vnupload',
before : function(obj) {
//预读本地文件示例，不支持ie8
obj.preview(function(index,file, result) {
$('#1vNCompare').empty();
$('#1vNCompare').append('<div class="thumbnail text-overflow" style="text-align: center;">'
    + '<img src="' + result + '" />'
    + '<h3>'
        + "原始图片"
        + '</h3>'
    + '</div>');
});
},
done : function(res) {
//上传完毕
}
});

//多文件列表示例
var ListView = $('#uploadList'), uploadListIns = upload
.render({
elem : '#picList', //表示单击某按钮激发上传
url : 'root/upload', //文件上传路径
accept : 'file',  //文件上传格式默认为image
multiple : true,//是否多文件上传true是多文件
auto : false,//是否自动上传
bindAction : '#manyPicUpload',//点击上传和auto:fasle组合使用
data : {  //其它需要传递的数据 支持下面这样动态传值
repname : function() {
var uploadName =""+ $("#uploadName").val();
var selectbank_1=""+$("#selectbank_1").text();
if(uploadName!==''){
return uploadName;
}
return selectbank_1;
}
},
choose : function(obj) { //选择上传的文件
var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
//设置总文件数量计算初始值
var j=0;
//读取本地文件
obj.preview(function(index,file, result) {
j++;
/* alert(j); */
var tr = $(['<tr id="upload-' + index + '">','<td>'
    + file.name
    + '</td>','<td>'+ (file.size / 1014).toFixed(1)
    + 'kb</td>',
    '<td>等待上传</td>',
    '<td>',
        '<button class="layui-btn layui-btn-mini img-reload layui-hide">重传</button>',
        '<button class="layui-btn layui-btn-mini layui-btn-danger img-delete">删除</button>',
        '</td>',
    '</tr>' ]
.join(''));

//单个重传
tr.find('.img-reload').on('click',
function() {
obj.upload(index,file);
});

//删除
tr.find('.img-delete').on('click',
function() {
delete files[index]; //删除对应的文件
tr.remove();
uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
});

ListView.append(tr);
});
//将文件总数j显现到页面

},
done : function(res, index, upload) {//上传后返回的结果
i++;
alert(i);
if (res.code == 0) { //上传成功
var tr = ListView.find('tr#upload-'+ index), tds = tr.children();
tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
tds.eq(3).html(''); //清空操作
return delete this.files[index]; //删除文件队列已经上传成功的文件
}
this.error(index, upload);
},
error : function(index, upload) {
var tr = ListView.find('tr#upload-'
+ index), tds = tr.children();
tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
tds.eq(3).find('.img-reload').removeClass('layui-hide'); //显示重传
}
});
});
</script>--%>
</body>
</html>
