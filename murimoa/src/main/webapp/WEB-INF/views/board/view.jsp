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
    
    $("#cancelBtn").click(function(e) {
      e.preventDefault();
      actionForm.append("<input type='hidden' name='gno' value='${boardInfo.gno}'>");
      actionForm.attr("method", "get").attr("action","/board/list").submit();
    });
    
    $("#deleteBtn").click(function(e) {
        e.preventDefault();
        actionForm.append("<input type='hidden' name='gno' value='${boardInfo.gno}'>");
        actionForm.append("<input type='hidden' name='bno' value='${boardInfo.bno}'>");
        actionForm.attr("method", "post").attr("action","/board/remove").submit();
    });
    

    
</script>


</body>
</html>