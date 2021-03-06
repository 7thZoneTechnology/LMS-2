<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>3조 프로젝트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<s:url value="/css/bootstrap.min.css"/>"rel="stylesheet">
    <link href="<s:url value="/css/custom.css"/>" rel="stylesheet">
    <!-- 로그인 테스트 모듈 CSS지정 시작-->
     <link href="<s:url value="/css/logintest.css"/>" rel="stylesheet">
     <!-- 로그인 테스트 모듈 CSS지정 끝-->
     <!-- 리스트 테이블 CSS 지정 시작 -->
     <link href="<s:url value="/css/listtable.css"/>" rel="stylesheet">
     <!-- 리스트 테이블 CSS 지정  끝-->
     <!-- 스타일된 버튼 CSS 지정 시작 -->
     <link href="<s:url value="/css/style.css"/>" rel="stylesheet">
     <!-- 스타일된 버튼 CSS 지정  끝-->
     
     
    <link href="<s:url value="/jquery-plugin/anythingSlider/anythingslider.css"/>" rel="stylesheet">
    <script src="<s:url value="/js/respond.js"/>"> </script>
    <script src="<s:url value="/js/jquery-1.7.2.min.js"/>"></script>
    <script src="<s:url value="/jquery-plugin/anythingSlider/jquery.anythingslider.min.js"/>"></script>
    <script src="<s:url value="/js/bootstrap.min.js"/>"></script>
  	<!--  웹에디터(Ckeditor) 적용 시작 -->
  	<script src="<s:url value="/jquery-plugin/ckeditor/ckeditor.js"/>"></script>
  	<!--  웹에디터(Ckeditor) 적용 끝 -->
		
    <script type="text/javascript">
   
  //페이지 로딩과 동시에 실행되는 자바 스크립트 및 jQuery 시작
    $(document).ready(function() {
    	
    	CKEDITOR.config.customConfig = '<s:url value="/jquery-plugin/ckeditor/config.js"/>';

	
    }); 
  
  //페이지 로딩과 동시에 실행되는 자바 스크립트 및 jQuery
		
    
  //일반적인 자바 스크립트 기능들
 
  //글쓰기폼 확인
function checkform() {
	  //제목,컨텐츠 변수 선언
	  var title = $('#title').val();
	  var content = document.getElementById('content');
	  
	  //제목이 비거나 5글자 이하일때
	  if (title.length < 5 || title=="") {
			alert("제목은 5글자 이상 적어주셔야 합니다.");
			$('#title').focus();
			$('#title').select();
			return false;
	  }
	  
	  else if (content.length<5 ){
	    	alert( '본문내용은 다섯 글자 이상 입력해주셔야 합니다.' );
	    	$('#content').focus();
	    	return false;
		}
	  
	  else{
		  $('#bbsform').submit();	
		  
		  return true;
	  }
	  
  	}
	function cancelcheck(){
		alert('정말로 취소하시겠습니까?');
	
	}
  
 
  	//페이징 관련 자바 스크립트
  function pagingFormSubmit(currentPage) {
	document.pagingForm.currentPage.value = currentPage;
	document.pagingForm.submit();
	}    
    
  	
	//일본어 작문으로 카테고리를 변경
    function changeTypeIT(){
    	if(confirm('IT 및 통합 게시판 글쓰기를 시작합니다.\n현재까지 작성된 글은 지워지게 됩니다.\n계속하시겠습니까?')){
    		//경고 및 전환
    		alert('전환하기');
    		location.href='<s:url value="/bbs/writeNewForm.action"/>';
    	}
    }
    
    
    
    
    
    
    </script>
    
</head>

<body>
<div class="container">
	<!------------- 로그인, 회원가입, 마이페이지, 로그아웃관련 부분  시작------------------------- -->
		<s:if test="%{#session.userSign.id!=null}">
				<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
					
		    		<span style="position:relative; left:70%; padding:5px;">
		    		<b>반갑습니다&nbsp;${sessionScope.userSign.id}님&nbsp;</b><!--updated-->
		    		<a href='<s:url value ="/member/mypage_details.action"/>' class="btn btn-info btn-sm">마이페이지</a>
		    		&nbsp;
		    		&nbsp;
		    		<a href='<s:url value ="/member/logout.action"/>' class="btn btn-danger btn-sm ">로그아웃</a>
		    		</span>
	    		 </div>
		</s:if>
		<s:else>
				<div class="navbar navbar-defalut nav-justified navbar-fixed-top " style="border:1px solid black; background-color:#ddd; height:40px; padding:3px;">
			    	<span style="position:relative; left:80%; padding:5px;">
			    		<a href='<s:url value ="/member/memberJoinForm.action"/>' class="btn btn-success btn-sm">회원가입</a>
			    		&nbsp;
			    		&nbsp;
			    		<a href='<s:url value ="/member/loginForm.action"/>' class="btn btn-primary btn-sm ">로그인</a>
			    	</span>
	    		 </div>
		</s:else>
		 <!------------- /로그인, 회원가입, 마이페이지, 로그아웃관련 부분 끝------------------------- -->

