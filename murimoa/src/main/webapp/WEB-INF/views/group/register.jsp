<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>무리모아</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <link rel="stylesheet" href="/resources/css/bootstrap.css">
  <link rel="stylesheet" href="/resources/css/font-awesome.css">
  <link rel="stylesheet" href="/resources/css/AdminLTE.css">
  <link rel="stylesheet" href="/resources/css/_all-skins.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="/WEB-INF/views/include/header.jsp" %>
  <%@include file="/WEB-INF/views/include/aside.jsp" %>
  
<div class="content-wrapper">
    <section class="content-header">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">그룹등록
            <small>Group Register</small>
          </h3>
        </div>

        <form role="form" method="post" action="/group/register" id='mainForm'>
          <div class="box-body">

            <div class="form-group">
              <label>이름 <small>(Name)</small></label>
              <input class="form-control" type="text" name="name" placeholder="Enter name">
            </div>
          </div>
        </form>

        <!-- /.box-body -->
        
        <div class="box-footer">
          <button id="cancelBtn" class="btn btn-default">취소</button>
          <button id="createGroup" type="submit" class="btn btn-primary pull-right">등록</button>
        </div>
        
      </div>
    </section>

  </div>
</div>
<form id='actionForm' method="get">
    
</form>

<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/jquery-ui.js"></script>

<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>

<script src="/resources/js/bootstrap.js"></script>
<script src="/resources/js/adminlte.js"></script>
<script>
var actionForm = $("#actionForm");
var mainForm = $("#mainForm");
$("#cancelBtn").on("click",function(e){
    e.preventDefault();
    actionForm.attr("method", "get").attr("action","/murimoa/main");
    actionForm.submit();
});

$("#createGroup").on("click",function(e){
    e.preventDefault();
    var name = mainForm.find("input[name='name']").val();
    if(name.length === 0){
        alert("이름을 입력하세요!");
        return;
    }
    
    mainForm.submit();
});
</script>
</body>
</html>