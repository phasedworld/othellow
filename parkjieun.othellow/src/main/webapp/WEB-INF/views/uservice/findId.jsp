<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

</script>
<title>아이디 찾기</title>
</head>
<body>
	<div>
		<div>
			<div>
				<h3>아이디 찾기 검색결과</h3>
			</div>
			<div>
				<h5>
					${ user_id }
				</h5>
				<p>
					<button type="button" id=loginBtn >Login</button>
					<button type="button" onclick="history.go(-1);" >Cancel</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>