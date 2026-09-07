<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 27. 오전 9:04:53</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Subin YaHo</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <br>
  <br>
  <a href="/days16/replyboard/list.do">답변형 게시판 목록보기</a>
  <br>
  <xmp class="code">
      1. 폴더 생성
   days16.ex01.jsp 
     ㄴ replayboard 폴더 생성
  2. 폴더 생성    
   WEB-INF
     ㄴ views
         ㄴ days16  
             ㄴ replayboard 폴더 생성
  3. 패키지 생성
    1) days16.replyboard.command           
    2) days16.replyboard.controller           
    3) days16.replyboard.domain           
    4) days16.replyboard.persistence           
    5) days16.replyboard.service 
    
      //////////////////////////////////////////////////////
   [1] 답변형 게시판(계층형 게시판) - DB 테이블
   글번호 제목           작성자 ...   등등 컬럼...
   1      첫번째게시글   홍길동(새글)
   2      두번째게시글   서영학(새글)
   3      세번째게시글   정창기(새글)
   4     2-1 답글     류호훈(답글)    
   5     4   답글     류호훈(답답글) 
   6     2-2 답글     류호훈(답글)   
   7     3-1 답글     류호훈(답글) 
   
   //////////////////////////////////////////////////////
   X ORDER BY 글번호 DESC
   [2] 답변형 게시판(계층형 게시판) - 뷰(list.jsp) 출력
   글번호 제목           작성자 ...   등등 컬럼... 
   3      세번째게시글   정창기(새글)
   7       ㄴ 3-1 답글     류호훈(답글) 
   2      두번째게시글   서영학(새글)
   6       ㄴ 2-2 답글     류호훈(답글)   
   4       ㄴ 2-1 답글 류호훈(답글) 
   5          ㄴ4   답글     류호훈(답답글)
   1      첫번째게시글   홍길동(새글)    
   //////////////////////////////////////////////////////
   [새글]
   규칙-1.  새글의 글그룹(REF)는 글번호로 설정한다. 
   규칙-2.  새글의 그룹순서(STEP)는 1로 설정한다. 
   규칙-3.  새글의 깊이(DEPTH)는 0로 설정한다.
   [답글]  부모글의 글그룹, 그룹순서, 깊이
   규칙-1.  답글의 글그룹(REF)는 부모글의 글그룹으로 설정한다.
    
   규칙-2-0.  동일 그룹의 부모 그룹순서보다 큰 그룹순서는 1증가 시킨다. 
   규칙-2-1.  답글의 그룹순서(STEP)는 부모글의 그룹순서(STEP)+1로 설정한다.
    
   규칙-3.  답글의 깊이(DEPTH)는 부모글의 깊이(DEPTH)+1로 설정한다.
   
   //////////////////////////////////////////////////////
   [1] 답변형 게시판(계층형 게시판) - DB 테이블
   글번호 제목           작성자 ...   글그룹(REF) 그룹순서(STEP)  깊이(DEPTH) 
   1      첫번째게시글   홍길동(새글)      1           1             0
   2      두번째게시글   서영학(새글)      2           1             0
   3      세번째게시글   정창기(새글)      3           1             0
   4     2-1 답글     류호훈(답글)         2           4             1
   5     4   답글     류호훈(답답글)       2           6               2 
   6     2-2 답글     류호훈(답글)         2           2             1
   7     3-1 답글     류호훈(답글)       3            2             1
   8     6답글         답답글          2             3             2
   9    4 답글                         2           5              2
   //////////////////////////////////////////////////////
   X ORDER BY 글번호 DESC
   ORDER BY ref DESC, step ASC
   [2] 답변형 게시판(계층형 게시판) - 뷰(list.jsp) 출력
   글번호 제목           작성자 ...   글그룹(REF) 그룹순서(STEP)  깊이(DEPTH)
   3      세번째게시글   정창기(새글)      3           1             0 
   2      두번째게시글   서영학(새글)      2           1             0
   6       ㄴ 2-2 답글     류호훈(답글)         2           2             1
   4       ㄴ 2-1 답글     류호훈(답글)         2           3               1 
   5         ㄴ 4   답글     류호훈(답답글)       2           4               2 
   1      첫번째게시글   홍길동(새글)      1           1             0       
  
   //컬럼 두개로 처리
   //////////////////////////////////////////////////////
   [1] 답변형 게시판(계층형 게시판) - DB 테이블
   글번호 제목           작성자 ...   글그룹(REF) 그룹순서(STEP)  깊이(DEPTH) 
   
   //////////////////////////////////////////////////////
   X ORDER BY 글번호 DESC
   ORDER BY ref DESC, step ASC
   [2] 답변형 게시판(계층형 게시판) - 뷰(list.jsp) 출력
   글번호 제목           작성자 ...   글그룹(REF) 그룹순서(STEP)  깊이(DEPTH)
   
   5. 설정 
   web.xml -> web_days16.xml
  </xmp>
</div>
<script>

</script>
</body>
</html>