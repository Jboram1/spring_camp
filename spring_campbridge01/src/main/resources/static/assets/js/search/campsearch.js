/**
 * 캠핑장 검색
 */

	$(function(){
		
		
		//초기화버튼
		$("#searchForm3ResetBtn").click(function(){
			$('input[type="checkbox"]').prop('checked', false);
		});//searchForm3ResetBtn
			
			
			
		//검색버튼	
		$("#csearchBtn").click(function(){
			alert("검색");
			if ($("input[type='checkbox']:checked").length<1) {
			    alert("1개라도 선택하셔야 검색이 됩니다.");
			    return false;
			}
			
			$(document).ready(function() {
			    let sChk = [];
			
			    $("input[type=checkbox]").change(function() {
			        sChk = []; // 배열 초기화
			        $("input[type=checkbox]:checked").each(function(){
			            sChk.push($(this).val());
			        });
			        // sChk 배열을 콘솔에 로깅합니다.
			        console.log("sChk 배열 내용: ", sChk);
			    });
			});
			
			
			/*
			$.ajax({
				url:"/search/sChkData",
				type:"get",
				data:{"sChk":sChk},
				dataType:"json",
				success:function(data){
					alert("성공");
					console.log("전체데이터 : "+data);
					let hdata = "";
					for(let i=0;i<data.length;i++){
						hdata += '<div class="image"><img src="'+data[i].firstImageUrl+'" class="image"></div>';
						hdata += '<div class="cont">';
						hdata += '<strong>'+data[i].facltNm+'</strong>';
						hdata += '<p>'+data[i].addr1+'</p>';
						hdata += '<p>'+data[i].tel+'</p>';
						hdata += '<p>'+data[i].lineIntro+'</p>';
						hdata += '<a href="/search/campsearch_view">바로가기</a>';
						hdata += '</div>';
					}
					$(".cs_contbox").html(hdata);
					
				},
				error:function(){
					alert("실패");
				}
			});//ajax
			*/
			
			
		});//csearchBtn		
	});//j



	


 