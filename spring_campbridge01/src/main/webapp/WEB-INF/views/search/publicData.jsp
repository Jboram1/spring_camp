<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
		  #main{margin:20px auto; text-align: center; }
		  #body{height:700px; margin:20px auto; border:3px solid black; }
		  table{margin:0 auto; }
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		  th{height:40px; }
		  td{height:35px; }
		  td img{width:50%;}
		</style>
		
		<script>
			$(function(){
				$("#btn").click(function(){
					alert("공공데이터 캠핑장 리스트");
					let txt = $("#txt").val();
					
					$.ajax({
						url:"/search/searchData",
						type:"get",
						data:{"txt":txt},
						dataType:"json",
						success:function(data){
							alert("성공");
							console.log("전체데이터 : "+data);
							let iarr = data.response.body.items.item;
							let hdata = "";
							for(let i=0;i<iarr.length;i++){
								hdata += '<tr>';
								hdata += '<td>'+iarr[i].contentId+'</td>';
								hdata += '<td>'+iarr[i].facltNm+'</td>';
								hdata += '<td>'+iarr[i].lineIntro+'</td>';
								hdata += '<td>'+iarr[i].intro+'</td>';
								hdata += '<td>'+iarr[i].facltDivNm+'</td>';
								hdata += '<td>'+iarr[i].mangeDivNm+'</td>';
								hdata += '<td>'+iarr[i].featureNm+'</td>';
								hdata += '<td>'+iarr[i].induty+'</td>';
								hdata += '<td>'+iarr[i].lctCl+'</td>';
								hdata += '<td>'+iarr[i].doNm+'</td>';
								hdata += '<td>'+iarr[i].sigunguNm+'</td>';
								hdata += '<td>'+iarr[i].zipcode+'</td>';
								hdata += '<td>'+iarr[i].addr1+'</td>';
								hdata += '<td>'+iarr[i].addr2+'</td>';
								hdata += '<td>'+iarr[i].mapX+'</td>';
								hdata += '<td>'+iarr[i].mapY+'</td>';
								hdata += '<td>'+iarr[i].direction+'</td>';
								hdata += '<td>'+iarr[i].tel+'</td>';
								hdata += '<td>'+iarr[i].homepage+'</td>';
								hdata += '<td>'+iarr[i].resveUrl+'</td>';
								hdata += '<td>'+iarr[i].resveCl+'</td>';
								hdata += '<td>'+iarr[i].gnrlSiteCo+'</td>';
								hdata += '<td>'+iarr[i].autoSiteCo+'</td>';
								hdata += '<td>'+iarr[i].glampSiteCo+'</td>';
								hdata += '<td>'+iarr[i].caravSiteCo+'</td>';
								hdata += '<td>'+iarr[i].indvdlCaravSiteCo+'</td>';
								hdata += '<td>'+iarr[i].siteBottomCl1+'</td>';
								hdata += '<td>'+iarr[i].siteBottomCl2+'</td>';
								hdata += '<td>'+iarr[i].siteBottomCl3+'</td>';
								hdata += '<td>'+iarr[i].siteBottomCl4+'</td>';
								hdata += '<td>'+iarr[i].siteBottomCl5+'</td>';
								hdata += '<td>'+iarr[i].tooltip+'</td>';
								hdata += '<td>'+iarr[i].glampInnerFclty+'</td>';
								hdata += '<td>'+iarr[i].caravInnerFclty+'</td>';
								hdata += '<td>'+iarr[i].operPdCl+'</td>';
								hdata += '<td>'+iarr[i].operDeCl+'</td>';
								hdata += '<td>'+iarr[i].trlerAcmpnyAt+'</td>';
								hdata += '<td>'+iarr[i].caravAcmpnyAt+'</td>';
								hdata += '<td>'+iarr[i].toiletCo+'</td>';
								hdata += '<td>'+iarr[i].swrmCo+'</td>';
								hdata += '<td>'+iarr[i].wtrplCo+'</td>';
								hdata += '<td>'+iarr[i].brazierCl+'</td>';
								hdata += '<td>'+iarr[i].sbrsCl+'</td>';
								hdata += '<td>'+iarr[i].sbrsEtc+'</td>';
								hdata += '<td>'+iarr[i].posblFcltyCl+'</td>';
								hdata += '<td>'+iarr[i].posblFcltyEtc+'</td>';
								hdata += '<td>'+iarr[i].themaEnvrnCl+'</td>';
								hdata += '<td>'+iarr[i].eqpmnLendCl+'</td>';
								hdata += '<td>'+iarr[i].animalCmgCl+'</td>';
								hdata += '<td>'+iarr[i].tourEraCl+'</td>';
								hdata += '<td><img src="'+ iarr[i].firstImageUrl +'"></td>';
								hdata += '<td>'+iarr[i].createdtime+'</td>';
								hdata += '</tr>';
							}
							$("#content").html(hdata);
						},
						error:function(){
							alert("실패");
						}
					});//ajax
					
					
					
				});//btn
			});//j		
		</script>
		
		
	</head>
	<body>
	
	<div id="main">
		   <h1>공공데이터 정보</h1>
		   <input type="text" name="txt" id="txt">
		   <button type="button" id="btn">검색</button>
		   <br><br>
		   <div id="body">
		     <table>
		       <colgroup>
		         <col width="*%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		         <col width="2%">
		       </colgroup>
		       <thead>
			       <tr>
			         <th>c</th>
			         <th>f</th>
			         <th>d</th>
			         <th>h</th>
			         <th>o</th>
			         <th>t</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>c</th>
			         <th>f</th>
			         <th>d</th>
			         <th>h</th>
			         <th>o</th>
			         <th>t</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>c</th>
			         <th>f</th>
			         <th>d</th>
			         <th>h</th>
			         <th>o</th>
			         <th>t</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>c</th>
			         <th>f</th>
			         <th>d</th>
			         <th>h</th>
			         <th>o</th>
			         <th>t</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>c</th>
			         <th>f</th>
			         <th>d</th>
			         <th>h</th>
			         <th>o</th>
			         <th>t</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			         <th>f</th>
			       </tr>
		       </thead>
		       <tbody id="content">
			       <tr>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			         <td></td>
			        
			       </tr>
		       </tbody>
		     
		     </table>
		   
		   </div>
	   </div>
	
	</body>
</html>