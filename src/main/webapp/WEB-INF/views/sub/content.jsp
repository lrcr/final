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
					<p>	
						<span class="star-rating small"> 
						<c:if test="${dto.eval < 1} ">
							<i></i><i></i><i></i><i></i><i></i>
						</c:if>
						<c:if test="${dto.eval>=1 && dto.eval < 2} ">
							<i class="on"></i><i></i><i></i><i></i><i></i>
						</c:if>
						<c:if test="${dto.eval>=2 && dto.eval < 3} ">
							<i></i><i class="on"></i><i></i><i></i><i></i>
						</c:if>
						<c:if test="${dto.eval>=3 && dto.eval < 4} ">
							<i></i><i></i><i class="on"></i><i></i><i></i>
						</c:if>
						
						<c:if test="${dto.eval>=4 && dto.eval < 5} ">
							<i></i><i></i><i></i><i class="on"></i><i></i>
						</c:if>
						<c:if test="${dto.eval==5} ">
							<i></i><i></i><i></i><i></i><i class="on"></i>
						</c:if>
						</span>
					</p>
					<p><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#storedetail${dto.no}">상세정보 </a></p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
</div>
<!--.row 끝-->