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
  <link rel="stylesheet" href="/resources/css/ionicons.css">
  <link rel="stylesheet" href="/resources/css/AdminLTE.css">
  <link rel="stylesheet" href="/resources/css/_all-skins.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="stylesheet" href="/resources/sweetalert2/dist/sweetalert2.min.css">
  <style>
  
  	#modifyNameBtn, #modifyProfileImageBtn, #basicProfileImageBtn  {
  		cursor : pointer;
  	}
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="/WEB-INF/views/include/header.jsp" %>
  <%@include file="/WEB-INF/views/include/aside.jsp" %>

    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                User Profile
            </h1>
        </section>

        <section class="content">

            <div class="row">
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img id="userImage" class="profile-user-img img-responsive img-circle" src="/upload/thumb/${memberDTO.image}" alt="User">

                            <h3 class="profile-username text-center"><span class="userName">${memberDTO.name}</span>
                            	<i id="modifyNameBtn" style="margin-left:6px;" class="fa fa-pencil-square-o"></i>
                            </h3>
							<p class="text-muted text-center">
                                <span id="modifyProfileImageBtn">이미지 수정</span>  
                                	∥  <span id="basicProfileImageBtn">기본 이미지</span>
							</p>
							
							<input style="display:none;" type="file" id="inputPrfileImage">
                            
                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>Name</b> <a class="pull-right"><span class="userName">${memberDTO.name}</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
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

<script src="/resources/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script src="/resources/sweetalert2/dist/sweetalert2.min.js"></script>

<script type="text/javascript">

$('#modifyNameBtn').click(function (e) {
    e.preventDefault();
    swal({
          title: '너의 이름은?',
          input: 'text',
          inputAttributes: {
            autocapitalize: 'off'
          },
          showCancelButton: true,
          confirmButtonText: 'Ok',
          showLoaderOnConfirm: true,
        }).then((result) => {
          if (result.value) {

            var data = {name: result.value, mid: '${memberDTO.mid}'};  

            $.ajax({
                url: '/member/updateName',
                type: 'PUT',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                success: function( r ){
                    $(".userName").each(function(){
                        $(this).text(result.value)
                    });
                }
			});
		}
	})
});
    

// 파일선택 <input> 동작시키기
$('#modifyProfileImageBtn').click(function (e) {
    e.preventDefault();
    $('#inputPrfileImage').click();
});

// 선택한 파일로 이미지변경 (DB / Session / 화면)
$("#inputPrfileImage").change(function(e){
    e.preventDefault();
    
    var formData = new FormData();
    formData.append("file", $("#inputPrfileImage")[0].files[0]);
    formData.append("mid", '${memberDTO.mid}');
    $.ajax({
        url: '/member/updateImage',
        data: formData,
        dataType:'json',
        processData: false,
        contentType: false,
        type: 'POST',
        success: function(data){
            $("#inputPrfileImage").val("");
            $("#userImage").replaceWith('<img id="userImage" class="profile-user-img img-responsive img-circle" src="/upload/thumb/'+data.uploadName+'" alt="'+data.original+'">');
            
            $(".targetImage").each(function(){
                $(this).attr("src", "/upload/thumb/" +data.uploadName);
            });
        }
    });
});

// 기본이미지로 복원 (DB / Session / 화면)
$('#basicProfileImageBtn').click(function (e) {
    e.preventDefault();
    var basicProfileName = "profile.png";
    var data = {image: basicProfileName, mid: '${memberDTO.mid}'};  
    $.ajax({
        url: '/member/restoreImage',
        type: 'PUT',
        contentType: "application/json; charset=utf-8",
        data:JSON.stringify(data),
        success: function(result){
        	$("#userImage").replaceWith('<img id="userImage" class="profile-user-img img-responsive img-circle" src="/upload/thumb/'+basicProfileName+'" alt="User">');
            
            $(".targetImage").each(function(){
                $(this).attr("src", "/upload/thumb/" + basicProfileName);
            });
        }
    });
});




    

</script>   


</body>
</html>