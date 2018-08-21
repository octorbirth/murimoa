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
      <h1>그룹 관리</h1>
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
		
		              <a href="/board/list?gno=${groupInfo.gno}" class="btn btn-primary btn-block"><b>그룹 게시판</b></a>
		            </div>
	            <!-- /.box-body -->
	          	</div>
          		<!-- /.box -->
          		
          		<div class="box box-solid">
		            <div class="box-header with-border">
		              <h3 class="box-title">가입 신청 멤버</h3>
		                  
		              <div class="box-tools">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		                </button>
		              </div>
		            </div>
		            <div class="box-body no-padding">
		              <ul class="nav nav-pills nav-stacked">
		                <li><a href="#"><i class="fa fa-circle-o text-red"></i> Important</a></li>
		                <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> Promotions</a></li>
		                <li><a href="#"><i class="fa fa-circle-o text-light-blue"></i> Social</a></li>
		              </ul>
		            </div>
		            <!-- /.box-body -->
	          	</div>
	          	<!-- /.box -->
        	</div>
        	<!-- /.col -->
	        <div class="col-md-6">
	        	<div class="box box-primary">
		        	<div class="box-header with-border">
              			<h3 class="box-title">그룹원 <small>Group Member</small></h3>
            		</div>           
          		</div>
	        </div>
	        <!-- /.col -->
     	</div>
    	<!-- /.row -->
   	</section>

  </div>
</div>


<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/jquery-ui.js"></script>

<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>

<script src="/resources/js/bootstrap.js"></script>
<script src="/resources/js/adminlte.js"></script>
<script>


</script>
</body>
</html>