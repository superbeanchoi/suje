
const orderList = document.getElementById('orderList');
const chatMessages = document.getElementById('chatMessages');
const messageInput = document.getElementById('messageInput');
const sendMessageBtn = document.getElementById('sendMessageBtn');

// 채팅 메시지를 보내는 함수
function sendMessage(message) {
    const messageElement = document.createElement('div');
    messageElement.textContent = message;
    chatMessages.appendChild(messageElement);
}

// 주문자를 선택했을 때의 이벤트 처리
orderList.addEventListener('click', (event) => {
    const selectedOrder = event.target.dataset.id;
    if (selectedOrder) {
        // 채팅방을 열고 해당 주문자와의 채팅을 시작할 수 있도록 구현
        // 이 예시에서는 간단히 콘솔에 선택된 주문자의 ID를 표시하도록 함
        console.log('Selected order:', selectedOrder);
    }
});

// 메시지 전송 버튼 클릭 이벤트 처리
sendMessageBtn.addEventListener('click', () => {
    const message = messageInput.value.trim();
    if (message) {
        sendMessage(message);
        messageInput.value = '';
    }
});