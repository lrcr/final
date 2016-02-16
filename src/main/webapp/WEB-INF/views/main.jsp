<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>True맛집</title>
        <link rel="stylesheet" href="https://bootswatch.com/slate/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/star.css" type="text/css" />
        <link rel="stylesheet" href="css/join.css" type="text/css" />
        
        <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <style>
            .modal-dialog{
                z-index:10000;
            }
        </style>
    </head>
    
    <body>
        
        <%@include file="navbar.jsp" %>
        <%@include file="login.jsp" %>
        <%@include file="join.jsp" %>
        <%@include file="content.jsp" %> 
        <script type="text/javascript" src="js/join.js"></script>
        <script type="text/javascript" src="js/star.js"></script>
        
        
    </body>
</html>