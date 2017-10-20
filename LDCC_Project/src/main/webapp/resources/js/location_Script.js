

			/* 검색을 했을때 나올 화면 */
			function searchBtn(){
				
			
			var contents=[];		//이름
			var positions=[];		//위치
			var moveLatLon;	//이동지역이름
			var searchResult="";
			
			var larea = $("#larea").val();
			var lname = $("#lname").val();
			
			// 검색 : 지역과 매장 이름을 보냅니다.
			var sendData = "larea="+larea+"&lname="+lname;
			
			$.ajax({
				type:"post",
				url:"location.do?method=search",
				data:sendData,
				dataType:"json",
				success:function(jdata){
					
					
					 for(var idx=0;idx<jdata.list.length;idx++){
						 //AJAX를 이용하여 해당 지역, 이름, 주소, 연락처, 운영시간 등을 받습니다.
						 //당연히 지역만 있고 이름이 없을경우에는 해당 지역에 있는 모든 매장정보 리스팅!
						 searchResult += '<div style=" width: 100%; height:100px;margin-bottom: 3%;border-top: 1px solid;text-align: left;margin-left: 0%;padding-left: 3%;">'+
							'<a style=" color: white; font-size: 20px;" href="javascript:moves(\''+jdata.list[idx].larea+'\''+','+'\''+jdata.list[idx].lname+'\');">'+jdata.list[idx].lname+'</a>'+
							'<p style=" color: white; "><span>'+jdata.list[idx].ladd+'</span><br>'+
							'<span>'+jdata.list[idx].lphone+'</span><br>'+
							'<span>'+jdata.list[idx].lsertime+'</span><br></p></div>'
				
						 var content =  '<div class="customoverlay">' +
						    '  <a href="'+jdata.list[idx].lweb+'" target="_blank">' +
						    '    <span class="title">'+jdata.list[idx].lname+'</span>' +
						    '  </a>' +
						    '</div>';
					
						contents.push(content);
						
						// 마커를 표시할 위치 객체 배열입니다 
						var latlng = new daum.maps.LatLng(jdata.list[idx].llati, jdata.list[idx].llong);
						
						positions.push(latlng);
					 
					 }	//for end
						
					 	//div에 적용
					 	$("#searchClub").html(searchResult);
				
					    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
						
					    mapOption = { 
					        center: positions[0], // 지도의 중심좌표
					        level: 4 // 지도의 확대 레벨
					    };
						
						var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						// 지도에 확대 축소 컨트롤을 생성한다
						var zoomControl = new daum.maps.ZoomControl();
			
						// 지도의 우측에 확대 축소 컨트롤을 추가한다
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
						
						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "https://pixabay.com/static/uploads/photo/2013/07/13/01/09/map-155194_960_720.png";
						var imageSize = new daum.maps.Size(64, 69); // 마커이미지의 크기
						
						for (var i = 0; i < positions.length; i ++) {
						    
						    // 마커 이미지의 이미지 크기 입니다
						    var imageSize = new daum.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
						    
						     var marker = new daum.maps.Marker({
						    position: positions[i], // 마커를 표시할 위치
						    image: markerImage // 마커이미지 설정 
						     });
						  
						     marker.setMap(map);
						  
						    // 마커를 생성합니다
						   var customOverlay = new daum.maps.CustomOverlay({
						        map: map, // 마커를 표시할 지도
						        position: positions[i], // 마커를 표시할 위치
						        content:contents[i],
						        image : markerImage, // 마커 이미지 
						      	yAnchor: 0.1
						    });
						     
						}
								
						}
						
					})
			
					// 이동할 위도 경도 위치를 생성합니다 
					moveLatLon = positions[0];
					   
				    // 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(moveLatLon); 
					
				}
			
			
			
				// 매장의 위치로 이동
				function moves(larea,lname){
					
												
					var contents=[];		//이름
					var positions=[];		//위치
					var moveLatLon;	//이동지역이름
					var searchResult="";
					
					var sendData = "larea="+larea+"&lname="+lname;
					
					
					
					$.ajax({
						type:"post",
						url:"location.do?method=search",
						data:sendData,
						dataType:"json",
						success:function(jdata){
							
							
							 for(var idx=0;idx<jdata.list.length;idx++){
								 
								 //alert(jdata.list[0].firstcoor+", "+jdata.list[0].secondcoor);
								 //alert(jdata.list[idx].name);
								 //alert(jdata.list[idx].url);
								 //alert(jdata.list[idx].address);
								 //alert(jdata.list[idx].firstCoor);
								 //alert(jdata.list[idx].secondCoor); 
								 //alert(jdata.list[idx].phone);
								 //alert(jdata.list[idx].octime);
								 
								  searchResult += '<div style=" width: 100%; height:100px;margin-bottom: 3%;border-top: 1px solid;text-align: left;margin-left: 0%;padding-left: 3%;">'+
									'<a style=" color: white; font-size: 20px;" href="javascript:moves(\''+jdata.list[idx].larea+'\''+','+'\''+jdata.list[idx].lname+'\');">'+jdata.list[idx].lname+'</a>'+
									'<p style=" color: white; "><span>'+jdata.list[idx].ladd+'</span><br>'+
									'<span>'+jdata.list[idx].lphone+'</span><br>'+
									'<span>'+jdata.list[idx].lsertime+'</span><br></p></div>'
										 
							
								 
									
								 var content =  '<div class="customoverlay">' +
								    '  <a href="'+jdata.list[idx].lweb+'" target="_blank">' +
								    '    <span class="title">'+jdata.list[idx].lname+'</span>' +
								    '  </a>' +
								    '</div>';
							
								contents.push(content);
								   
								 
								// 마커를 표시할 위치 객체 배열입니다 
							
								var latlng = new daum.maps.LatLng(jdata.list[idx].llati, jdata.list[idx].llong);
								
								positions.push(latlng);
							 
								
							 }	//for end
								
							 	
							 	//div에 적용
							 	$("#searchClub").html(searchResult);
						
							 
							    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
								
							    mapOption = { 
							        center: positions[0], // 지도의 중심좌표
							        level: 4 // 지도의 확대 레벨
							    };
								
							    
							    
							    
							    
								var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
								
								// 지도에 확대 축소 컨트롤을 생성한다
								var zoomControl = new daum.maps.ZoomControl();
					
								// 지도의 우측에 확대 축소 컨트롤을 추가한다
								map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
								
								
							
								// 마커 이미지의 이미지 주소입니다
								var imageSrc = "https://pixabay.com/static/uploads/photo/2013/07/13/01/09/map-155194_960_720.png";
								var imageSize = new daum.maps.Size(64, 69); // 마커이미지의 크기
								
								  
								  
								for (var i = 0; i < positions.length; i ++) {
								    
							
								    // 마커 이미지의 이미지 크기 입니다
								    var imageSize = new daum.maps.Size(24, 35); 
								    
								    // 마커 이미지를 생성합니다    
								    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
								    
								     var marker = new daum.maps.Marker({
								    position: positions[i], // 마커를 표시할 위치
								    image: markerImage // 마커이미지 설정 
								     });
								  
								     marker.setMap(map);
								  
							
								    // 마커를 생성합니다
								   var customOverlay = new daum.maps.CustomOverlay({
								        map: map, // 마커를 표시할 지도
								        position: positions[i], // 마커를 표시할 위치
								        content:contents[i],
								        image : markerImage, // 마커 이미지 
								      	yAnchor: 0.1
								    });
								     
					  
								}
									
							
										
								}
								
							})
					
							
							// 이동할 위도 경도 위치를 생성합니다 
							moveLatLon = positions[0];
							    
						    // 지도 중심을 부드럽게 이동시킵니다
						    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
						    map.panTo(moveLatLon); 
			
				}