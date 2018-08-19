<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  <link rel="stylesheet" href="/resources/sweetalert2/dist/sweetalert2.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="/WEB-INF/views/include/header.jsp" %>
  <%@include file="/WEB-INF/views/include/aside.jsp" %>

  <div class="content-wrapper">
    <section class="content-header">
      <div class="box box-primary">

        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title"># ${boardInfo.bno}</h3>
          </div>
          
          <div class="box-body no-padding">
            <div class="mailbox-read-info">
              <h3>${boardInfo.title}</h3>
              <h5><span>${boardInfo.writer}</span>
                <span class="mailbox-read-time pull-right"><i style="margin-right:4px" class="fa fa-clock-o"> 
                	</i><fmt:formatDate value="${boardInfo.regdate}" pattern="yyyy-MM-dd HH:mm"/>
                </span>
              </h5>
            </div>

            <div class="mailbox-read-message">
              <pre style="background-color: white">${boardInfo.contents}</pre>
            </div>
          </div>

          <div class="box-footer">
            <div class="pull-right">
              <button id="cancelBtn" type="button" class="btn btn-default"><i class="fa fa-reply"></i> 뒤로</button>
            </div> 
            <button id="deleteBtn" type="button" class="btn btn-default"><i class="fa fa-trash-o"></i> 삭제</button>
            <button id="modifyBtn" type="button" class="btn btn-default"><i class="fa fa-pencil"></i> 수정</button>
          </div>
          
          <div class="box-footer">
              <h3>댓글</h3>
            <form class="form-horizontal">
              <div class="form-group margin-bottom-none">
                <div class="col-sm-10">
                  <textarea id="reply" type="text" style="resize:none" class="form-control" placeholder="Enter contents"></textarea>
                </div>
                <div class="col-sm-2">
                  <button id="replyBtn" style="font-size: 20px;line-height: 2;" type="submit" class="btn btn-danger pull-right btn-block btn-sm">완료</button>
                </div>
              </div>
            </form>
          </div>
          
          
          <div class="box-footer replyUL">
          
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
<script src="/resources/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script src="/resources/sweetalert2/dist/sweetalert2.min.js"></script>
<script type="text/javascript" src="/resources/js/handlebars.min.js"></script>

<script id="replyTemplate" type="text/x-handlebars-template">
    {{#each .}}
    <div data-rno={{rno}} class="reply-box post clearfix">
        <div class="user-block">
            <img class="img-circle img-bordered-sm" src="#" alt="User Image">
            <span class="username">{{replyer}}</span>
            <span class="description"><i class="fa fa-clock-o margin-r-4"></i> {{replyDate}}</span>
        </div>
        <p>{{reply}}</p>
        <ul class="list-inline">
            <li data-rno={{rno}} class="delReply"><a href="#" class="link-black text-sm"><i class="fa fa-trash margin-r-5"></i> 삭제</a></li>
            <li><a href="#" class="link-black text-sm"><i class="fa fa-pencil margin-r-5"></i> 수정</a></li>
        </ul>
              
        <div class="input-group">
            <textarea type="text"  style="resize:none;" class="form-control" placeholder="Enter contents"></textarea>
            <div class="input-group-btn">
                <button type="button" style="font-size: 15px; line-height:40px;"class="btn btn-success">완료</button>
            </div>
        </div>
    </div>
    {{/each}}
</script>

<script>
    var actionForm = $("#actionForm");
    
    $("#cancelBtn").click(function(e) {
      e.preventDefault();
      actionForm.append("<input type='hidden' name='gno' value='${boardInfo.gno}'>");
      actionForm.append("<input type='hidden' name='page' value='${cri.page}'>");
      actionForm.attr("method", "get").attr("action","/board/list").submit();
    });
    
    $("#deleteBtn").click(function(e) {
        e.preventDefault();
        actionForm.append("<input type='hidden' name='gno' value='${boardInfo.gno}'>");
        actionForm.append("<input type='hidden' name='bno' value='${boardInfo.bno}'>");
        actionForm.attr("method", "post").attr("action","/board/remove").submit();
    });
    
    $("#modifyBtn").click(function(e) {
        e.preventDefault();
        actionForm.append("<input type='hidden' name='gno' value='${boardInfo.gno}'>");
        actionForm.append("<input type='hidden' name='bno' value='${boardInfo.bno}'>");
        actionForm.append("<input type='hidden' name='page' value='${cri.page}'>");
        actionForm.attr("method", "get").attr("action","/board/modify").submit();
    });
    
    var msg = '${result}';
    if (msg === 'modsuccess') {
    	swal({
    		  type: 'success',
    		  title: '게시글 수정 완료!',
    		  showConfirmButton: false,
    		  timer: 1200
    	})
    }
    
    var replySource = $('#replyTemplate').html();
    var replyTemplate = Handlebars.compile(replySource);
    
    function getReply(){
        var data = [];
        $.getJSON("/reply/list/" + ${boardInfo.bno}, function(arr){
              for(var i=0; i< arr.length; i++){
                var time = new Date(arr[i].regdate);
                var replyDate = (time.getFullYear()+"-"+(time.getMonth()+1)+"-"+ time.getDate());  
                data.push({
                    replyer : arr[i].replyer,
                    replyDate : replyDate,
                    reply : arr[i].reply,
                    rno: arr[i].rno
                })  
              }
              
              $(".replyUL").append(replyTemplate(data));
       });
      }
    
    getReply();
    
    $("#replyBtn").click(function(e){
        e.preventDefault();
        var data = {reply:$("#reply").val(), replyer: "Temp", bno: ${boardInfo.bno}};
        $.ajax({
            url:'/reply/new',
            type:'POST',
            contentType: "application/json; charset=utf-8",
            data:JSON.stringify(data),
            success: function(result){
                $("#reply").val("");
                $(".replyUL").html("");
                getReply();
            }
        })
    });
    
    $(".replyUL").on("click", ".delReply", function(e){
        e.preventDefault();
        var rno = $(this).attr("data-rno");
        var data = {rno : rno};

        $.ajax({
          url:'/reply/' + rno,
          type: 'DELETE',
          contentType: "application/json; charset=utf-8",
          data:JSON.stringify(data),
          success: function(result){
              $(".reply-box[data-rno="+ rno +"]").remove();
          }
        });
    });
</script>


</body>
</html>