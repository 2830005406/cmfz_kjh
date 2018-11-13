<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<div style="font-family: '华文楷体';width: 100%;height:100%;background:#74C6EC; color: #FFF;position: relative">
    <span id="logo"></span>
    <span id="title">持明法洲后台管理系统</span>
    <span id="welcome">欢迎您:&nbsp;&nbsp;&nbsp;<b style="color: red">${sessionScope.admin.name}</b></span>
    <span id="modifyPwd" ><a class="easyui-linkbutton" onclick="modifyPwd(${sessionScope.admin.id})" data-options="iconCls:'icon-edit',">修改密码</a></span>
    <span id="logout" ><a class="easyui-linkbutton" onclick="logout()" data-options="iconCls:'icon-cancel',">退出系统</a></span>
</div>
<div id="modifyDialog"></div>
<script>
    function modifyPwd(id) {
        $("#modifyDialog").dialog({
            width:400,
            height:300,
            title:'修改密码',
            iconCls:'icon-edit',
            href:'${pageContext.request.contextPath}/back/main/form.jsp?id='+id,
            buttons:[
                {
                    text:'确认修改',
                    iconCls:'icon-edit',
                    handler:function () {
                        $("#modifyForm").form('submit',{
                            url:'${pageContext.request.contextPath}/admin/modifyAdminPwd',
                            success:function (result) {
                                $.messager.show({
                                    width:200,
                                    height:100,
                                    showType:'slide',
                                    msg:'用户信息已失效..',
                                    title:'系统提示',
                                    iconCls:'icon-help'
                                });
                                location.href="${pageContext.request.contextPath}/admin/logout"
                                $("#modifyDialog").dialog('close');
                            }
                        })
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function () {
                        $("#modifyDialog").dialog('close')
                    }
                }
            ]
        })
    }
    function logout() {
        location.href="${pageContext.request.contextPath}/admin/logout";
    }
</script>