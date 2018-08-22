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
          <h3 class="box-title">출석 확인
            <small>view</small>
          </h3>
        </div>
        <form method='post' id='mainForm'>
          <div class="box-body table-responsive no-padding">
            <table class="table table-hover">
              <tr>
              	<th>#</th>
                <th>이름 (아이디)</th>
                <th>출석여부</th>
              </tr>
              <c:forEach var="item" items="${attendMemberList}" varStatus="status">
              <tr>
              	<td>${status.count}</td>
              	<td><b>${item.name}</b>　(${item.mid})</td>
              	<td><label class='switch'>
              		<c:if test="${item.attend == 'Y' }">
						<input name='attendMemberList' value='${item.mid}' type='checkbox' checked>		
					</c:if>
					<c:if test="${item.attend == 'N' }">
						<input name='attendMemberList' value='${item.mid}' type='checkbox'>
					</c:if>
            		<span class='slider round'></span>
          		</label></td>
              </tr>
              <input type='hidden' name='groupMemberList' value='${item.mid}'>
              </c:forEach>
            </table>
          </div>
        </form>
          <!-- /.box-body -->
                  
        <div class="box-footer">
        <c:if test="${memberDTO.mid == groupInfo.leader}">
          <button id="deleteBtn" class="btn btn-default">삭제</button>
          <button id="modifyBtn" class="btn btn-default">수정</button>
		</c:if>
          <button id="cancelBtn" class="btn pull-right">이전</button>
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
<script>
	var actionForm = $("#actionForm");
	var mainForm = $("#mainForm");
	
	$("#cancelBtn").on("click",function(e){
	    e.preventDefault();
	    actionForm.append("<input type='hidden' name='gno' value='" + ${AttendInfo.gno} + "'>");
	    actionForm.attr("method", "get").attr("action","/board/list");
	    actionForm.submit();
	});
	
	$("#deleteBtn").on("click",function(e){
        e.preventDefault();
        actionForm.append("<input type='hidden' name='gno' value='${AttendInfo.gno}'>");
        actionForm.append("<input type='hidden' name='lno' value='${AttendInfo.lno}'>");
        actionForm.attr("method", "post").attr("action","/attend/remove").submit();
	
	});
	
	$("#modifyBtn").on("click",function(e){
        e.preventDefault();
        mainForm.append("<input type='hidden' name='gno' value='${AttendInfo.gno}'>");
        mainForm.append("<input type='hidden' name='lno' value='${AttendInfo.lno}'>");
        mainForm.attr("method", "post").attr("action","/attend/modify").submit();
	});
	
	var msg = '${result}';
    if (msg === 'attendModifySuccess') {
    	swal({
    		  type: 'success',
    		  title: '저장되었습니다 :-)',
    		  showConfirmButton: false,
    		  timer: 1200
    	})
    }
	

</script>

</body>
</html>