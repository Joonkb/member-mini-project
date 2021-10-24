<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>본인확인</title>
	</head>
	<body>
	    <div class="container">
	        <%
	        // 테스트용 세션 저장
	        session.setAttribute("test", "test");
	        %>
	        <script type="text/javascript">
	            if (sessionStorage.getItem("test") == null) {
	                alert("로그인을 먼저 해주세요!");
	                self.close();
	            }
	        </script>
		    <form action="PwCheckServlet" method="post">
		        <div class="form-group">
		            <label for="pwd">현재 비밀번호:</label> 
		            <input type="password" class="form-control" value="" name="now_pwd" required="required">
		        </div><br>
		        <button class="btn btn-primary">입력</button>
	        </form>
	    </div>
    </body>
</html>