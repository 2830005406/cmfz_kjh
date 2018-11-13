<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<form id="modifyCoursedsd" method="post" style="text-align: center;padding-top: 30px" class="easyui-form">
    <div style="visibility: hidden">id:&nbsp;<input id="id" name="id" class="easyui-textbox" type="text"/></div>
    <div><input type="text" name="title" class="easyui-textbox" data-options="required:true,missingMessage:'课程名必填'"></div>
    <div><input type="text" id="userId" name="userId" class="easyui-combobox" data-options="required:true,missingMessage:'请选择用户',valueField:'id',textField:'username',url:'${pageContext.request.contextPath}/user/findAll'" /></div>
</form>
<script>
    $(function () {
        $("#modifyCoursedsd").form('load','${pageContext.request.contextPath}/course/findOneById?id=${param.id}')
    })

</script>