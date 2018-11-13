<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<div style="text-align: center">
    <form method="post" id="modifyBannerForm" class="easyui-form" enctype="multipart/form-data">
        <div style="visibility: hidden">id:&nbsp;<input id="id" name="id" class="easyui-textbox" type="text"/></div>
        <div><input type="text" class="easyui-textbox" name="title" data-options="required:true,missingMessage:'标题必填',iconCls:'icon-filter'"></div>
        <div><input type="text" id="imgPath" class="easyui-filebox" name="img" data-options="required:true,missingMessage:'图片必选',buttonText: '选择图片',"></div>
        <div><input id="description" type="text" name="description" class="easyui-textbox" data-options="required:true,missingMessage:'描述必填',iconCls:'icon-edit'"></div>

    </form>
</div>
<script>
    $(function () {
        $("#modifyBannerForm").form('load','${pageContext.request.contextPath}/banner/findOneById?id=${param.id}')
    })
</script>