<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	푸터
	
	<script type="text/javascript">
	
	
		function checkadd2() {
			
			if( addform.name.value.length < 4 || addform.name.value.length > 50 ){   // 폼 에 id 의 값이 널이면 
				alert("상품명[최소 4글자~50글자만 허용] 입력해주세요");
				return false;
			}		
			
			// 가격이 입력이 안되어 있거나 가격이 문자가 포함되어 있으면 
			if( addform.price.value.length == 0 || isNaN( addform.price.value) ){   // 폼 에 id 의 값이 널이면 
												// isNaN(숫자) : false
												// isNaN("숫자") : false => 숫자반환 
												// isNaN( 숫자+문자 ) : true
				alert(" 가격은 숫자 입력주세요");
				return false;
			}
			if( addform.price.value < 0  ){
				alert(" 가격은 양수로만 입력주세요");
				return false;
			}
			
			
			// 재고이 입력이 안되어 있거나 재고이 문자가 포함되어 있으면 
			if( addform.stock.value.length == 0 || isNaN( addform.stock.value) ){   // 폼 에 id 의 값이 널이면 
												// isNaN(숫자) : false
												// isNaN("숫자") : false => 숫자반환 
												// isNaN( 숫자+문자 ) : true
				alert(" 재고은 숫자 입력주세요");
				return false;
			}
			if( addform.stock.value < 0  ){
				alert(" 재고은 양수로만 입력주세요");
				return false;
			}
			

		}
			// HTML : 웹문서 
			// CSS : 정적 효과 : HTML 꾸미기 
			// JS : 동적 효과 
	
		function checkadd() {
			
				// 정의 : function 함수명 () {  실행문   }
			
				if( !signupform.id.value){   // 폼 에 id 의 값이 널이면 
					alert("아이디 입력해주세요");
					return false;
				}
				
				// 영문/숫자만 id로 사용 
				var regx = /^[a-zA-Z0-9]*$/;  
					// 정규표현식 
						//   ^ : 문자 시작 지점 
						//   $ : 문자 종료 지점 
						// [  ] : 허용 범위
				if( !regx.test( signupform.id.value ) ){
					// 정규표현식이 포함되어 있지 않으면 
					alert("아이디는 영문 혹은 숫자만 가능 합니다 ");
					return false;
				}
						
				if( !signupform.password.value){   // 폼 에 id 의 값이 널이면 
					alert("패스워드 입력해주세요");
					return false;
				}
				// 패스워드 체크 
				if( signupform.password.value != signupform.passwordcheck.value ){   // 폼 에 id 의 값이 널이면 
					alert("패스워드가 동일하지 않습니다");
					return false;
				}
				
				if( !signupform.name.value){   // 폼 에 id 의 값이 널이면 
					alert("성명 입력해주세요");
					return false;
				}			
		}

	</script>
	
	
	
	
	
	
	
	
	
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</body>
</html>