<!-- 네비게이션의 액션을 정리하는곳 -->
	 <!-- 홈 --> 	
	 	 <s:url value="/index.action" var="goIndex"></s:url>
	 	
	 
	 <!-- 커뮤니티 -->
  		 <!-- 통합게시판으로 이동함 -->
  	 	 <s:url value="/bbs/bbsList.action" var="goBbsList"></s:url>



    <!-- row 1: header -->
    <header class="row">
    	<div class="col-lg-4 col-sm-5">
        	<a href="index.jsp"><img src="/LMS/images/KUpEzwG.gif" alt="Wisdom Pets. click for home." class="img-responsive" style="height:200px;"></a>
        </div>
    	<div class="col-lg-8 col-sm-7">
        	<img src="/LMS/images/logo.gif" alt="" class="hidden-xs img-responsive">
        </div>
    </header>



	<!-- row 1: navigation -->

   	<div class="row">

    	<nav class="navbar navbar-default navbar-inverse nav-justified">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collapse">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="collapse">
                <ul class="nav navbar-nav">
                    <li><a href='<s:property value="#goIndex"/>'>홈</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학사관리<span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                        	<li><a href="#">회원관리</a></li>
                            <li><a href="attendance/goAttendanceCheck.action">출석관리</a></li>
                            <li><a href="#">성적관리</a></li>
                            <li><a href="#">상담관리</a></li>
                        </ul>                    
                    </li>
                    
                    <li class="dropdown"><a href="#" data-toggle="dropdown">학습관리 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                        	<li><a href="#">강의관리</a></li>
                            <li><a href="#">강의목록</a></li>
                            <li><a href="#">일정관리</a></li>
                        </ul>                    
                    </li>
                    
                     
                    <li class="dropdown"><a href="#" data-toggle="dropdown">커뮤니티 <span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                        	<li><a href='<s:property value="#goBbsList"/>'>통합 게시판</a></li>
                            <li><a href="#">외국어 게시판</a></li>
                        </ul>                    
                    </li>
                    <li><a href="#">사이트 정보</a></li>
                </ul> 
            </div>
         </nav> 
    </div>
  
<!-------------------------------------------컨텐츠 부분-------------------------------------------------------------- --> 
    
    <!-- row 3: article/aside -->
    
    <div class="row">
    	<article class="thumbnail col-lg-10 col-sm-10 col-lg-push-2 col-sm-push-2 "> 
        
            <ol class="breadcrumb">
              <li><a href='<s:property value="#goIndex"/>'>홈</a> <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>커뮤니티 <span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li class="active"><a href='<s:property value="#goBbsList"/>'>통합 게시판</a><span class="glyphicon glyphicon-circle-arrow-right"></span></li>
              <li>새로운 글 쓰기</li>
            </ol>
            
        <!-- 새로운 글 쓰기  -->    
 		<div class="row">
 		<div class=" col-lg-12 ">
 		<center>
 			
			<h1><s:property value="#session.userSign.id"/>님의 글쓰기 입니다.</h1>    
			<form id="bbsform"  action="writeNew.action" method="post" enctype="multipart/form-data">
			<input type="hidden" name="board.id" id="userid" value="<s:property value="#session.userSign.id"/>" />
			<table border=0 cellpadding=3 class="table table-bordered">
			<tr>
				<td colspan=2 align=center><h2>[ 글쓰기 ]</h2></td>
			</tr>
			<tr>
				<td class="info" style="width:5%;">카테고리 </td>
				<td>
					<span id="category">IT 및 통합</span> <span id="catebutton"><a class="btn btn-success" href="javascript:changeTypeIT()" title="IT 및 통합 게시판 글쓰기"><span class="glyphicon glyphicon-book"></span></a></span>
					<input id="boardtype" type="hidden" name="board.boardtype" value="jpn"/>
				</td>
			</tr>
			<tr>
				<td class="info" style="width:5%;">제목</td>
				<td>
					<input type="text" name="board.title" value="" id="title" style="width:100%;"/>
				</td>
			</tr>
			<tr>
				<td class="info">내용</td> 
				<td>
					<textarea style="width:100%; resize:none;" rows ="8" name="board.content" id="content"></textarea>
					<script> editor=CKEDITOR.replace('content'); </script>
				</td>
			</tr>
			<tr>
				<td class="info">파일첨부</td> 
				<td><input type="file" name="upload" size="30" value="" id="boardWrite_upload"/></td>
					<%-- <s:file name="upload" size="30"/> --%>
					<!--  -->
				
			</tr>
			<tr>
				<td colspan="2" align=center>
    					  <div class="button-row">
						    <a href="javascript:checkform()" class="button square blue effect-2">완료</a> 
						    <a href="javascript:cancelcheck()" class="button square red effect-2">취소</a>
						  </div>
						
				</td> 
			</tr>
			</table>
			</form>
			
			
			
			
			</center>
		  </div>
         </div>		
                  
      
        </article>
       
        <aside class="col-lg-2 col-sm-2 col-lg-pull-10 col-sm-pull-10 ">
       		
       		<div class="thumbnail">
       			<h3>스택 네비게이션</h3>
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#">선택사항1</a></li>
                <li><a href="#">선택사항2</a></li>
                <li><a href="#">선택사항3</a></li>
                <li><a href="#">선택사항4</a></li>
            </ul> 
       		
       		
       		</div>
       
        </aside>
        
 </div><!-- end row 3 -->       
<!-------------------------------------------컨텐츠 부분-------------------------------------------------------------- --> 
    	

    <!-- row 4 -->
    <footer class="row">
         <p><small>본 웹사이트는 SC마스터 학생들을 지원하기 위해 테스트중이며 현재 어떠한 경제적 지원도 받고 있지 않습니다.</small></p>
         <p><small> Produced by Young-Bo Lee, team 3 Leader.  all right reserved.</small></p>
    </footer>

</div>
 <!-- end container -->

<!-- javascript -->
<!-- 	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
		$('a.btn-info').tooltip()
			$('#slider').anythingSlider();
	</script> -->
</body>
</html>
