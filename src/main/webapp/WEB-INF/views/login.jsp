<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <input class="form-control" placeholder="E-mail" name="email" type="email" id="loginid" autofocus="">
                            <label class="control-label" for="loginid"></label>
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="password" type="password" id="loginpw" >
                            <label class="control-label" for="loginpw"></label>
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
                    <a href="#" class="btn btn-lg btn-primary btn-block">Login</a>
              </div>
            </div>
          </div>
        </div>