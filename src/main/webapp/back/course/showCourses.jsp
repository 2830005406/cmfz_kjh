<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<table id="showCourses"></table>
<div id="tool">
    <a class="easyui-linkbutton" id="add" data-options="iconCls:'icon-add'" onclick="add()">增加</a>
    <a class="easyui-linkbutton" id="del" data-options="iconCls:'icon-remove'"  onclick="del()">批量删除</a>
</div>
<div id="addCourseDialog"></div>
<div id="modifyCourseDialog"></div>
<script>
    $(function () {
        $("#showCourses").datagrid({
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
            url:'${pageContext.request.contextPath}/course/findByPage',
            columns:[[
                {field:'id',title:'id',checkbox:true},
                {field:'username',title:'用户名',width:100,formatter:function (val,rows,index) {
                        return rows.user[0].username
                    }},
                {field:'nickname',title:'昵称',width:100,formatter:function (val,rows,index) {
                        return rows.user[0].nickname
                    }},
                {field:'title',title:'必修课',width:100},
                {field:'marking',title:'标示',width:100},
                {field:'createTime',title:'创建时间',width:100,sortable:true},

                {title:'操作',field:'options',width:200,formatter:function (value,row,index) {
                        return "<a href='javascript:;' id='modifyCourse' class='easyui-linkbutton' onclick='modifyCourse("+row.id+")'>修改</a>"
                    }}
            ]],
        })

    })

    function del() {
        var rows = $("#showCourses").datagrid('getSelections');
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
                url:"${pageContext.request.contextPath}/course/removeCourse",
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
                    $("#showCourses").datagrid('reload');
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

    function add() {
        $("#addCourseDialog").dialog({
            width:400,
            height:200,
            title:'添加课程',
            iconCls:'icon-add',
            href:'${pageContext.request.contextPath}/back/course/addCourse.jsp',
            buttons:[
                {
                    text:'确定添加',
                    iconCls:'icon-add',
                    handler:function () {
                        $("#addCourse").form('submit',{
                            url:'${pageContext.request.contextPath}/course/addCourse',
                            success:function (result) {
                                $.messager.show({
                                    width:200,
                                    height:100,
                                    showType:'slide',
                                    msg:'添加成功..',
                                    title:'系统提示',
                                    iconCls:'icon-help'
                                });
                                $("#showCourses").datagrid('reload');
                                $("#addCourseDialog").dialog('close');
                            }
                        })
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function () {
                        $("#addCourseDialog").dialog('close')
                    }
                }
            ]


        })
    }

    function modifyCourse(id) {
        $("#modifyCourseDialog").dialog({
            width:400,
            height:300,
            title:'添加功课',
            iconCls:'icon-edit',
            href:'${pageContext.request.contextPath}/back/course/modifyCourse.jsp?id='+id,
            cache:false,
            buttons:[{
                text:'确定修改',
                iconCls:'icon-edit',
                handler:function () {
                    $("#modifyCoursedsd").form('submit',{
                        url:'${pageContext.request.contextPath}/course/modifyCourse',
                        success:function (result) {
                            $("#modifyCourseDialog").dialog('close');
                            $.messager.show({
                                width:200,
                                height:100,
                                showType:'slide',
                                msg:'信息修改成功..',
                                title:'系统提示',
                                iconCls:'icon-help'
                            });
                            $("#showCourses").datagrid('reload');
                        }
                    })
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function () {
                    $("#modifyCourseDialog").dialog('close');
                }
            }],
        })
    }
</script>