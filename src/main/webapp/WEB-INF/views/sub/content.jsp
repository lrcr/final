<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid">
<div class="row">
	<c:forEach items="${broadcast}" var="dto">
		<!--sample1-->
		<div class="col-sm-6 col-md-3 tv-detail" id="${dto.no}th-store">
			<div class="thumbnail">
				<div class="embed-responsive embed-responsive-4by3">
					<iframe class="embed-responsive-item" src="${dto.link}"></iframe>
				</div>
				<div class="caption">
					<h3 class="cont-nm">${dto.nm}</h3>
					<p>${dto.tv}</p>
					<p><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#storedetail${dto.no}">상세정보 </a></p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
</div>
<!--.row 끝-->