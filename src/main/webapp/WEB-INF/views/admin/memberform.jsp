<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
		<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>회원관리</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="position:relative;">
					<div class="panel-heading">회원 목록</div>
					<div class="panel-body">
						<div id="my_menu">
							<button id="modify" class="btn btn-primary">수정</button>&nbsp;
							<button id="delete" class="btn btn-default">삭제</button>&nbsp;
						</div>
						<table id="member_table" data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
							    <tr>
							        <th data-field="check" data-checkbox="true" ></th>
							        <th data-field="email" data-sortable="true">이메일</th>
							        <th data-field="nickname" data-sortable="true">닉네임</th>
							        <th data-field="password" data-sortable="true">비밀번호</th>
							        <th data-field="phone" data-sortable="true">연락처</th>
							        <th data-field="agree" data-sortable="true">카카오톡 수신 동의</th>
							    </tr>
						    </thead>
						    <tbody>
						    	<c:forEach items="${member}" var="mem">
						    		<tr>
						    			<td></td>
						    			<td class="member_email">${mem.email }</td>
						    			<td class="member_nickname">${mem.nicknm}</td>
						    			<td class="member_pw">${mem.pw }</td>
						    			<td class="member_phone">${mem.phone}</td>
						    			<td class="member_agree">${mem.agree }</td>
						    		</tr>
						    		</c:forEach>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
	</div><!--/.main-->