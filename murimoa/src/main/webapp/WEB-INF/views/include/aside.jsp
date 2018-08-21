<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <aside class="main-sidebar">
    <section class="sidebar">
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/upload/thumb/${memberDTO.image}" class="img-circle userImage" alt="User Image">
        </div>
        <div class="pull-left info">
          <p class="userName">${memberDTO.name}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> ${memberDTO.mid}</a>
        </div>
      </div>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header"></li>
        <li><a href="/murimoa/main"><i class="fa fa-dashboard"></i> <span>Home</span></a></li>
        <li><a href="/murimoa/profile"><i class="fa fa-book"></i> <span>Profile</span></a></li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>My Groups</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu aside-mygroups-ul">
            

          </ul>
        </li>
        
        
        <li class="header"></li>
        <li><a href="/murimoa/login"><i class="fa fa-circle-o text-red"></i> <span>Logout</span></a></li>

      </ul>
    </section>
  </aside>
  
<script src="/resources/js/jquery.js"></script>  
<script>
function asideMyGroups(){
	var str = "";
	var mid = '${memberDTO.mid}';
	$.getJSON("/group/mygroup/" + mid, function(arr){
	    
		for(var i=0; i< arr.length; i++){
	    	str += '<li><a href="/board/list?gno='+arr[i].gno+'"><i class="fa fa-circle-o"></i> '+ arr[i].name +'</a></li>'
	    }
		
	    $(".aside-mygroups-ul").html(str);
	});
	
	
}

asideMyGroups();
  
</script>