<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                          <input type="button" class="btn btn-default" value="중복체크" id="emailcheck">
                        </span>
                      </div>
                      <label class="control-label" for="emailinput" id="emailMsg"></label>
                    </div>
                    
                    <div class="form-group col-lg-12">
                      <div class="input-group">
                        <input type="text" class="form-control" id="nicknameinput" placeholder="Nick Name">
                        <span class="input-group-btn">
                          <button class="btn btn-default" type="button">중복체크</button>
                        </span>
                      </div>
                      <label class="control-label" for="nicknameinput" id="nicknmMsg"></label>
                    </div>
                    
                    <div class="form-group col-lg-12">
                      <input class="form-control" id="password1" type="password" placeholder="password">
                      <label class="control-label" for="password1" id="pw1Msg"></label>
                    </div>
                    
                    
                    <div class="form-group col-lg-12">
                      <input class="form-control" id="password2" type="password" placeholder="password check">
                      <label class="control-label" for="password2" id="pw2Msg"></label>
                    </div>
                    
                    <div class="form-group col-lg-12">
                      <input class="form-control" id="phone" placeholder="phone(- 없이 입력)">
                      <label class="control-label" for="phone" id="phoneMsg"></label>
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
                        <input type="button" class="btn btn-default"  class="close" data-dismiss="modal" value="취소">
                        <input type="button" class="btn btn-primary" value="가입" >
                      </div>
                    </div>
                    
                  </fieldset>
                </form>
              </div>
            </div><!-- /.modal-content -->
          </div>
        </div>