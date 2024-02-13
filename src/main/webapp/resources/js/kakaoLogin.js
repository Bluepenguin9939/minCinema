/**
 * kakaoLogin.js
 */
Kakao.init('72920c9b81f6dd3a33e2eeeb31991388');
Kakao.isInitialized();
 
 function kakaoLogin() {
	 Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
          	var phone = response.kakao_account.phone_number.split(" ");
          	var memail = response.kakao_account.email;
          	var mname = response.kakao_account.name;
          	var mtel = "0"+phone[1];
          	var mnick = response.kakao_account.profile.nickname;
 			$("#checkInfo").find("input[name=memail]").val(memail);
 			$("#checkInfo").find("input[name=mname]").val(mname);
 			$("#checkInfo").find("input[name=mtel]").val(mtel);
 			$("#checkInfo").find("input[name=mnick]").val(mnick);
 			$("#checkInfo").submit();
          },
          fail: function (error) {
          },
        })
      },
      fail: function (error) {
      },
    })
 }