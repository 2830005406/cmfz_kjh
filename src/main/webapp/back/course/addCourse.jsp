<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<form id="addCourse" method="post" style="text-align: center;padding-top: 30px">
    <div><input type="text" name="title" class="easyui-textbox" data-options="required:true,missingMessage:'课程名必填'"></div>
    <div><input type="text" name="userId" class="easyui-combobox" data-options="required:true,missingMessage:'请选择用户',valueField:'id',textField:'username',url:'${pageContext.request.contextPath}/user/findAll'" /></div>
</form>
