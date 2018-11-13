<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <style>
        *{margin: 0;padding: 0;}
        .bg{position: relative;}
        .img1{width:100%;height: 670px;}
        .img2{margin-left: 20px;}
        form div{margin-bottom: 10px;}

        #login{
            width:389px;
            height: 360px;
            background: #fff;
            position: absolute;
            top: 142px;
            left: 758px;
        }
        input{
            width:260px;
            height: 25px;
        }
        .blue{
            width: 100%;
            height: 120px;
            background: #74C6EC;
            padding-top: 30px;
            padding-left: 80px;
            box-sizing: border-box;
            font-size: 28px;
            color: #FFF;
        }
        input[type=submit]{
            border: none;
            height: 50px;
            background: #74C6EC;
            border-radius: 5px;
            font-size: 16px;
            color: #FFF;
            letter-spacing: 10px;
        }
    </style>
</head>
<body>
<div class="bg">
    <img src="img/11.jpg" class="img1">
    <div id="login">
        <div class="blue"><b>持明法州管理系统</b></div>
        <div>
            <form action="" method="post" id="form" style="text-align: center;padding-top: 30px" class="easyui-form">
                <div><input type="text" name="name" class="easyui-textbox" data-options="required:true,iconCls:'icon-man',missingMessage:'用户名必填',iconAlign:'left',iconWidth:45"></div>
                <div><input type="text" name="password" class="easyui-passwordbox" data-options="required:true,missingMessage:'密码必填',iconAlign:'left',iconWidth:45"></div>
                <div><input type="text" style="width:160px;height:36px;margin-left: -20px;" name="code" class="easyui-textbox" data-options="required:true,iconCls:'icon-edit',missingMessage:'验证码必填',iconAlign:'left',iconWidth:45"><img src="${pageContext.request.contextPath}/ValidationCodeServlet"  class="img2" onclick="this.src='${pageContext.request.contextPath}/ValidationCodeServlet?d='+Math.random();"></div>
                <div><input type="submit" value="登录" class="easyui-linkbutton"></div>
            </form>
        </div>

    </div>
</div>
</body>
</html>
<script>
    $(function () {

        $("#form").form('submit',{
            url:'${pageContext.request.contextPath}/admin/login',
            success:function (result) {
                if(result=="back/login"){
                    location.href="${pageContext.request.contextPath}/back/login.jsp";
                }else{
                    location.href="${pageContext.request.contextPath}/back/main/main.jsp";
                }
            }
        })



    })

</script>