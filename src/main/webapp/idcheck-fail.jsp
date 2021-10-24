<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<title>아이디 사용불가</title>
		<script type="text/javascript">
		    opener.document.getElementById("flag").value = "";
		    function closePopup() {
		    	opener.document.getElementById("id").value = "";
		        opener.document.getElementById("id").focus();
		        self.close();
		    }
		</script>
	</head>
	<body>
	    <%=request.getParameter("id") %> 아이디 중복되어 사용불가합니다 <br><br>
	    <button type="button" class="btn btn-info" onclick="closePopup()">확인</button>
	</body>
</html>





