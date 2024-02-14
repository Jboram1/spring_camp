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
			
			if ($("input[type='checkbox']:checked").length!=1) {
			    alert("1개라도 선택하셔야 검색이 됩니다.");
			    return false;
			}
			
			$("input[type=checkbox]:checked").each(function(){
			const value = $(this).val();
			console.log(value);
			});			
			
			
			
			
			
			
			
			
			
		});//csearchBtn		
	});//j



	


 