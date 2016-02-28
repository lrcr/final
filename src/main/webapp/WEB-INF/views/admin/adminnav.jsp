<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>돌아가기</a>
				<a id="admin_logout" class="navbar-brand" href="logout" style="float:right;" ><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>로그아웃</a>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
		    <li>    
                <a href="admin"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Schedule</a>
            </li>
              <li>
                <a href="member"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 회원관리</a>
            </li>
            <li>
                <a href="store"><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span> 맛집관리</a>
            </li>
            <li>
                <a href="board"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 공지사항</a>
            </li>
            <li>
                <a href="https://github.com/lrcr/zfinal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> 오픈소스</a>
            </li>
		</ul>
	</div><!--/.sidebar-->