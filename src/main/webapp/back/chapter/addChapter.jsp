<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<form id="addChapter" method="post" enctype="multipart/form-data" style="text-align: center;padding-top: 30px">
    <div><input type="text" name="title" class="easyui-textbox" data-options="required:true,missingMessage:'标题必填'"></div>
    <div><input type="text" name="size" class="easyui-textbox" data-options="required:true,missingMessage:'大小必填'"></div>
    <div><input type="text" name="duration" class="easyui-textbox" data-options="required:true,missingMessage:'时长必填'"></div>
    <div><input type="text" name="music" class="easyui-filebox" data-options="required:true,missingMessage:'文件必选'"></div>
    <div><input type="text" name="albumId" class="easyui-combobox" data-options="required:true,missingMessage:'请选择所在专辑',valueField:'id',textField:'title',url:'${pageContext.request.contextPath}/album/findAll'" /></div>
</form>