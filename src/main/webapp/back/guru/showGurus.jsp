<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<table id="guruTab" style="width:600px;height:200px">
    <thead>
    <tr>
        <th field="id" data-options="checkbox:true">id</th>
        <th field="name" width="100" editor="text">姓名</th>
        <th field="headPic" width="100"  editor="text">头像</th>
        <th field="sex" width="100" editor="text" >性别</th>
    </tr>
    </thead>
</table>
<div id="uploadGuruDialog"></div>
<div id="tool">
    <a class="easyui-linkbutton" id="add" data-options="iconCls:'icon-add'" onclick="add()">增加</a>
    <a class="easyui-linkbutton" id="del" data-options="iconCls:'icon-remove'"  onclick="del()">批量删除</a>
    <a class="easyui-linkbutton" id="sc" data-options="iconCls:'icon-filter'" onclick="uploadGuruImg()">上传头像</a>
</div>
<script>
    $('#guruTab').edatagrid({
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
        url: '${pageContext.request.contextPath}/guru/findByPage',
        saveUrl:'${pageContext.request.contextPath}/guru/addGuru',
        destroyUrl:'${pageContext.request.contextPath}/guru/removeGuru',
        updateUrl:'${pageContext.request.contextPath}/guru/modifyGuru',
        view: detailview,
        detailFormatter: function(rowIndex, rowData){
            return '<table><tr>' +
                '<td rowspan=2 style="border:0"><img src="/cmfz_kjh/' + rowData.headPic + '" style="height:95px;width:150px"></td>' +
                '<td style="border:0">' +
                '<div style=\'margin-bottom: 8px;margin-left: 10px\'>姓名: ' + rowData.name + '</div>' +
                '<div style=\'margin-bottom: 8px;margin-left: 10px\'>性别: ' + rowData.sex + '</div>' +
                '</td>' +
                '</tr></table>';
        }


    });
    function add(){
        $('#guruTab').edatagrid('addRow');
    }
    function del() {
        $("#guruTab").edatagrid('destroyRow');
    }

    function uploadGuruImg(){
        $("#uploadGuruDialog").dialog({
            width:400,
            height:200,
            title:'修改上师',
            iconCls:'icon-edit',
            href:'${pageContext.request.contextPath}/back/guru/uploadGuruImg.jsp',
            buttons:[
                {
                    text:'确定修改',
                    iconCls:'icon-add',
                    handler:function () {
                        $("#uploadForm").form('submit',{
                            url:'${pageContext.request.contextPath}/guru/uploadGuruImg',
                            success:function (result) {
                                $.messager.show({
                                    width:200,
                                    height:100,
                                    showType:'slide',
                                    msg:'修改成功..',
                                    title:'系统提示',
                                    iconCls:'icon-help'
                                });
                                $("#guruTab").edatagrid('reload');
                                $("#uploadGuruDialog").dialog('close');
                            }
                        })
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function () {
                        $("#uploadGuruDialog").dialog('close')
                    }
                }
            ]
        })
    }


</script>