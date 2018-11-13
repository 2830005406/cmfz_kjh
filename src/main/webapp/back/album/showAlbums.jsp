<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<table id="showAlbums"></table>
<div id="tool">
    <a class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">增加</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-remove'"  onclick="del()">批量删除</a>
</div>
<div id="addAlbumDialog"></div>
<div id="modifyAlbumDialog"></div>
<script>
    $(function () {
        $("#showAlbums").datagrid({
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
            url:'${pageContext.request.contextPath}/album/findByPage',
            columns:[[
                {field:'id',title:'id',checkbox:true},
                {field:'title',title:'专辑名称'},
                {field:'publishDate',title:'出版日期'},
                {field:'count',title:'集数'},
                {field:'coverImg',title:'图片路径'},
                {field:'star',title:'评价星级'},
                {field:'author',title:'作者'},
                {field:'broadCast',title:'播音'},
                {field:'brief',title:'简介',width:250},
                {title:'操作',field:'options',width:50,formatter:function (value,row,index) {
                        return "<a href='javascript:;' id='modifyBanner' class='easyui-linkbutton' onclick='modifyAlbum("+row.id+")'>修改</a>"
                    }}
            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="/cmfz_kjh/' + rowData.coverImg + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>作者:' + rowData.author + '</p>' +
                    '<p>评价星级:' + rowData.star + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        })
    })

    function add() {
        $("#addAlbumDialog").dialog({
            width:400,
            height:400,
            title:'修改专辑',
            iconCls:'icon-add',
            href:'${pageContext.request.contextPath}/back/album/add.jsp',
            buttons:[
                {
                    text:'确定添加',
                    iconCls:'icon-add',
                    handler:function () {
                        $("#scFrom").form('submit',{
                            url:'${pageContext.request.contextPath}/album/addAlbum',
                            success:function (result) {
                                $.messager.show({
                                    width:200,
                                    height:100,
                                    showType:'slide',
                                    msg:'添加成功..',
                                    title:'系统提示',
                                    iconCls:'icon-help'
                                });
                                $("#showAlbums").datagrid('reload');
                                $("#addAlbumDialog").dialog('close');
                            }
                        })
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function () {
                        $("#addAlbumDialog").dialog('close')
                    }
                }
            ]
        })
    }
    function del() {
        var rows = $("#showAlbums").datagrid('getSelections');
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
                url:"${pageContext.request.contextPath}/album/removeAlbum",
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
                    $("#showAlbums").datagrid('reload');
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
    function modifyAlbum(id) {
        $("#modifyAlbumDialog").dialog({
            width:400,
            height:400,
            title:'修改专辑',
            iconCls:'icon-add',
            href:'${pageContext.request.contextPath}/back/album/modifyForm.jsp?id='+id,
            buttons:[
                {
                    text:'确定添加',
                    iconCls:'icon-add',
                    handler:function () {
                        $("#alterAlbum").form('submit',{
                            url:'${pageContext.request.contextPath}/album/modifyAlbum',
                            success:function (result) {
                                $.messager.show({
                                    width:200,
                                    height:100,
                                    showType:'slide',
                                    msg:'修改成功..',
                                    title:'系统提示',
                                    iconCls:'icon-help'
                                });
                                $("#showAlbums").datagrid('reload');
                                $("#modifyAlbumDialog").dialog('close');
                            }
                        })
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function () {
                        $("#modifyAlbumDialog").dialog('close')
                    }
                }
            ]
        })
    }


</script>
