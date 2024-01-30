/**
 * 회원가입
 */

 
 	$(function(){
		 let chkKeyUp=0;
		 
		 //가입하기 버튼 클릭
		 $("#savebtn").click(function(){
			 if(chkKeyUp!=1){
				 alert("아이디 중복체크를 하셔야 다음으로 진행이 가능합니다.");
				 return false;
			 }
			 
			 //ajax
			 $.ajax({
				 url:"/my/signUp",
				 type:"post",
				 data:$("#userSignupFrm").serialize(),
				 dataType:"text",
				 success:function(data){
					 alert("성공");
					 console.log("data :"+data);
					 if(data=="가입완료"){
						 alert("회원가입이 완료 되었습니다.");
						 location.href="signUp02";
					 }
				 },
				 error:function(){
					 alert("실패");
				 }
			 });//ajax
			 
		 });//savebtn
		 
		 
		 
		 $("#idCheckBtn").click(function(){
			 console.log($("id").val());
			 
			 //아이디가 있는지 체크
			 if($("#id").val().length<1){
				alert("아이디를 입력하셔야 체크 가능합니다.");
				$("#id").focus();
				return false;
			 }
			 
			 //ajax
			 $.ajax({
				 url:"/my/idCheck",
				 type:"post",
				 data:{"id":$("#id").val()},
				 dataType:"text",
				 success:function(data){
					 if(data=="사용가능"){
						 $("#chkTxt").text("아이디 사용가능");
						 $("#chkTxt").css({"color":"blue","font-weight":"700"});
					 }else{
						 $("#chkTxt").text("아이디 사용불가");
						 $("#chkTxt").css({"color":"red","font-weight":"700"});
					 }
					 console.log("data : "+data);
					 chkKeyUp=1;
				 },
				 error:function(){
					 alert("실패");
				 }
			 });//ajax
		 });//idCheckBtn
		 
		 
	 });//j