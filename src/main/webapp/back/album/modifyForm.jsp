<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<form class="easyui-form" enctype="multipart/form-data" id="alterAlbum" style="padding-top: 30px;text-align: center" method="post">
    <div style="visibility: hidden">id:&nbsp;<input name="id" class="easyui-textbox"/></div>
    <div><input class="easyui-textbox" name="title" data-options="required:true,missingMessage:'标题必填'"></div>
    <div><input class="easyui-numberbox" name="count" data-options="required:true,missingMessage:'集数必填'"></div>
    <div><input class="easyui-filebox" name="imgUrl" data-options="required:true,missingMessage:'图片必填'"></div>
    <div><input class="easyui-numberbox" name="star" data-options="required:true,missingMessage:'评价必填'"></div>
    <div><input class="easyui-textbox" name="author" data-options="required:true,missingMessage:'作者必填'"></div>
    <div><input class="easyui-textbox" name="broadCast" data-options="required:true,missingMessage:'播音必填'"></div>
    <div><input class="easyui-textbox" name="brief" data-options="required:true,missingMessage:'简介必填'"></div>
</form>
<script>
    $(function () {
        $("#alterAlbum").form('load','${pageContext.request.contextPath}/album/findOneById?id=${param.id}')
    })
</script>