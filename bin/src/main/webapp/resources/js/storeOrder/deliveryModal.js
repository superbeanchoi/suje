$(function(){

    // 배송 정보 모달 관련 코드
    const deliveryDetailButtons = document.querySelectorAll('.check-delivery');
    const deliveryModal = document.querySelector('.deliveryModal');
    const deliveryCloseButton = document.querySelector('.deliverymodalSubmitBtn');

    deliveryDetailButtons.forEach(button => {
        button.addEventListener('click', () => {
            deliveryModal.style.display = 'block'; // 모달 표시
        });
    });

    deliveryCloseButton.addEventListener('click', () => {
        deliveryModal.style.display = 'none'; // 모달 숨김
    });

    window.addEventListener('click', (event) => {
        if (event.target === deliveryModal) {
            deliveryModal.style.display = 'none';
        }
    });
});