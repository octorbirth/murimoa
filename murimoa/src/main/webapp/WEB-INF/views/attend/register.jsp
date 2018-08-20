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

  <link rel="stylesheet" href="/resources/css/attend.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="/WEB-INF/views/include/header.jsp" %>
  <%@include file="/WEB-INF/views/include/aside.jsp" %>
  
  <div class="content-wrapper">
    <section class="content-header">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">출석 등록
            <small>register</small>
          </h3>
        </div>
          <div class="box-body table-responsive no-padding">
            <table class="table table-hover">
              <tr>
              	<th>#</th>
                <th>아이디</th>
                <th>출석여부</th>
              </tr>
              <c:forEach var="item" items="${memberList}" varStatus="status">
              <tr>
              	<td>${status.count}</td>
              	<td>${item.mid}</td>
              	<td><label class='switch'>
            		<input type='checkbox'>
            		<span class='slider round'></span>
          		</label></td>
              </tr>
              </c:forEach>
            </table>
          </div>
          <!-- /.box-body -->
                  
        <div class="box-footer">
          <button id="cancelBtn" class="btn btn-default">취소</button>
          <button id="createBoard" type="submit" class="btn btn-primary pull-right">등록</button>
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

<script>
	var actionForm = $("#actionForm");
	$("#cancelBtn").on("click",function(e){
	    e.preventDefault();
	    actionForm.append("<input type='hidden' name='gno' value='" + ${groupInfo.gno} + "'>");
	    actionForm.attr("method", "get").attr("action","/board/list");
	    actionForm.submit();
	});

</script>

</body>
</html>