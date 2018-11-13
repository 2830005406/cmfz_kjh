<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center;padding-top: 30px">
    <form method="post" id="modifyForm" class="easyui-form">
        <div style="visibility: hidden">id:&nbsp;<input id="id" name="id" class="easyui-textbox" type="text"/></div>
        <div>新密码:&nbsp;<input id="password" name="password" class="easyui-validatebox" required="true" type="password" missingMessage="请输入修改您的新密码" data-options="iconCls:'icon-lock'"/></div>         
        <div>请确认:&nbsp;<input type="password" name="repassword" id="repassword" required="true" class="easyui-validatebox"  validType="equalTo['#password']"  data-options="iconCls:'icon-lock'" missingMessage="请再次确认" invalidMessage="两次输入密码不一致"/></div>
    </form>
</div>
<script>
    $(function () {
        $.extend($.fn.validatebox.defaults.rules, {
            /*必须和某个字段相等*/
            equalTo: { validator: function (value, param) { return $(param[0]).val() == value; }, message: '字段不匹配' }
        });

        $("#modifyForm").form('load','${pageContext.request.contextPath}/admin/findOneByAdminId?id=${param.id}')
    })

</script>