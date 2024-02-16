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
	
	
	
	
	
	/* 뷰페이지 지도 ${map.gcdto.mapX}, ${map.gcdto.mapY}*/
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		  mapOption = { 
		        center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		  position: markerPosition,
		  image: markerImage // 마커이미지 설정 
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
		
		// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var content = '<div class="customoverlay">' +
		    '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
		    '    <span class="title">구의야구공원</span>' +
		    '  </a>' +
		    '</div>';
		
		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(37.54699, 127.09598);  
		
		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
		    map: map,
		    position: position,
		    content: content,
		    yAnchor: 1 
		});
		
		
		
	/* 뷰페이지 표 */	
	



	


 