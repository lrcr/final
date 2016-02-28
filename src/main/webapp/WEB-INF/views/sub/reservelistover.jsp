<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="reserve_name">${dto.nm}</div>
<div>
	<fmt:parseNumber value="${dto.eval}" var="eval" />
	<span class="star-rating small"> <c:if test="${eval==5}">
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i class="on"></i>
		</c:if> <c:if test="${eval>=4 && eval<5}">
			<i></i>
			<i></i>
			<i></i>
			<i class="on"></i>
			<i></i>
		</c:if> <c:if test="${eval>=3 && eval<4}">
			<i></i>
			<i></i>
			<i class="on"></i>
			<i></i>
			<i></i>
		</c:if> <c:if test="${eval>=2 && eval<3}">
			<i></i>
			<i class="on"></i>
			<i></i>
			<i></i>
			<i></i>
		</c:if> <c:if test="${eval>=1 && eval<2}">
			<i></i>
			<i class="on"></i>
			<i></i>
			<i></i>
			<i></i>
		</c:if> <c:if test="${eval<1}">
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
		</c:if>
	</span>
</div>
<div>${dto.addr}</div>
<div>${dto.tel}</div>