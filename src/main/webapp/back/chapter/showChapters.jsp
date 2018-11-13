<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<table id="showChapters"></table>
<div id="tool">
    <a class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">增加</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-remove'"  onclick="del()">批量删除</a>
</div>
<div id="addChapterDialog"></div>
<div id="modifyChapterDialog"></div>
<script>
    $(function () {
        $("#showChapters").datagrid({
            width:500,
            height:250,
            remoteSort:false,
            nowrap:false,
            fit:true,
            fitColumns:true,
            pagination:true,
            pageSize:3,
            toolbar:'#tool',
            pageList:[2,3,4,5,6,7,8,9,10],
            url:'${pageContext.request.contextPath}/chapter/findByPage',
            columns:[[
                {field:'id',title:'id',checkbox:true},
                {field:'title',title:'章节名称'},
                {field:'size',title:'文件大小'},
                {field:'duration',title:'时长'},
                {field:'downPath',title:'下载路径',width:100},
                {field:'uploadTime',title:'上传时间',width:50},
                {title:'操作',field:'options',width:50,formatter:function (value,row,index) {
                        return "<a href='#' onclick='news(\""+row.downPath+"\")'>下载</a>"
                    }}
            ]],

        })
    })

    function news(ds) {
        location.href='${pageContext.request.contextPath}/chapter/downloadChapter?fileName='+ds;
    }

    function add() {
        $("#addChapterDialog").dialog({
            width:400,
            height:400,
            title:'上传音频',
            iconCls:'icon-add',
            href:'${pageContext.request.contextPath}/back/chapter/addChapter.jsp',
            buttons:[
                {
                    text:'确定添加',
                    iconCls:'icon-add',
                    handler:function () {
                        $("#addChapter").form('submit',{
                            url:'${pageContext.request.contextPath}/chapter/addChapter',
                            success:function (result) {
                                $.messager.show({
                                    width:200,
                                    height:100,
                                    showType:'slide',
                                    msg:'添加成功..',
                                    title:'系统提示',
                                    iconCls:'icon-help'
                                });
                                $("#showChapters").datagrid('reload');
                                $("#addChapterDialog").dialog('close');
                            }
                        })
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function () {
                        $("#addChapterDialog").dialog('close')
                    }
                }
            ]


        })
    }

    function del() {
        var rows = $("#showChapters").datagrid('getSelections');
        if(rows.length==0){
            $.messager.show({
                width:200,
                height:100,
                showType:'slide',
                msg:'至少选中一行..',
                title:'系统提示',
                iconCls:'icon-help'
            });
        }else{
            var ids=[];
            for (var i = 0; i < rows.length; i++) {
                console.log(rows[i])
                ids.push(rows[i].id);
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/chapter/removeChapter",
                type:"POST",
                data:{id:ids},
                traditional:true,
                success:function () {
                    $.messager.show({
                        width:200,
                        height:100,
                        showType:'slide',
                        msg:'删除成功..',
                        title:'系统提示',
                        iconCls:'icon-help'
                    });
                    $("#showChapters").datagrid('reload');
                },
                error:function () {
                    $.messager.show({
                        width:200,
                        height:100,
                        showType:'slide',
                        msg:'删除失败..',
                        title:'系统提示',
                        iconCls:'icon-help'
                    });
                }
            })
        }
    }
</script>
