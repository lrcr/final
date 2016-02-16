<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>test</title>
        <link rel="stylesheet" href="https://bootswatch.com/slate/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/star.css" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        
        <style>
            .modal-dialog{
                z-index:10000;
            }
        </style>
        
    </head>
    
    <body>
       <nav class="navbar navbar-default">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="test.go">HOME</a>
            </div>
        
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                <li><a href="#">여기어때</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                    <li class="divider"></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li>
                <li><a href="#" data-toggle="modal" data-target="#sign-in">로그인</a></li>
                <li><a href="#" data-toggle="modal" data-target="#sign-up">회원가입</a></li>
              </ul>
              <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="인생맛집">
                </div>
                <button type="submit" class="btn btn-default">검색</button>
              </form>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Link</a></li>
              </ul>
            </div>
          </div>
        </nav>
        
        
        <!-- Login -->
        <div class="modal fade" id="sign-in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">로그인</h4>
              </div>
              <div class="modal-body">
                <form role="form">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus="">
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="password" type="password" value="">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="Remember Me">Remember Me
                            </label>
                        </div>
                    </fieldset>
                </form>
              </div>
              <div class="modal-footer">
                    <a href="#" class="btn btn-lg btn-primary btn-block">Login</a>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 회원가입 -->
        
        <div id="sign-up" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">회원가입</h4>
              </div>
              <div class="modal-body">
                <form class="form-horizontal">
                  <fieldset>
                    
                    <div class="form-group col-lg-12">
                      <div class="input-group">
                        <input type="email" class="form-control" id="emailinput" placeholder="E-Mail">
                        <span class="input-group-btn">
                          <button class="btn btn-default" type="button">중복체크</button>
                        </span>
                      </div>
                    </div>
                    
                    <div class="form-group col-lg-12">
                      <div class="input-group">
                        <input type="text" class="form-control" id="nicknameinput" placeholder="Nick Name">
                        <span class="input-group-btn">
                          <button class="btn btn-default" type="button">중복체크</button>
                        </span>
                      </div>
                    </div>
                    
                    <div class="form-group col-lg-12">
                      <input class="form-control" id="password1" type="password" placeholder="password">
                    </div>
                    
                    
                    <div class="form-group col-lg-12">
                      <input class="form-control" id="password2" type="password" placeholder="password check">
                    </div>
                    
                    <div class="form-group col-lg-12">
                      <input class="form-control" id="phone" placeholder="phone(- 없이 입력)">
                    </div>
                    
                     <div class="form-group">
                      <label class="col-lg-6 control-label">카카오톡 알림 수신 동의 여부</label>
                      <div class="col-lg-5">
                        <div class="radio">
                          <label for="optionsRadios1">
                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="수신" checked="">
                            수신
                          </label>
                          <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="거부">
                            거부
                          </label>
                        </div>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <div class=" col-lg-offset-5">
                        <button type="submit" class="btn btn-primary">회원가입</button>
                      </div>
                    </div>
                    
                  </fieldset>
                </form>
              </div>
            </div><!-- /.modal-content -->
          </div>
        </div>
                
                
                
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
         
         
        <script type="text/javascript" src="js/star.js"></script>
        
        
    </body>
</html>