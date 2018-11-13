<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<table id="showArticles"></table>
<div id="tool">
    <a class="easyui-linkbutton" id="del" data-options="iconCls:'icon-remove'"  onclick="del()">批量删除</a>
    <a class="easyui-linkbutton" id="add" data-options="iconCls:'icon-add'"  onclick="add()">增加</a>
</div>
<div id="addArticleDialog"></div>
<div id="modifyArticleDialog"></div>
<script>
    $(function () {
        $("#showArticles").edatagrid({
            width:500,
            height:250,
            remoteSort:false,
            nowrap:false,
            fit:true,
            fitColumns:true,
            pagination:true,
            pageSize:3,
            toolbar:'#tool',
            singleSelect:false,
            pageList:[2,3,4,5,6,7,8,9,10],
            autoSave:true,
            url: '${pageContext.request.contextPath}/article/findByPage',
            destroyUrl:'${pageContext.request.contextPath}/article/removeArticle',
            saveUrl:'${pageContext.request.contextPath}/article/addArticle',

            columns:[[
                {field:'id',title:'id',width:100,checkbox:true},
                {field:'headPic',title:'上师头像',formatter:function (val,row) {
                        if(row.guru.headPic){
                            return row.guru.headPic;
                        }
                    }},
                {field:'title',title:'文章标题'},
                {field:'imgPath',title:'文章插图'},
                {field:'content',title:'文章内容',width:100},
                {field:'publishDate',title:'发布时间',sortable:true},

            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="/cmfz_kjh/' + rowData.imgPath + '" style="height:95px;width:150px"></td>' +
                    '<td style="border:0">' +
                    '<div style=\'margin-bottom: 8px;margin-left: 10px\'>文章标题: ' + rowData.title + '</div>' +
                    '<div style=\'margin-bottom: 8px;margin-left: 10px\'>上师: ' + rowData.guru.name + '</div>' +
                    '<div style=\'margin-bottom: 8px;margin-left: 10px\'><button class="easyui-linkbutton" onclick="modifyArticle('+rowData.id+')">修改</button> ' +
                    '</td>' +
                    '</tr></table>';
            }
        })
    })
    function del() {
        $("#showArticles").edatagrid('destroyRow');
    }
    function add() {
        $("#addArticleDialog").dialog({
            width:400,
            height:300,
            title:'添加文章',
            iconCls:'icon-edit',
            href:'${pageContext.request.contextPath}/back/article/form.jsp',
            buttons:[
                {
                    text:'确定添加',
                    iconCls:'icon-add',
                    handler:function () {
                        $("#addArticleForm").form('submit',{
                            url:'${pageContext.request.contextPath}/article/addArticle',
                            success:function (result) {
                                $.messager.show({
                                    width:200,
                                    height:100,
                                    showType:'slide',
                                    msg:'添加成功..',
                                    title:'系统提示',
                                    iconCls:'icon-help'
                                });
                                $("#showArticles").edatagrid('reload');
                                $("#addArticleDialog").dialog('close');
                            }
                        })
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function () {
                        $("#addArticleDialog").dialog('close')
                    }
                }
            ]
        })
    }

    function modifyArticle(id) {
        $("#modifyArticleDialog").dialog({
            width:400,
            height:300,
            title:'添加图片',
            iconCls:'icon-edit',
            href:'${pageContext.request.contextPath}/back/article/modifyForm.jsp?id='+id,
            cache:false,
            buttons:[{
                text:'修改文章',
                iconCls:'icon-edit',
                handler:function () {
                    $("#modifyArticleForm").form('submit',{
                        url:'${pageContext.request.contextPath}/article/modifyArticle',
                        success:function (result) {
                            $("#modifyArticleDialog").dialog('close');
                            $.messager.show({
                                width:200,
                                height:100,
                                showType:'slide',
                                msg:'信息修改成功..',
                                title:'系统提示',
                                iconCls:'icon-help'
                            });
                            $("#showArticles").edatagrid('reload');
                        }
                    })
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function () {
                    $("#modifyArticleDialog").dialog('close');
                }
            }],
        })
    }
</script>