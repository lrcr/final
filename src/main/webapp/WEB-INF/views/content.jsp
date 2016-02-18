<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
		<c:forEach items="${broadcast}"  var="dto">
        <!--sample1-->
        <div class="col-sm-2 col-md-2">
          <div class="thumbnail">
            <div class="embed-responsive embed-responsive-4by3">
              <iframe class="embed-responsive-item" src=${dto.link}></iframe>
            </div>
            <div class="caption">
              <h3>${dto.nm}</h3>
              <p>${dto.keyword }</p>
              <p><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#storedetail">상세정보</a>
            </div>
          </div>
        </div>
        </c:forEach>
        
</div><!--.row 끝-->
      
      <!--#storedetail-->
      
         <div id="storedetail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">여긴어디</h4>
              </div>
              <div class="modal-body">
                
                <span class="star-rating">
                  <input type="radio" name="rating" value="1"><i></i>
                  <input type="radio" name="rating" value="2"><i></i>
                  <input type="radio" name="rating" value="3"><i></i>
                  <input type="radio" name="rating" value="4"><i></i>
                  <input type="radio" name="rating" value="5"><i></i>
                </span>
                <strong class="choice">제 점수는요</strong>
        
              </div>
            </div><!-- /.modal-content -->
          </div>
        </div>