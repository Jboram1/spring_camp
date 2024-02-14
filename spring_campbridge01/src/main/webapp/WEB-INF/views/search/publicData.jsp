<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
		  #main{width:100%;margin:20px auto; text-align: center; }
		  #body{width:100%;height:700px; margin:20px auto; border:3px solid black; }
		  table{width:100%;margin:0 auto; }
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		  th{height:40px; }
		  td{height:35px; }
		  td img{width:50%;}
		</style>
		
		<script>
			$(function(){
				$("#btn").click(function(){
					alert("공공데이터 캠핑장 리스트");
					let gCam = [];
					
					$("button[type='button']").each(function(){
						gCam.push($(this).val());
					});
					
					$.ajax({
						url:"/search/gCamData",
						type:"get",
						data:{"gCam":gCam},
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
		         <col width="25%">
		         <col width="25%">
		         <col width="25%">
		         <col width="25%">
		         
		       </colgroup>
		       <thead>
			       <tr>
			         <th>c</th>
			         <th>f</th>
			         <th>d</th>
			         <th>h</th>
			         
			       </tr>
		       </thead>
		       <tbody id="content">
			       <tr>
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