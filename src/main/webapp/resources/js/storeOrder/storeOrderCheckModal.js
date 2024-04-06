$(function(){
    // 주문 상세 정보 모달 관련 코드
    const detailOrderButtons = document.querySelectorAll('.check');
    const storeOrderModal = document.querySelector('.storeOrderModal');
    const storeOrderCloseButton = document.querySelector('.modalSubmitBtn');

    detailOrderButtons.forEach(button => {
        button.addEventListener('click', () => {
            storeOrderModal.style.display = 'block'; // 모달 표시
        });
    });

    storeOrderCloseButton.addEventListener('click', () => {
        storeOrderModal.style.display = 'none'; // 모달 숨김
    });

    window.addEventListener('click', (event) => {
        if (event.target === storeOrderModal) {
            storeOrderModal.style.display = 'none';
        }
    });
});

