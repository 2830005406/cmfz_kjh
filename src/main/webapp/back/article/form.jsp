<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center;padding-top: 30px">
    <form method="post" id="addArticleForm" class="easyui-form" enctype="multipart/form-data">
        <div><input id="title" type="text" name="title" class="easyui-textbox" data-options="required:true,missingMessage:'标题必填',iconCls:'icon-filter'"></div>
        <div><input id="imgPath" type="text" name="img" class="easyui-filebox" data-options="required:true,missingMessage:'图片必选',buttonText: '选择图片',"></div>
        <div><input id="content" type="text" name="content" class="easyui-textbox" data-options="required:true,missingMessage:'描述必填',iconCls:'icon-edit'"></div>
        <div><input type="text" name="guruId" class="easyui-combobox" data-options="required:true,missingMessage:'请选择上师',valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/guru/findAll'" /></div>
    </form>
</div>
