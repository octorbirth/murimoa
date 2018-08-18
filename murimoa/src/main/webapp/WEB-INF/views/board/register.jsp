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
          <h3 class="box-title">게시글 작성
            <small>register</small>
          </h3>
        </div>

        <form role="form" method="post" action="/board/register" id='mainForm'>
          <div class="box-body">

            <div class="form-group">
              <label>제목 <small>(Title)</small></label>
              <input class="form-control" type="text" name="title" placeholder="Enter title" id="title">
            </div>
            <div class="form-group">
              <label>내용 <small>(Contents)</small></label>
              <textarea rows="8" style="resize:none" class="form-control" name="contents" placeholder="Enter contents"></textarea>
            </div>
            
          </div>
        </form>
        <!-- /.box-body -->
        
        <div class="box-footer">
          <button id="cancelBtn" class="btn btn-default">취소</button>
          <button id="createBoard" type="submit" class="btn btn-primary pull-right">작성 완료</button>
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
    $("#createBoard").on("click",function(e){
        e.preventDefault();

        var title = mainForm.find("input[name='title']").val();
        if(title.length === 0){
            alert("제목을 입력하세요!");
            return;
        }
        
        var writer= 'h';
        mainForm.append("<input type='hidden' name='writer' value='"+writer+"'>");
        mainForm.append("<input type='hidden' name='gno' value='" + ${groupInfo.gno} + "'>");
        mainForm.submit();
    });
    
    $("#cancelBtn").on("click",function(e){
        e.preventDefault();
        actionForm.append("<input type='hidden' name='gno' value='" + ${groupInfo.gno} + "'>");
        actionForm.append("<input type='hidden' name='page' value='${cri.page}'>");
        actionForm.attr("method", "get").attr("action","/board/list");
        actionForm.submit();
    });
    

</script>
</body>
</html>