<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Login -->
        <div class="modal fade" id="sign-in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >로그인</h4>
              </div>
              <div class="modal-body">
                <form id="login-form" role="form">
                    <fieldset>
                    
                        <div class="form-group col-lg-12">
                            <input type="email"  class="form-control login-box" placeholder="E-mail" name="email" id="loginid" >
                            <label id="id-label" class="control-label login-label" for="loginid"></label>
                        </div>
                        <div class="form-group col-lg-12">
                            <input type="password"  class="form-control login-box" placeholder="Password" name="password" id="loginpw" >
                            <label id="pw-label" class="control-label login-label"  for="loginpw"></label>
                        </div>
                        <!-- <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="Remember Me">Remember Me
                            </label>
                        </div> -->
                    </fieldset>
                </form>
              </div>
              <div class="modal-footer">
                    <input type="button" id="login-btn" class="btn btn-lg btn-primary btn-block" data-dismiss="modal" value="Login">
              </div>
            </div>
          </div>
        </div>