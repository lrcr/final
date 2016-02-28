<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자홈</title>
<link href="https://bootswatch.com/cosmo/bootstrap.min.css" rel="stylesheet">
<link href="css/admin/bootstrap-table.css" rel="stylesheet">
<link href="css/admin/styles.css" rel="stylesheet">
<link href='css/admin/fullcalendar.min.css' rel="stylesheet"/>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src='js/admin/moment.min.js'></script>
<script src='js/admin/fullcalendar.min.js'></script>
<script src="js/admin/bootstrap-table.js"></script>
</head>

<body>
		<%@include file="adminnav.jsp"%>
		<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>맛집관리</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="position:relative;">
					<div class="panel-heading">지점 목록</div>
					<div class="panel-body">
						<div id="my_menu">
							<button id="store-edit" class="btn btn-primary admin-btn"  >수정</button>&nbsp;
							<button id="store-del" class="btn btn-default admin-btn" >삭제</button>&nbsp;
							<button id="store-add" class="btn btn-success admin-btn">추가</button>&nbsp;
						</div>
						<table id="store_table" data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
							    <tr>
							        <th data-field="check" data-checkbox="true" ></th>
							        <th data-field="img" data-sortable="true">이미지</th>
							        <th data-field="nm" data-sortable="true">지점명</th>
							        <th data-field="addr" data-sortable="true">주소</th>
							        <th data-field="tel" data-sortable="true">전화번호</th>
							        <th data-field="info" data-sortable="true">소개</th>
							        <th data-field="site" data-sortable="true">홈페이지</th>
							        <th data-field="keyword" data-sortable="true">키워드</th>
							        <th data-field="time" data-sortable="true">영업시간</th>
							        <th data-field="reserve" data-sortable="true">예약정보</th>
							        <th data-field="delivery" data-sortable="true">배달정보</th>
							        <th data-field="tv" data-sortable="true">방송명</th>
							        <th data-field="link" data-sortable="true">동영상링크</th>
							        <th data-field="loc" data-sortable="true">위치정보</th>
							        <th data-field="indu" data-sortable="true">업종</th>
							        <th data-field="eval" data-sortable="true">평점</th>
							    </tr>
						    </thead>
						    <tbody>
						    	<c:forEach items="${store}" var="info">
						    		<tr>
						    			<td></td>
						    			<td class="store_img" ><div style="width:100px; height:100px; background : url(images/storeimg/${info.no}.jpg); background-size:100% 100%; text-indent:-1000px;">${info.no}</div></td>
						    			<td class="store_nm">${info.nm }</td>
						    			<td class="store_addr">${info.addr}</td>
						    			<td class="store_tel">${info.tel }</td>
						    			<td class="store_info">${info.info}</td>
						    			<td class="store_site">${info.site}</td>
						    			<td class="store_keyword">${info.keyword }</td>
						    			<td class="store_time">${info.time}</td>
						    			<td class="store_reserve">${info.reserve }</td>
						    			<td class="store_delivery">${info.delivery}</td>
						    			<td class="store_tv">${info.tv }</td>
						    			<td class="store_link">${info.link}</td>
						    			<td class="store_loc">${info.loc }</td>
						    			<td class="store_indu">${info.indu }</td>
						    			<td class="store_eval">${info.eval }</td>
						    		</tr>
						    		</c:forEach>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
	</div><!--/.main-->
		
	<script type="text/javascript" src="js/admin/admin.js"></script>
</body>

</html>