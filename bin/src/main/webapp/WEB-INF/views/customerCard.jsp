<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customerCard.css" />


</head>
<body>

	<!-- 좌측 남색 SUJE 로고 부분 -->
	<svg width="125" height="40" viewBox="0 0 125 40" fill="none" xmlns="http://www.w3.org/2000/svg" style="position: absolute; left: 29px; top: 29px;" preserveAspectRatio="none">
				
      <path d="M22.5199 11.7245C22.3669 10.1916 21.71 9.00079 20.5492 8.15202C19.3884 7.30325 17.8131 6.87886 15.8233 6.87886C14.4712 6.87886 13.3296 7.06888 12.3984 7.44893C11.4672 7.81631 10.7529 8.32938 10.2555 8.98812C9.77076 9.64687 9.5284 10.3943 9.5284 11.2304C9.50289 11.9272 9.64958 12.5352 9.96847 13.0546C10.3001 13.574 10.7529 14.0238 11.3269 14.4038C11.9009 14.7712 12.5642 15.0942 13.3168 15.3729C14.0694 15.639 14.873 15.867 15.7276 16.057L19.2481 16.8931C20.9574 17.2732 22.5263 17.7799 23.9549 18.4133C25.3836 19.0467 26.6208 19.8258 27.6668 20.7506C28.7128 21.6754 29.5227 22.7648 30.0967 24.019C30.6835 25.2732 30.9833 26.711 30.996 28.3325C30.9833 30.7142 30.371 32.7791 29.1592 34.5273C27.9602 36.2629 26.2254 37.612 23.9549 38.5748C21.6972 39.5249 18.9739 40 15.785 40C12.6216 40 9.86642 39.5186 7.5194 38.5558C5.18513 37.593 3.36109 36.1679 2.04727 34.2803C0.7462 32.38 0.0637779 30.0301 0 27.2304H8.01687C8.10616 28.5352 8.48245 29.6247 9.14573 30.4988C9.82178 31.3603 10.721 32.0127 11.8435 32.4561C12.9788 32.8868 14.2607 33.1021 15.6893 33.1021C17.0924 33.1021 18.3106 32.8994 19.3438 32.4941C20.3898 32.0887 21.1997 31.5249 21.7737 30.8028C22.3477 30.0808 22.6347 29.251 22.6347 28.3135C22.6347 27.4394 22.3732 26.7047 21.8503 26.1093C21.34 25.5139 20.5875 25.0071 19.5925 24.5891C18.6104 24.171 17.405 23.791 15.9763 23.4489L11.7096 22.3848C8.40591 21.5867 5.7974 20.3389 3.88407 18.6413C1.97073 16.9438 1.02044 14.6572 1.0332 11.7815C1.02044 9.42518 1.65184 7.36659 2.9274 5.6057C4.21571 3.84482 5.98236 2.47031 8.22733 1.48219C10.4723 0.494062 13.0234 0 15.8807 0C18.7889 0 21.3273 0.494062 23.4957 1.48219C25.6769 2.47031 27.3734 3.84482 28.5852 5.6057C29.797 7.36659 30.422 9.40618 30.4603 11.7245H22.5199Z"
		fill="#00203F"></path>
      <path d="M58.0783 0.532067H66.363V25.8052C66.363 28.6429 65.6806 31.1259 64.3158 33.2542C62.9637 35.3824 61.0695 37.042 58.6332 38.2328C56.1968 39.4109 53.3587 40 50.1188 40C46.8661 40 44.0217 39.4109 41.5854 38.2328C39.149 37.042 37.2548 35.3824 35.9028 33.2542C34.5507 31.1259 33.8746 28.6429 33.8746 25.8052V0.532067H42.1594V25.1021C42.1594 26.5843 42.4846 27.9018 43.1352 29.0546C43.7984 30.2074 44.7296 31.1132 45.9286 31.772C47.1276 32.4307 48.5244 32.7601 50.1188 32.7601C51.726 32.7601 53.1228 32.4307 54.309 31.772C55.508 31.1132 56.4328 30.2074 57.0834 29.0546C57.7466 27.9018 58.0783 26.5843 58.0783 25.1021V0.532067Z"
		fill="#00203F"></path>
      <path d="M86.1746 0.532067H94.3637V27.6675C94.3637 30.1758 93.7961 32.3547 92.6608 34.2043C91.5383 36.0538 89.9758 37.479 87.9732 38.4798C85.9705 39.4806 83.6427 39.981 80.9895 39.981C78.6297 39.981 76.4868 39.5693 74.5607 38.7458C72.6474 37.9097 71.1295 36.6429 70.007 34.9454C68.8845 33.2351 68.3296 31.0879 68.3424 28.5036H76.5888C76.6143 29.5297 76.8248 30.4101 77.2202 31.1449C77.6284 31.867 78.1833 32.4244 78.8848 32.8171C79.5991 33.1971 80.441 33.3872 81.4104 33.3872C82.4309 33.3872 83.2919 33.1718 83.9934 32.7411C84.7077 32.2977 85.2499 31.6516 85.6198 30.8028C85.9897 29.9541 86.1746 28.9089 86.1746 27.6675V0.532067Z"
		fill="#00203F"></path>
      <path d="M98.5195 39.4489V0.532067H124.923V7.31591H106.804V16.5891H123.565V23.3729H106.804V32.6651H125V39.4489H98.5195Z"
		fill="#00203F"></path>
	 </svg>
    <!-- 로고 끝 -->
    
    <img src="image-23.png" style="width: 30px; height: 30px; position: absolute; left: 29px; top: 124px; object-fit: cover;" />		
	<img src="image-114-2.png" style="width: 40px; height: 40px; position: absolute; left: 1229.5px; top: 29.5px; object-fit: none;" />

	<div style="width: 1440px; height: 1120px; position: relative; overflow: hidden; background: #fff;">
	<div style="width: 1440px; height: 180px; position: absolute; left: 0px; top: 0px;">
	
	<div style="width: 1440px; height: 100px; position: absolute; left: -1px; top: -1px; background: #fff;"></div>			
	<div style="width: 1440px; height: 70px; position: absolute; left: -1px; top: 104px; background: #fff;"></div>
	<div style="width: 1440px; height: 5px; position: absolute; left: -1px; top: 98.72px;"></div>
	<div style="width: 1440px; height: 5px; position: absolute; left: -1px; top: 99px; background: #adefd1;"></div>
	<div style="width: 1440px; height: 5px; position: absolute; left: -1px; top: 174px; background: #eee;"></div>
    <div style="width: 40px; height: 40px;">
    <div style="width: 40px; height: 40px; position: absolute; left: 1229.5px; top: 29.5px; background: #adefd1;"></div> 
 	<div style="width: 1440px; height: 200px; position: absolute; left: -1px; top: 919px; background: #adefd1;"></div>
 	<div style="width: 1020px; height: 5px; position: absolute; left: 379px; top: 279px; background: #d9d9d9;"></div>		
	<div style="width: 1020px; height: 5px; position: absolute; left: 379px; top: 834px; background: #d9d9d9;"></div>
	<div style="width: 100px; height: 50px; position: absolute; left: 598.5px; top: 653.5px; border-radius: 10px; background: #fff; border-width: 2px; border-color: #adefd1;"></div>
	<div style="width: 300px; height: 50px; position: absolute; left: 598.5px; top: 493.5px; border-radius: 10px; background: #fff; border-width: 2px; border-color: #adefd1;"></div>
	<div style="width: 300px; height: 50px; position: absolute; left: 598.5px; top: 573.5px; border-radius: 10px; background: #fff; border-width: 2px; border-color: #adefd1;"></div>
	<div style="width: 300px; height: 50px; position: absolute; left: 598.5px; top: 413.5px; border-radius: 10px; background: #fff; border-width: 2px; border-color: #adefd1;"></div>
	<div style="width: 300px; height: 50px; position: absolute; left: 398.5px; top: 743.5px; border-radius: 10px; background: #adefd1;"></div>
	<div style="width: 200px; height: 50px; position: absolute; left: 598.5px; top: 333.5px; border-radius: 10px; background: #fff; border-width: 2px; border-color: #adefd1;"></div>
	
	<p style="width: 200px; height: 40px; position: absolute; left: 970px; top: 30px; font-size: 20px; text-align: right; color: #000;">abc123</p>
	<p style="width: 50px; height: 40px; position: absolute; left: 1170px; top: 30px; font-size: 20px; text-align: center; color: #000;">님</p>
	<p style="width: 100px; height: 40px; position: absolute; left: 1310px; top: 30px; font-size: 20px; text-align: center; color: #000;">로그아웃</p>			
	<p style="width: 120px; height: 30px; position: absolute; left: 80px; top: 125px; font-size: 20px; text-align: left; color: #000;">전체 카테고리</p>
	<p style="width: 120px; height: 30px; position: absolute; left: 370px; top: 125px; font-size: 20px; text-align: center; color: #000;">인기 랭킹</p>
	<p style="width: 120px; height: 30px; position: absolute; left: 540px; top: 125px; font-size: 20px; text-align: center; color: #000;">실시간 후기</p>
	<p style="width: 120px; height: 30px; position: absolute; left: 710px; top: 125px; font-size: 20px; text-align: center; color: #000;">커뮤니티</p>
	<p style="width: 120px; height: 30px; position: absolute; left: 880px; top: 125px; font-size: 20px; text-align: center; color: #000;">플리마켓</p>
	<p style="width: 300px; height: 50px; position: absolute; left: 380px; top: 220px; font-size: 30px; font-weight: 700; text-align: left; color: #000;">카드 등록/수정</p>
			
	<p style="width: 200px; height: 50px; position: absolute; left: 400px; top: 335px; font-size: 20px; text-align: left; color: #222;">카드사</p>
	<p style="width: 200px; height: 50px; position: absolute; left: 400px; top: 415px; font-size: 20px; text-align: left; color: #222;">카드 번호</p>
	<p style="width: 200px; height: 50px; position: absolute; left: 400px; top: 575px; font-size: 20px; text-align: left; color: #222;">CVC</p>
	<p style="width: 200px; height: 50px; position: absolute; left: 400px; top: 495px; font-size: 20px; text-align: left; color: #222;">유효기간</p>
	<p style="width: 200px; height: 50px; position: absolute; left: 400px; top: 655px; font-size: 20px; text-align: left; color: #222;">비밀번호</p>
	
	<p style="width: 60px; height: 30px; position: absolute; left: 620px; top: 665px; font-size: 20px; text-align: right; color: #222;">36</p>
	<p style="width: 60px; height: 30px; position: absolute; left: 710px; top: 665px; font-size: 20px; text-align: left; color: #222;">●●</p>
	<p style="width: 260px; height: 30px; position: absolute; left: 620px; top: 505px; font-size: 20px; text-align: left; color: #222;">2026/03</p>
	<p style="width: 260px; height: 30px; position: absolute; left: 620px; top: 585px; font-size: 20px; text-align: left; color: #222;">369</p>
	<p style="width: 260px; height: 30px; position: absolute; left: 620px; top: 425px; font-size: 20px; text-align: left; color: #222;">1234123412341234</p>
	<p style="width: 124px; height: 50px; position: absolute; left: 487px; top: 745px; font-size: 20px; text-align: center; color: #222;">등록/수정하기</p>
	
	</div>
	</div>
		
				
	
		

</body>
</html>