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
        <div class="box-body">
			<div class="form-group">
	            <h5 for="exampleInputFile"><b>File input</b></h5>
	            <input style="display:inline-block;" type="file" id="uploadFile">
	            <button id="uploadBtn">업로드</button>
	        </div>
		</div>
        <div class="box-footer">
          <ul class="mailbox-attachments clearfix fileUL">
            
          </ul>
        </div>
        
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


<script type="text/javascript" src="/resources/js/handlebars.min.js"></script>

<script id="fileTemplate" type="text/x-handlebars-template">
    {{#each .}}
    <li data-file="{{uploadName}}">
          {{#if thumbName}}
            <span class="mailbox-attachment-icon has-img"><img src="/upload/thumb/{{thumbName}}" alt="{{original}}"></span>    
          {{else}}
            <span class="mailbox-attachment-icon"><i class="fa fa-file-archive-o"></i></span>
          {{/if}}
        
        <div class="mailbox-attachment-info">
            <small>{{original}}</small>
            <a data-file="{{uploadName}}" href="#" class="btn btn-default btn-xs pull-right delFile"><i class="fa fa-trash-o"></i></a>
        </div>
    </li>
    {{/each}}
</script>

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
        
        var writer= '${memberDTO.mid}';
        mainForm.append("<input type='hidden' name='writer' value='"+writer+"'>");
        mainForm.append("<input type='hidden' name='gno' value='" + ${groupInfo.gno} + "'>");
        
        $(".fileUL li").each(function(idx){
            
            var fileName = $(this).attr("data-file");
            var str = "<input type='hidden' name='ufile["+ idx +"]' value='"+fileName+"'>";
            
            mainForm.append(str);
        });
        
        mainForm.submit();
    });
    
    $("#cancelBtn").on("click",function(e){
        e.preventDefault();
        actionForm.append("<input type='hidden' name='gno' value='" + ${groupInfo.gno} + "'>");
        actionForm.append("<input type='hidden' name='page' value='${cri.page}'>");
        actionForm.attr("method", "get").attr("action","/board/list");
        actionForm.submit();
    });
    
    var fileSource = $('#fileTemplate').html();
    var fileTemplate = Handlebars.compile(fileSource);
    
    $("#uploadBtn").on("click", function(e){
        e.preventDefault();

        var formData = new FormData();
        formData.append("file", $("#uploadFile")[0].files[0]);

        $.ajax({
          url: '/upload/',
          data: formData,
          dataType:'json',
          processData: false,
          contentType: false,
          type: 'POST',
          success: function(data){
              var files = [];
              
              var thumbName;
              if(data.type === 'image'){
                  thumbName = data.thumbName;
              }
              files.push({
                  original : data.original,
                  thumbName : thumbName,
                  uploadName : data.uploadName
              })
              $(".fileUL").append(fileTemplate(files)); 
          }
        });
    });
    
    $(".fileUL").on("click", ".delFile", function(e){
        e.preventDefault();
        var targetName = $(this).attr("data-file");
        var target = $("li[data-file='" + targetName + "']");
        
        $.ajax({
            url: '/upload/delete',
            data: {fileName : targetName},
            dataType:'json',
            type: 'POST',
            success: function(result){ }
          });

        target.remove();
    });

    

</script>
</body>
</html>