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
		              <p class="text-muted text-center">${groupInfo.leader}</p>
		
		              <ul class="list-group list-group-unbordered">
		                <li class="list-group-item">
		                  <b>Since</b> <a class="pull-right"><fmt:formatDate value="${groupInfo.regdate}" pattern="yyyy-MM-dd"/></a>
		                </li>
		                <li class="list-group-item">
		                  <b>Group Member</b> <a id="memberCount" data-count="${groupInfo.memberCount}" class="pull-right">${groupInfo.memberCount}</a>
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
		              <ul id="signupMemberUL"class="nav nav-pills nav-stacked">

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
					<div id="groupMemberDIV">
					
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

<script type="text/javascript" src="/resources/js/handlebars.min.js"></script>
<script id="signupMemberTemplate" type="text/x-handlebars-template">
    {{#each .}}
		<li data-mid="{{mid}}" class="signup-box">
		<div class="box-header with-border">
        	<div class="user-block">
            	<img class="img-circle" src="/upload/thumb/{{image}}" alt="User Image">
                <span class="username">{{mid}}</span>
            </div>
			<div class="box-tools">
            	<button data-image="{{image}}" data-gno="{{gno}}" data-mid="{{mid}}" type="button" class="allow-btn btn btn-box-tool"><i class="fa fa-circle-o"></i></button>
                <button data-gno="{{gno}}" data-mid="{{mid}}" type="button" class="delete-btn btn btn-box-tool"><i class="fa fa-times"></i></button>
            </div>
            
        </div>
		</li>
    {{/each}}
</script>

<script id="groupMemberTemplate" type="text/x-handlebars-template">
    {{#each .}}
		<div data-mid="{{mid}}" class="group-member-box box-header with-border">
			<div class="user-block">
				<img class="img-circle" src="/upload/thumb/{{image}}" alt="User Image">
				<span class="username">{{mid}}</span>
			</div> 
			<div class="box-tools">
				<button data-gno="{{gno}}" data-mid="{{mid}}" type="button" class="delete-btn btn btn-box-tool" ><i class="fa fa-times"></i></button>
			</div>
		</div>
    {{/each}}
</script>

<script>


var signupMemberSource = $('#signupMemberTemplate').html();
var signupMemberTemplate = Handlebars.compile(signupMemberSource);

function getSignupMember(){
    var data = [];
    $.getJSON("/group/signupMember/" + ${groupInfo.gno}, function(arr){
        for(var i=0; i< arr.length; i++){
            data.push({
        		mid : arr[i].mid,
        		gno : arr[i].gno,
        		image : arr[i].image
        		
        	}) 
        }
        $("#signupMemberUL").append(signupMemberTemplate(data));
   	});
  }

getSignupMember();

$("#signupMemberUL").on("click", ".delete-btn", function(e){
	e.preventDefault();
	var gno = $(this).attr("data-gno");
	var mid = $(this).attr("data-mid");
	var data = {gno : gno, mid : mid}; 
	
   	$.ajax({
      url:'/group/signupDelete/' + gno,
      type: 'DELETE',
      contentType: "application/json; charset=utf-8",
      data:JSON.stringify(data), 
      success: function(result){
      	$(".signup-box[data-mid="+ mid +"]").remove();
      }
  	});
});


var groupMemberSource = $('#groupMemberTemplate').html();
var groupMemberTemplate = Handlebars.compile(groupMemberSource);
function getGroupMember(){
    var data = [];
    $.getJSON("/group/getGroupMember/" + ${groupInfo.gno}, function(arr){
        for(var i=0; i< arr.length; i++){
            data.push({
        		mid : arr[i].mid,
        		gno : arr[i].gno,
        		image : arr[i].image,
        	}) 
        }
        $("#groupMemberDIV").append(groupMemberTemplate(data));
   	});
  }

getGroupMember();

$("#groupMemberDIV").on("click", ".delete-btn", function(e){
	e.preventDefault();
	var gno = $(this).attr("data-gno");
	var mid = $(this).attr("data-mid");
	var data = {gno : gno, mid : mid}; 
   	$.ajax({
        url:'/group/groupMemberDelete/' + gno,
        type: 'DELETE',
        contentType: "application/json; charset=utf-8",
        data:JSON.stringify(data), 
        success: function(result){
        	$(".group-member-box[data-mid="+ mid +"]").remove();
        	var memberCount = parseInt($("#memberCount").attr("data-count"));
        	memberCount--;
        	$("#memberCount").attr("data-count",memberCount.toString());
        	$("#memberCount").html(memberCount.toString());
        }
    });
});

$("#signupMemberUL").on("click", ".allow-btn", function(e){
	e.preventDefault();
	var gno = $(this).attr("data-gno");
	var mid = $(this).attr("data-mid");
	var image = $(this).attr("data-image");
	var data = {gno : gno, mid : mid}; 

	$.ajax({
        url:'/group/newMember/' + gno,
        type: 'PUT',
        contentType: "application/json; charset=utf-8",
        data:JSON.stringify(data),
        success: function(result){
        	
        	$(".signup-box[data-mid="+ mid +"]").remove();
        	
        	var newData = [];
        	newData.push({
        		mid : mid,
        		gno : gno,
        		image : image
        	}) 
        	$("#groupMemberDIV").append(groupMemberTemplate(newData));
        	var memberCount = parseInt($("#memberCount").attr("data-count"));
        	memberCount++;
        	$("#memberCount").attr("data-count",memberCount.toString());
        	$("#memberCount").html(memberCount.toString());
        }
    });
});

</script>
</body>
</html>