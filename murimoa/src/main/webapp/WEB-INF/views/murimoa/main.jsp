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
  <link rel="stylesheet" href="/resources/sweetalert2/dist/sweetalert2.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="/WEB-INF/views/include/header.jsp" %>
  <%@include file="/WEB-INF/views/include/aside.jsp" %>
  
  <div class="content-wrapper">
  	<section class="content-header">
      <h1>내가 속한 그룹<small>My Group</small></h1>
      <ol class="breadcrumb">
        <li class="active"><button id="registerBtn" type="button" class="btn btn-primary btn-sm btn-flat">그룹 생성</button></li>
      </ol>
    </section>


	<section class="content">
      <div class="row" id="myGroupList">
      
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

<script id="myGroupTemplate" type="text/x-handlebars-template">
    {{#each .}}
	<div class="col-lg-3 col-xs-6">
          <div class="small-box bg-aqua">
            <div class="inner">
              <h5>{{groupName}}</h5>
              <p>현승우 <label><small>(Leader)</small></label></p>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
    {{/each}}
</script>
<script>
var myGroupSource = $('#myGroupTemplate').html();
var myGroupTemplate = Handlebars.compile(myGroupSource);

function getMyGroup(){
    var data = [];
    
    $.getJSON("/group/mygroup/", function(arr){
          for(var i=0; i< arr.length; i++){
            data.push({
            	groupName : arr[i].name,
            })  
          }
          
          $("#myGroupList").append(myGroupTemplate(data));
   });
  }

getMyGroup();

var actionForm = $("#actionForm");
$("#registerBtn").on("click",function(e){
    e.preventDefault();
    actionForm.attr("method", "get").attr("action","/group/register");
    actionForm.submit();
});

var msg = '${result}';
if (msg === 'groupRegister') {
	swal({
		  type: 'success',
		  title: '그룹이 생성되었습니다!',
		  showConfirmButton: false,
		  timer: 1200
	})
}
</script>
</body>
</html>