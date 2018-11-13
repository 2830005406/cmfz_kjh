<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<table id="showAllUsers"></table>
<div id="tool">
    <a class="easyui-linkbutton" id="del" data-options="iconCls:'icon-remove'"  onclick="del()">批量删除</a>
</div>
<script>
    $(function () {
        $("#showAllUsers").datagrid({
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
            url:'${pageContext.request.contextPath}/user/findByPage',
            columns:[[
                {field:'id',title:'id',checkbox:true},
                {field:'phoneNumber',title:'手机号'},
                {field:'username',title:'用户名'},
                {field:'password',title:'密码',formatter:function (val,row) {
                        var pwd=hex_md5(row.password);
                        return pwd;
                    }},
                {field:'province',title:'省份'},
                {field:'city',title:'市区'},
                {field:'sex',title:'性别'},
                {field:'registDate',title:'注册时间'},
            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return "<table><tr>" +
                    "<td rowspan=2 style='border:0;height:130px'><img src='/cmfz_kjh/back/img/user/"+rowData.headPic+"' style='height:65px;width:100px'></td>" +
                    "<td style='border:0'>" +
                    "<div style='margin-bottom: 8px;margin-left: 10px'>昵称: " + rowData.nickname + "</div>" +
                    "<div style='margin-bottom: 8px;margin-left: 10px'>个性签名: " + rowData.sign + "</div>" +
                    "<div style='margin-bottom: 8px;margin-left: 10px'>状态: " + rowData.status + "</div>" +
                    "</td>" +
                    "</tr></table>";
            }

        })
    })

    function del() {
        var rows = $("#showAllUsers").datagrid('getSelections');
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
                url:"${pageContext.request.contextPath}/user/removeUser",
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
                    $("#showAllUsers").datagrid('reload');
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