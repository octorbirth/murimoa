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
	      <h1>그룹 게시판</h1>
	    </section>
        <section class="content">
      	<div class="row">
        	<div class="col-md-3">
          		<!-- Profile Image -->	
	          	<div class="box box-primary">
		            <div class="box-body box-profile">
		              <h3 class="profile-username text-center">${groupInfo.name}</h3>
		              <p class="text-muted text-center">그룹리더</p>
		
		              <ul class="list-group list-group-unbordered">
		                <li class="list-group-item">
		                  <b>Since</b> <a class="pull-right"><fmt:formatDate value="${groupInfo.regdate}" pattern="yyyy-MM-dd"/></a>
		                </li>
		                <li class="list-group-item">
		                  <b>Group Member</b> <a class="pull-right">${groupInfo.memberCount}</a>
		                </li>
		              </ul>
		
		              <a href="#" class="btn btn-primary btn-block"><b>그룹관리</b></a>
		            </div>
	            <!-- /.box-body -->
	          	</div>
          		<!-- /.box -->
        	</div>
        	<!-- /.col -->
	        <div class="col-md-9">
	          <div class="nav-tabs-custom">
	            <ul class="nav nav-tabs">
	              <li class="active"><a href="#activity" data-toggle="tab">게시판</a></li>
	              <li><a href="#timeline" data-toggle="tab">출결</a></li>
	            </ul>
	            <div class="tab-content">
	              <div class="active tab-pane" id="activity">
	                <div class="box-body no-padding">
	       				<table class="table table-striped">
				            <tr>
				              <th style="width: 10px">#</th>
				              <th>제목</th>
				              <th>작성자</th>
				              <th>작성일</th>
				            </tr>
				            <c:forEach var="item" items="${boardList}">
				            <tr>
				              <td>${item.bno}</td>
				              <td><a href="#">${item.title}</a></td>
				              <td>${item.writer}</td>
				              <td><fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
				            </tr>
				            </c:forEach>
			          	</table>
			        </div>
			        
	                <div class="box-footer clearfix">
	
			          <button id="boardRegistBtn" type="button" class="btn btn-default pull-right">
			          		<i class="fa fa-plus"></i> Add item
			          </button>
			          
			          <ul class="pagination pagination-sm no-margin pull-left">
			
			          </ul>
			        </div>
	              </div>
	              <!-- /.tab-pane -->
	            </div>
	            <!-- /.tab-content -->
	          </div>
	          <!-- /.nav-tabs-custom -->
	        </div>
	        <!-- /.col -->
     	</div>
    	<!-- /.row -->
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
    $("#boardRegistBtn").on("click",function(e){
        e.preventDefault();
        actionForm.append("<input type='hidden' name='gno' value='" + ${groupInfo.gno} + "'>");
        actionForm.attr("method", "get").attr("action","/board/register");
        actionForm.submit();
    });
	
</script>
</body>
</html>