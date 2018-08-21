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
		
		              <a href="/group/manager?gno=${groupInfo.gno}" class="btn btn-primary btn-block"><b>그룹관리</b></a>
		            </div>
	            <!-- /.box-body -->
	          	</div>
          		<!-- /.box -->
          		
          		<div class="box box-solid">
		            <div class="box-header with-border">
		              <h3 class="box-title">My Attendance</h3>
		                  
		              <div class="box-tools">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		                </button>
		              </div>
		            </div>
		            <div class="box-body no-padding">
		            <div style="padding: 0 5%; margin-top:5px">
					  <div class="clearfix">
	                    <small class="pull-left"><span id="yourAttend"></span> / <span id="totalAttend"></span></small>
	                  </div>
	                  <div class="progress xs">
	                    
	                  </div>
	                </div>  
		            </div>
		            <!-- /.box-body -->
	          	</div>
	          	<!-- /.box -->
        	</div>
        	<!-- /.col -->
	        <div class="col-md-9">
	          <div class="nav-tabs-custom">
	            <ul class="nav nav-tabs">
	              <li class="active"><a href="#board" data-toggle="tab">게시판</a></li>
	              <li><a href="#attend" data-toggle="tab">출결</a></li>
	            </ul>
	            <div class="tab-content">
	              <div class="active tab-pane" id="board">
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
				              <td><a href="/board/view?bno=${item.bno}&gno=${groupInfo.gno}&page=${cri.page}">${item.title}</a></td>
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
	              
	              <div class="tab-pane" id="attend">
	                <div class="box-body no-padding">
	       				<table class="table table-hover">
			              <tr>
			              	<th>#</th>
			                <th>출석날짜</th>
			              </tr>
			              <c:forEach var="item" items="${attendList}" varStatus="status">
			              <tr>
			              	<td>${status.count}</td>
			              	<td><a href="/attend/view?gno=${groupInfo.gno}&lno=${item.lno}"><fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd HH:mm"/></a></td>
			              </tr>
			              </c:forEach>
			            </table>
			        </div>
			        
	                <div class="box-footer clearfix">
	
			          <button id="attendRegistBtn" type="button" class="btn btn-default pull-right">
			          		<i class="fa fa-plus"></i> 출석
			          </button>
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
<script src="/resources/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script src="/resources/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="/resources/js/pageNaviMaker.js"></script>   
<script>
	var actionForm = $("#actionForm");
    $("#boardRegistBtn").on("click",function(e){
        e.preventDefault();
        actionForm.append("<input type='hidden' name='gno' value='" + ${groupInfo.gno} + "'>");
        actionForm.append("<input type='hidden' name='page' value='${cri.page}'>");
        actionForm.attr("method", "get").attr("action","/board/register");
        actionForm.submit();
    });
    
    $("#attendRegistBtn").on("click",function(e){
        e.preventDefault();
        actionForm.append("<input type='hidden' name='gno' value='" + ${groupInfo.gno} + "'>");
        actionForm.attr("method", "get").attr("action","/attend/register");
        actionForm.submit();
    });
	
    var msg = '${result}';
    if (msg === 'delsuccess') {
    	swal({
    		  type: 'success',
    		  title: '게시글 삭제 완료!',
    		  showConfirmButton: false,
    		  timer: 1200
    	})
    }else if (msg === 'attendRegisterSuccess') {
    	swal({
  		  type: 'success',
  		  title: '출석 등록 완료!',
  		  showConfirmButton: false,
  		  timer: 1200
  		})
  	}else if(msg === 'attendDeleteSuccess'){
  		swal({
    		  type: 'success',
    		  title: '출석 삭제 완료!',
    		  showConfirmButton: false,
    		  timer: 1200
    	})
  	}
    
    var pageStr = makePage({
        pageSize : 10, // 한 페이지 당 보여지는 데이터의 양
        liCount : 10, // Page Navigation에 표시는 li의 개수(페이지 개수)
        total : ${cri.total}, // 현재 데이터의 총 개수
        current : ${cri.page} // 현재 페이지
    });
    
    $(".pagination").html(pageStr);

    $(".pagination").on("click", "li", function(e){
        e.preventDefault();
        var pageNum = $(this).attr('data-page');
        
        // [Prev], [Next]는 disabled되어 있을 뿐 이벤트위임으로 이벤트가 적용되므로 이를 처리하기 위함.
        if(pageNum !== undefined) {
            self.location="/board/list?page="+pageNum+"&gno="+${groupInfo.gno};
        }
    });
    
    function getAttendInfo(){
        var data = [];
        $.getJSON("/attend/countAttend/" + ${groupInfo.gno} + "/mid/AB1", function(arr){
        	var yourAttend = 0;
        	var totalAttend = 0;
        	var count = 0;
            for(var i=0; i< arr.length; i++){
              	totalAttend++;
			  	if(arr[i].attend === 'Y'){
			  		yourAttend++;	
			  	}
			  	
			  	count = Math.round(yourAttend/totalAttend * 100);
            }
            
            $("#yourAttend").html(yourAttend.toString());
            $("#totalAttend").html(totalAttend.toString());
            $(".progress").html('<div class="progress-bar progress-bar-green" style="width: '+count+'%;"></div>');
            
       	});
      }
    
    getAttendInfo();
    

</script>
</body>
</html>