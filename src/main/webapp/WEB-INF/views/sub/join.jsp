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
                        <input type="email" class="form-control joinbox" name="email" id="emailinput" placeholder="E-Mail">
                          <span class="input-group-btn">
                          <input type="button" class="btn btn-default" value="중복체크" id="emailcheck">
                        </span>
                      </div>
                      <label class="control-label joinlabel" for="emailinput" id="emailMsg"></label>
                    </div>                                      
                  
                    <div class="form-group col-lg-12">
                      <input class="form-control joinbox" id="password1" type="password" placeholder="password">
                      <label class="control-label joinlabel" for="password1" id="pw1Msg"></label>
                    </div>
                    
                    
                    <div class="form-group col-lg-12">
                      <input class="form-control joinbox" id="password2" type="password" placeholder="password check">
                      <label class="control-label joinlabel" for="password2" id="pw2Msg"></label>
                    </div>
                    
                    <div class="form-group col-lg-12">
                      <div class="input-group">
                        <input type="text" class="form-control joinbox" id="nicknameinput" name="nickname"  placeholder="Nick Name">
                        <span class="input-group-btn">
                          <input type="button" class="btn btn-default" value="중복체크" id="nmcheck">
                        </span>
                      </div>
                      <label class="control-label joinlabel" for="nicknameinput" id="nicknmMsg"></label>
                    </div>
                    
                    <div class="form-group col-lg-12">
                      <input class="form-control joinbox" id="phone" placeholder="phone(- 없이 입력)">
                      <label class="control-label joinlabel" for="phone" id="phoneMsg"></label>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-lg-6 control-label">카카오톡 알림 수신 동의 여부</label>
                     
                      	<div class="btn-group" data-toggle="buttons">
						  <label class="btn btn-primary active">
						    <input type="radio" class="join-radio" name="options" id="option1" autocomplete="off" checked> 수신
						  </label>
						  <label class="btn btn-primary">
						    <input type="radio" class="join-radio" name="options" id="option2" autocomplete="off"> 거부
						  </label>
						</div>
                    </div>
                    
                    <div class="form-group">
                      <div class="col-lg-12 col-lg-offset-4">
                        <input type="button" class="btn btn-default cancle-btn"  data-dismiss="modal" value="취소">
                        <input type="button" id="submit-btn" class="btn btn-primary"  data-dismiss="modal"  value="가입">
                      </div>
                    </div>
                    
                  </fieldset>
                </form>
              </div>
            </div><!-- /.modal-content -->
          </div>
        </div>