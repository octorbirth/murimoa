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
          <ul class="treeview-menu">
            <li><a href="charts/chartjs.html"><i class="fa fa-circle-o"></i> 그룹1</a></li>
            <li><a href="charts/morris.html"><i class="fa fa-circle-o"></i> 그룹2</a></li>
            <li><a href="charts/flot.html"><i class="fa fa-circle-o"></i> 그룹3</a></li>
            <li><a href="charts/inline.html"><i class="fa fa-circle-o"></i> 그룹4</a></li>
          </ul>
        </li>
        
        
        <li class="header"></li>
        <li><a href="/murimoa/login"><i class="fa fa-circle-o text-red"></i> <span>Logout</span></a></li>

      </ul>
    </section>
  </aside>
  
  <script>
  
  </script>