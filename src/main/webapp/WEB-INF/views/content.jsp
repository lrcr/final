<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">

        <!--sample1-->
        <div class="col-sm-6 col-md-4">
          <div class="thumbnail">
            <div class="embed-responsive embed-responsive-4by3">
              <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/fFZwgPcW7FM"></iframe>
            </div>
            <div class="caption">
              <h3>등나무집</h3>
              <p>꼬리찜 뿐만아니라 도가니무침과 도가니탕 그리고 꼬리탕까지 야무지게 먹어야지</p>
              <p><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#storedetail">상세정보</a> <a href="#" class="btn btn-default" role="button">예약하기</a></p>
            </div>
          </div>
        </div>
        
        <!--sample2-->
        <div class="col-sm-6 col-md-4">
          <div class="thumbnail">
            <div class="embed-responsive embed-responsive-4by3">
              <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/ly6J5BQkXgA"></iframe>
            </div>
            <div class="caption">
              <h3>디저트리</h3>
              <p>디저트 카페? 디저트 뷔페! 디저트도 코스로 즐겨보자!!</p>
              <p><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#storedetail" >상세정보</a> <a href="#" class="btn btn-default" role="button">예약하기</a></p>
            </div>
          </div>
        </div>
        
        <!--sample3-->
        <div class="col-sm-6 col-md-4">
          <div class="thumbnail">
            <div class="embed-responsive embed-responsive-4by3">
              <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/qWvuqFhrTTU"></iframe>
            </div>
            <div class="caption">
              <h3>줄리에뜨</h3>
              <p>파리 르 꼬르동 블루 출신 쉐프의 수제 타르트!</p>
              <p><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#storedetail">상세정보</a> <a href="#" class="btn btn-default" role="button">예약하기</a></p>
            </div>
          </div>
        </div>
       
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