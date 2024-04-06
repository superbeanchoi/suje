$(function() {

   /* 이미지 슬라이드 */

   var sliderWidth = $('.itemImage div').outerWidth(); // 이미지 너비
   var sliderLength = $('.itemImage div').length; // 전체 이미지 개수
   var slideArea = sliderWidth * sliderLength; // 슬라이드 영역 너비
   $('.itemImage').css('width', slideArea);  // 슬라이드 영역 지정

   // 버튼 클릭시 슬라이드 이벤트 실행
   $('.back').click(function() {
      slideLeft();
   });
   $('.next').click(function() {
      slideRight();
   });
   
   // 슬라이드 이벤트 함수
   function slideLeft() {
      // 마지막 슬라이드를 복제하여 첫번째에 추가
      var lastSlide = $('.itemImage div:last');
      var clonedSlide = lastSlide.clone();
      clonedSlide.prependTo('.itemImage');

      // 슬라이드 영역을 오른쪽으로 이동시키고 애니메이션 적용
      $('.itemImage').css({ marginLeft: -sliderWidth });
      $('.itemImage').animate({ marginLeft: 0 }, 500, function() {
         // 애니메이션이 완료된 후에 마지막 슬라이드를 삭제
         $('.itemImage div:last').remove();
      });
   }
   function slideRight() {
      // 첫 번째 슬라이드를 복제하여 마지막에 추가
      var firstSlide = $('.itemImage div:first');
      var clonedSlide = firstSlide.clone();
      clonedSlide.appendTo('.itemImage');

      // 슬라이드 영역을 왼쪽으로 이동시키고 애니메이션 적용
      $('.itemImage').animate({ marginLeft: -sliderWidth }, 500, function() {
         // 애니메이션이 완료된 후에 첫 번째 슬라이드를 삭제
         $('.itemImage div:first').remove();
         $(this).css({ marginLeft: 0 });
      });
   }
});