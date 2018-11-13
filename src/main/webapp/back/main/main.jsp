<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/css/header.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.etree.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/md5.js"></script>
    <style>
        #addBannerForm div,#modifyBannerForm div,#scFrom div,#alterAlbum div,#addChapter div,#addArticleForm div,#modifyArticleForm div{margin-bottom: 10px}
    </style>
</head>
<body class="easyui-layout" style="margin: 0;padding: 0">
    <%--页头部分--%>
    <div data-options="region:'north',split:false,href:'${pageContext.request.contextPath}/back/main/header.jsp'" style="height:50px;">
    </div>
    <%--左边--%>
    <div data-options="region:'west',split:true,title:'持明法州数据管理'" style="width:200px;">
        <%--创建菜单容器--%>
        <div id="menuAccordion" class="easyui-accordion" data-options="fit:true">

        </div>
    </div>
    <%--内容部分--%>
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
        <div id="menuManagerTabs" class="easyui-tabs" data-options="fit:true">
            <div class="easyui-tabs" data-options="title:'首页',"><img src="${pageContext.request.contextPath}/back/img/home.jpg" style="height: 100%;width:1300px"></div>
        </div>
    </div>

    <%--页脚--%>
    <div data-options="region:'south',split:true,href:'${pageContext.request.contextPath}/back/main/footer.jsp'" style="width:100%;height:30px;background: #74C6EC;line-height: 20px;text-align: center;color: #FFF"></div>
</body>
</html>
<script>
    $(function () {
        /*拿到菜单数据*/
        $.post("${pageContext.request.contextPath}/menu/findAll",function (menu) {
            /*便历所有一级菜单*/
            $.each(menu,function (index,m) {
                /*便历所有二级菜单*/
                var content="<div style='text-align: center;padding-top: 7px'>";
                $.each(m.children,function (idx,child) {
                    /*将子元素对象作为参数传入*/
                    content+="<a onclick=\"addTabs('"+child.title+"','"+child.iconCls+"','"+child.href+"')\" style='width:96%;margin-bottom: 7px;border:1px solid #95B8E7' class='easyui-linkbutton' data-options=\"iconCls:'"+child.iconCls+"',plain:true\">"+child.title+"</a>";
                })
                content+="</div>";
                /*添加菜单组件元素*/
                $("#menuAccordion").accordion('add',{
                    title:m.title,
                    iconCls:m.iconCls,
                    content:content,
                })
            })
        })

    });

    function addTabs(title,iconCls,href) {
        if(!$("#menuManagerTabs").tabs('exists',title)){
            $("#menuManagerTabs").tabs('add',{
                title:title,
                iconCls:iconCls,
                closable:true,
                href:"${pageContext.request.contextPath}/"+href,
                fit:true,
            })
        }else{
            $("#menuManagerTabs").tabs('select',title);
        }

    }
</script>