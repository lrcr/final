<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Schedule</h1>
			</div>
		</div><!--/.row-->

<div class="row">

			<div class="col-lg-12">
				<div id='calendar'></div>
			</div>
		</div><!--/.row-->
	
								
		<div id="checkcheck" class="row" style="margin-left: 0%; margin-right: 0%;">
				<div class="panel panel-blue">
					<div class="panel-heading dark-overlay"><svg class="glyph stroked clipboard-with-paper"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></svg>체크리스트</div>
					<div class="panel-body">
						<ul class="todo-list">
							<li class="todo-list-item" style="height:5%;">
								<div class="checkbox">
									<input type="hidden"/>
									<label></label>
								</div>
								<div class="pull-right action-buttons">
									<a id="delete" href="#checkcheck" class="trash"><svg class="glyph stroked trash"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></svg></a>
								</div>
							</li>
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="btn-input" type="text" class="form-control input-md" placeholder="Add new task" />
							<span class="input-group-btn">
								<button class="btn btn-primary btn-md" id="btn-todo">Add</button>
							</span>
						</div>
					</div>
				</div>
		</div><!--/.row-->
	</div>	<!--/.main-->