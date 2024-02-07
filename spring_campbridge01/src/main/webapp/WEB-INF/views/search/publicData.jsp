<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
		  #main{width:1600px; margin:20px auto; text-align: center; }
		  #body{width:1600px; height:700px; margin:20px auto; border:3px solid black; }
		  table{width:1400px; margin:0 auto; }
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
								hadata += '<tr>';
								hadata += '<td>'+iarr[i].contentId+'</td>';
								hadata += '<td>'+iarr[i].facltNm+'</td>';
								hadata += '<td>'+iarr[i].doNm+'</td>';
								hadata += '<td>'+iarr[i].homepage+'</td>';
								hadata += '<td>'+iarr[i].operDeCl+'</td>';
								hadata += '<td>'+iarr[i].themaEnvrnCl+'</td>';
								hadata += '<td><img src="'+ iarr[i].firstImageUrl +'"></td>';
								hadata += '</tr>';
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
		         <col width="8%">
		         <col width="18%">
		         <col width="11%">
		         <col width="16%">
		         <col width="15%">
		         <col width="23%">
		         <col width="9%">
		       </colgroup>
		       <thead>
			       <tr>
			         <th>contentId</th>
			         <th>facltNm</th>
			         <th>doNm</th>
			         <th>homepage</th>
			         <th>operDeCl</th>
			         <th>themaEnvrnCl</th>
			         <th>firstImageUrl</th>
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
			       </tr>
		       </tbody>
		     
		     </table>
		   
		   </div>
	   </div>
	
	</body>
</html>