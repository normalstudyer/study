<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/29
  Time: 13:15
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
    <title>选择多图片上传</title>
    <script src="${basePath}jquery/jquery-3.3.1.min.js"></script><%--由于粗心，把3.3.1写成3.1.1导致modal框总是无法出现--%>
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="${basePath}layui-v2.4.1/layui/layui.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--<script src="${basePath}bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${basePath}bootstrap/css/bootstrap.css">--%>
    <link rel="stylesheet" href="${basePath}layui-v2.4.1/layui/css/layui.css">
    <script>
        /*function showUploadModal(id) {
            //动态赋值
            uploadListIns.config.data.tableRecordId = id;
            uploadListIns.config.data.filenamePrefix = id+".自检pass.";
            $("#uploadModal").modal("show");
        }*/
       /* $(document).ready(function(){
            $("#uploadModal").modal("show");
        })*/
       /* $(function(){
            $("#uploadModal1").modal("show");
        })*/
    </script>
    <script>
        $(function(){
            //多文件列表示例
            /**
             * 图片上传
             */
            var uploadListIns;
            layui.use('upload', function(){
                var $ = layui.jquery,upload = layui.upload;
                var demoListView = $('#proImageList');
                uploadListIns = upload.render({
                    elem: '#chooseFile',   //选择文件的按钮
                    url: '${basePath}root/uploadPic',   //后台处理文件长传的方法
                    data:{'serviceName':'外协订单供应商上传检验报告','tableName':'T_OUTSOURCE_ORDER','fileType':'图片'},
                    accept: 'file',
                    multiple: true,     //是否允许多文件上传
                    acceptMime: 'image/*',  //规定打开文件选择框时，筛选出的文件类型
                    field:'upload',
                    auto: false,
                    bindAction: '#upload',   //用来触发上传的按钮ID
                    choose: function(obj){    //选择文件后的回调函数，本例中在此将选择的文件进行展示
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        //读取本地文件
                        obj.preview(function(index, file, result){
                            var tr = $(['<tr id="upload-'+ index +'">'
                                ,'<td>'+ file.name +'</td>'
                                ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
                                ,'<td>等待上传</td>'
                                ,'<td>'
                                ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                                ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                                ,'</td>'
                                ,'</tr>'].join(''));

                            //单个重传
                            tr.find('.demo-reload').on('click', function(){
                                obj.upload(index, file);

                            });

                            //删除
                            tr.find('.demo-delete').on('click', function(){
                                delete files[index]; //删除对应的文件
                                tr.remove();
                                uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                            });
                            demoListView.append(tr);
                        });
                    },
                    done: function(res, index, upload){              //多文件上传时，只要有一个文件上传成功后就会触发这个回调函数
                        console.info(res);
                        if(res.status == "success"){ //上传成功
                            var tr = demoListView.find('tr#upload-'+ index)
                                ,tds = tr.children();
                            tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                            tds.eq(3).html('<a href="'+res.url+'">查看</a>'); //清空操作
                            return delete this.files[index]; //删除文件队列已经上传成功的文件
                        }else{
                            alert(res.message);
                        }
                        this.error(index, upload);
                    },
                    allDone: function(obj){ //当文件全部被提交后，才触发
                        if(obj.total > obj.successful){
                            layer.msg("有文件上传失败，暂不更新生产进度，请重试或联系管理员");
                        }else {
                            //更新生产进度
                            updateProductionSchedule(currentId, currentSchedule);
                        }
                    },
                    error: function(index, upload){
                        var tr = demoListView.find('tr#upload-'+ index)
                            ,tds = tr.children();
                        tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                        tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
                    }
                });
                $(".layui-upload-file").hide();
            });
        })
    </script>
</head>
<body>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-sm-5" data-toggle="modal" data-target="#uploadModal1">
    开始演示模态框
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="uploadModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    上传检验报告
                </h4>
            </div>
            <div class="modal-body">
                <button type="button" class="btn btn-primary" id="chooseFile">选择多文件</button>
                <button type="button" class="btn btn-success" id="upload">开始上传</button>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead><tr>
                            <th>文件名</th>
                            <th>大小</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr></thead>
                        <tbody id="proImageList"></tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
