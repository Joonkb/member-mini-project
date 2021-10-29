<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>비밀번호 찾기</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"></script>
	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/i18n/defaults-*.min.js"></script>
	<style>
	    .container { padding-top: 200px; display: grid; place-content: center; }
	    .form-group { width: 300px;}
	    .align-center {
	       text-align: center;
	    }
	</style>
	<script type="text/javascript">
	   function findPasswordByEmailAndQuestion(){
	       document.getElementById("findForm").submit();
	   }
	</script>
</head>
<body>
    <%
        String[] question = {"나의 보물1호는?", "어린 시절 가장 좋아했던 장소는?", "가장 좋아하는 영화는?"};
    %>
    <div class="container">
        <div class="card-body">
            <h3 class="card-title">비밀번호 찾기</h3>
            <form class="was-validated" action="FindPasswordServlet" method="post" id="findForm">
                <div class="form-group">
                    <label for="memberId">아이디:</label> 
                    <input type="text" class="form-control" id="memberId" placeholder="등록된 아이디 입력" name="memberId" required="required" >
                </div>
                
                <div class="form-group">
	                <label for="question">보안 질문에 답하세요:</label><br>
	                    <select class="selectpicker" name="questionNo" required="required" data-width="auto">
	                        <option value="">선택하세요</option>
	                            <% for(int i = 0; i < question.length; i++)  { %> 
	                            <option value="<%=i%>"><%=question[i] %></option>
	                            <% } %>
	                    </select> <br><br>
	                    <input type="text" class="form-control" id="question" placeholder="보안질문 입력" name="question">
                </div>
            </form>
        </div>
        <div class="align-center">
           <a class="btn btn-info" onclick="findPasswordByEmailAndQuestion()">찾기</a>
           <a href="index.jsp" class="btn btn-danger">취소</a>
        </div>
    </div>
</body>
</html>