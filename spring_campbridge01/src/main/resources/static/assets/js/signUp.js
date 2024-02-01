/**
 * 회원가입
 */

 
 	$(function(){
		 let chkKeyUp=0;
		 
		 //가입하기 버튼 클릭
		 $("#savebtn").click(function(){
			 let idpattern = /^[a-zA-Z]{1}[a-zA-Z0-9]{3,7}$/;
			 let pwpattern = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@$%^&().,]).{5,11}$/;
			 let namepattern = /^[ㄱ-ㅎ가-힣]{1,}$/;
			 let nicknamepattern = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{0,4}$/;
			 
			 let id = $("#id").val();
			 let pw = $("#pw1").val();
			 let name = $("#name").val();
			 let nickname = $("#nickname").val();
			 
			 if(!namepattern.test(name)){
				 alert("이름은 한글만 가능합니다.");
				 return false;
			 }
			 if(!idpattern.test(id)){
				 alert("아이디는 4~8자리 영문, 숫자만 사용이 가능합니다.");
				 return false;
			 }
			 if(chkKeyUp!=1){
				 alert("아이디 중복체크를 하셔야 다음으로 진행이 가능합니다.");
				 return false;
			 }
			 if(!pwpattern.test(pw)){
				 alert("비밀번호는 영문,숫자,특수문자 1개 이상 입력하셔야 합니다.");
				 return false;
			 }
			 if(!nicknamepattern.test(nickname)){
				 alert("닉네임은 한글,영문,숫자를 포함한 5자까지만 사용가능합니다.");
				 return false;
			 }
			 
			 
			  //비밀번호 일치 확인
			 function passConfrim(){
				 
				let password = document.getElementById('pw1');
				let passwordConfirm = document.getElementById('pw2');
				let confrimMsg = document.getElementById('confirmMsg');
				let correctColor = "#00ff00";
				let wrongColor ="#ff0000";
				
				if(password.value == passwordConfirm.value){
					confirmMsg.style.color = correctColor;
					$("#confirmMsg").text("비밀번호 일치");
				}else{
					confirmMsg.style.color = wrongColor;
					//confirmMsg.innerHTML ="비밀번호 불일치";
					$("#confirmMsg").text("비밀번호 불일치");
				}
			}  //비밀번호 일치 확인
			 
			//phone input value값에 넣음
		   $("#phone").val($("#f_tell").val()+"-"+$("#m_tell").val()+"-"+$("#l_tell").val());
		   
		   //email input value값에 넣음
		   $("#mail_id").val()+"@"+$("#main_tail").val();
			 
			 
			 
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
		 
		 
		 
		 //아이디체크
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