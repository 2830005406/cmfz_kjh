<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<table id="bannerTab"></table>
<div id="tool">
    <a class="easyui-linkbutton" id="add" data-options="iconCls:'icon-add'" onclick="add()">增加</a>
    <a class="easyui-linkbutton" id="del" data-options="iconCls:'icon-remove'"  onclick="del()">批量删除</a>
</div>
<div id="addBannerDialog"></div>
<div id="modifyBannerDialog"></div>
<script>
    $(function () {
        $('#bannerTab').datagrid({
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
            url:'${pageContext.request.contextPath}/banner/findByPage',
            columns:[[
                {field:'id',title:'id',width:100,checkbox:true},
                {field:'title',title:'名字',width:100},
                {field:'status',title:'状态'},
                {field:'imgPath',title:'路径',width:100},
                {field:'deployDate',title:'发布时间',width:100,sortable:true},
                {title:'操作',field:'options',width:200,formatter:function (value,row,index) {
                        return "<a href='javascript:;' id='modifyBanner' class='easyui-linkbutton' onclick='modifyBanner("+row.id+")'>修改</a>"
                    }}
            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return "<table><tr>" +
                    "<td rowspan=2 style='border:0;height:130px'><img src='/cmfz_kjh"+rowData.imgPath+"' style='height:105px;width:200px'></td>" +
                    "<td style='border:0'>" +
                    "<div style='margin-bottom: 8px;margin-left: 10px'>发布时间: " + rowData.deployDate + "</div>" +
                    "<div style='margin-bottom: 8px;margin-left: 10px'>描述: " + rowData.description + "</div>" +
                    "<div style='margin-bottom: 8px;margin-left: 10px'>图片路径: " + rowData.imgPath + "</div>" +
                    "</td>" +
                    "</tr></table>";
            }

    })

    })

    function add() {
       $("#addBannerDialog").dialog({
           width:400,
           height:300,
           title:'添加图片',
           iconCls:'icon-edit',
           href:'${pageContext.request.contextPath}/back/banner/form.jsp',
           buttons:[
              {
                  text:'确定添加',
                  iconCls:'icon-add',
                  handler:function () {
                      $("#addBannerForm").form('submit',{
                          url:'${pageContext.request.contextPath}/banner/addBannerImg',
                           success:function (result) {
                               $.messager.show({
                                   width:200,
                                   height:100,
                                   showType:'slide',
                                   msg:'添加成功..',
                                   title:'系统提示',
                                   iconCls:'icon-help'
                               });
                               $("#bannerTab").datagrid('reload');
                               $("#addBannerDialog").dialog('close');
                           }
                       })
                   }
               },{
                   text:'取消',
                   iconCls:'icon-cancel',
                   handler:function () {
                       $("#addBannerDialog").dialog('close')
                   }
               }
           ]
       })
    }
    
    function del() {
        var rows = $("#bannerTab").datagrid('getSelections');
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
                url:"${pageContext.request.contextPath}/banner/removeBanner",
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
                    $("#bannerTab").datagrid('reload');
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
    function modifyBanner(id,img) {
        $("#modifyBannerDialog").dialog({
            width:400,
            height:300,
            title:'修改图片',
            iconCls:'icon-edit',
            href:'${pageContext.request.contextPath}/back/banner/modifyForm.jsp?id='+id+'&img='+img,
            cache:false,
            buttons:[{
                text:'修改',
                iconCls:'icon-edit',
                handler:function () {
                    $("#modifyBannerForm").form('submit',{
                        url:'${pageContext.request.contextPath}/banner/modifyBanner',
                        success:function (result) {
                            $("#modifyBannerDialog").dialog('close');
                            $.messager.show({
                                width:200,
                                height:100,
                                showType:'slide',
                                msg:'信息修改成功..',
                                title:'系统提示',
                                iconCls:'icon-help'
                            });
                            $("#bannerTab").datagrid('reload');
                        }
                    })
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function () {
                    $("#modifyBannerDialog").dialog('close');
                }
            }],
        })
    }
</script>