/**
 * @JavaScript : join
 * @author Areum
 * @Desc 회원가입 유효성 체크
 */
$(function(){
   
   var reg_pw = /^.*(?=.{6,15})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; //비밀번호 정규표현식(영숫자 조합 6~15)
   var reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //이메일 정규표현식
   var reg_hp = /^((010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/; //휴대폰번호 정규표현식(010일때4자리 나머지3,4자리)
   
    $('#pw').keyup(function(){
         if(reg_pw.test($("#pw").val())){
            $("#pw-error").html("<div style='color:blue'>비밀번호 통과</div>");
       } else if(!reg_pw.test($('#pas').val())){
          $("#pw-error").html("<div style='color:red'>비밀번호 형식을 맞춰주세요</div>");
       }  
    });   
    
   
    $('#pw2').keyup(function(){
          if($("#pw").val()==$("#pw2").val()){ 
                $("#pw2-error").html("<div style='color:blue'>비밀번호 확인 통과</div>");
          }else{
            $("#pw2-error").html("<div style='color:red'>비밀번호가 일치하지 않습니다</div>");
         }
    });


   $('#userHp').focusout(function() {
      if (reg_hp.test($('#userHp').val())) {
         $("#hp-error").html("<div style='color:blue'>핸드폰번호 통과</div>");
      } else if (!reg_hp.test($('#userHp').val())) {
         $("#hp-error").html("<div style='color:red'>핸드폰번호 형식을 맞춰주세요</div>");
      }
   });



   $('#userEmail').keyup(function(){
        if(reg_email.test($('#userEmail').val())){
          $("#email-error").html("<div style='color:blue'>이메일 통과</div>");
        }else if(!reg_email.test($('#userEmail').val())){
           $("#email-error").html("<div style='color:red'>이메일을 올바르게 입력해주세요</div>");
        } 
      });
   

   
    // 회원가입 버튼 클릭 이벤트
    $('#subscribeBtn').click(function() {
      
       if($('#pw').val() == "") {
         alert("비밀번호를 입력해주세요.");
         $('#pw').focus();
         return false;
      }
       
       if($('#pw2').val(webl) == "") {
         alert("비밀번호 확인을 입력해주세요.");
         $('#pw2').focus();
         return false;
      }
       
       
       if($('#userName').val() == "") {
         alert("이름을 입력해주세요.");
         $('#userName').focus();
         return false;
      }
       
       if($('#userHp').val() == "") {
         alert("핸드폰번호를 입력해주세요.");
         $('#userHp').focus();
         return false;
      }
       
       if($('#userEmail').val() == "") {
         alert("이메일 주소를 입력해주세요.");
         $('#userEmail').focus();
         return false;
      }
       
   });
    
});
    


/**
 * @JavaScript : join
 * @author Areum
 * @Desc 아이디 중복체크
 */
function idCheck(){
   
   var userId = $('#userId').val();
  
   if($("#userId").val() == ''){alert('아이디를 입력해주세요.'); return;}
  
   $.ajax({
      type : 'GET',  
      url : 'idCheck',  
      data: {
         userId : userId
      },
      dataType : 'json',
      success : function(data) {
         
         if(data.result == "ok"){
            $("#idchk-error").html("<div style='color:blue'>사용가능한 아이디입니다.</div>");
            return;
         }else{
            $("#idchk-error").html("<div style='color:red'>이미 사용중인 아이디입니다.</div>");
            return;
         }
      },
      
      error : function(xhr, status, e) {  
         alert(e);
      }
   });  
}





/**
 * @JavaScript : join
 * @author Areum
 * @Desc 다음 api 를 통해 주소 입력
 */
function sample6_execDaumPostcode() {
   new daum.Postcode({
      oncomplete : function(data) {
         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var fullAddr = ''; // 최종 주소 변수
         var extraAddr = ''; // 조합형 주소 변수

         // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            fullAddr = data.roadAddress;

         } else { // 사용자가 지번 주소를 선택했을 경우(J)
            fullAddr = data.jibunAddress;
         }

         // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
         if (data.userSelectedType === 'R') {
            //법정동명이 있을 경우 추가한다.
            if (data.bname !== '') {
               extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if (data.buildingName !== '') {
               extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
                     : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
         }

         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
         document.getElementById('sample6_address').value = fullAddr;

         // 커서를 상세주소 필드로 이동한다.
         document.getElementById('sample6_address2').focus();
      }
   }).open();
}