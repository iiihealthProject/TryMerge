<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>客服系統</title>
</head>
<style>
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

html, body {
    height: 100%;
    overflow: hidden;
}

body {
    margin: 0;
    padding: 0;
    font-weight: 400;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-size: 1rem;
    line-height: 1.58;
    color: #333;
    background-color: #f4f4f4;
    height: 100%;
}

body:before {
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    background:url("./DrugProductImg/客服.jpg");;
    content: "";
    z-index: 0;
      background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
}

.clearfix:after {
    display: block;
    content: "";
    clear: both;
}

.hidden {
    display: none;
}

.form-control {
    width: 100%;
    min-height: 38px;
    font-size: 15px;
    border: 1px solid #c8c8c8;
}

.form-group {
    margin-bottom: 15px;
}

input {
    padding-left: 10px;
    outline: none;
}

h1, h2, h3, h4, h5, h6 {
    margin-top: 20px;
    margin-bottom: 20px;
}

h1 {
    font-size: 1.7em;
}

a {
    color: #128ff2;
}

button {
    box-shadow: none;
    border: 1px solid transparent;
    font-size: 14px;
    outline: none;
    line-height: 100%;
    white-space: nowrap;
    vertical-align: middle;
    padding: 0.6rem 1rem;
    border-radius: 2px;
    transition: all 0.2s ease-in-out;
    cursor: pointer;
    min-height: 38px;
}

button.default {
    background-color: #e8e8e8;
    color: #333;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.12);
}

button.primary {
    background-color: #128ff2;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.12);
    color: #fff;
}

button.accent {
    background-color: #ff4743;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.12);
    color: #fff;
}

#username-page {
    text-align: center;
}

.username-page-container {
    background: #fff;
    box-shadow: 0 1px 11px rgba(0, 0, 0, 0.27);
    border-radius: 2px;
    width: 100%;
    max-width: 500px;
    display: inline-block;
    margin-top: 42px;
    vertical-align: middle;
    position: relative;
    padding: 35px 55px 35px;
    min-height: 250px;
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    margin: 0 auto;
    margin-top: -160px;
}

.username-page-container .username-submit {
    margin-top: 10px;
}

#chat-page {
    position: relative;
    height: 100%;
}

.chat-container {
    max-width: 700px;
    margin-left: auto;
    margin-right: auto;
    background-color: #fff;
    box-shadow: 0 1px 11px rgba(0, 0, 0, 0.27);
    margin-top: 30px;
    height: calc(100% - 60px);
    max-height: 700px;
    position: relative;
}

#chat-page ul {
    list-style-type: none;
    background-color: #FFF;
    margin: 0;
    overflow: auto;
    overflow-y: scroll;
    padding: 0 20px 0px 20px;
    height: calc(100% - 150px);
}

#chat-page #messageForm {
    padding: 20px;
}

#chat-page ul li {
    line-height: 1.5rem;
    padding: 10px 20px;
    margin: 0;
    border-bottom: 1px solid #f4f4f4;
}

#chat-page ul li p {
    margin: 0;
}

#chat-page .event-message {
    width: 100%;
    text-align: center;
    clear: both;
}

#chat-page .event-message p {
    color: #777;
    font-size: 14px;
    word-wrap: break-word;
}

#chat-page .chat-message {
    padding-left: 68px;
    position: relative;
}

#chat-page .chat-message i {
    position: absolute;
    width: 42px;
    height: 42px;
    overflow: hidden;
    left: 10px;
    display: inline-block;
    vertical-align: middle;
    font-size: 18px;
    line-height: 42px;
    color: #fff;
    text-align: center;
    border-radius: 50%;
    font-style: normal;
    text-transform: uppercase;
}

#chat-page .chat-message span {
    color: #333;
    font-weight: 600;
}

#chat-page .chat-message p {
    color: #43464b;
}

#messageForm .input-group input {
    float: left;
    width: calc(100% - 85px);
    margin-top: -5px;
}

#messageForm .input-group button {
    float: left;
    width: 80px;
    height: 38px;
    margin-left: 5px;
    margin-top: -5px;
}

.chat-header {
    text-align: center;
    padding: 15px;
    border-bottom: 1px solid #ececec;
}

.chat-header h2 {
    margin: 0;
    font-weight: 500;
}

.connecting {
    padding-top: 5px;
    text-align: center;
    color: #777;
    position: absolute;
    top: 65px;
    width: 100%;
}

@media screen and (max-width: 730px) {
    .chat-container {
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 10px;
    }
}

@media screen and (max-width: 480px) {
    .chat-container {
        height: calc(100% - 30px);
    }
    .username-page-container {
        width: auto;
        margin-left: 15px;
        margin-right: 15px;
        padding: 25px;
    }
    #chat-page ul {
        height: calc(100% - 120px);
    }
    #messageForm .input-group button {
        width: 65px;
    }
    #messageForm .input-group input {
        width: calc(100% - 70px);
    }
    .chat-header {
        padding: 10px;
    }
    .connecting {
        top: 60px;
    }
    .chat-header h2 {
        font-size: 1.1em;
    }
}

/* Popup container */
.popup {
  position: relative;
}
/* The actual popup (appears on top) */
.popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #ff8080;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 10%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #ff8080 transparent transparent transparent;
}

/* Toggle this class when clicking on the popup container (hide and show the popup) */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 0.5s;
    animation: fadeIn 0.5s
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}
</style>
<body>
    <noscript>
        <h2>Sorry! Your browser doesn't support Javascript</h2>
    </noscript>
    <!-- 進入頁面 -->
    <div id="username-page">
        <div class="username-page-container">
            <h1 class="title">請輸入您的名子</h1>
            
            <form id="usernameForm" name="usernameForm">
                <div class="form-group popup">
                    <input type="text" id="name" placeholder="請輸入您的大名"
                        autocomplete="off" class="form-control popup" />
                    <span class="popuptext" id="hint">請輸入您的名子</span>
                 
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">連接至客服聊天室</button>
                       <br><br>       <input type="button" value="林家瑋" id="input5"/>
                </div>
            </form>
        </div>
    </div>

    <!-- 聊天室頁面 -->
    <div id="chat-page" class="hidden">
        <div class="chat-container">
            <div class="chat-header">
                <h2>線上客服服務</h2><a  class="nav-link" href="/">返回首頁</a>
                <input type="button" value="您好" id="input"/>
                <input type="button" value="請問輔具要在哪裡訂購" id="input1"/>
                <input type="button" value="留言區要如何使用" id="input2"/>
                <input type="button" value="會員密碼忘記怎麼辦" id="input3"/>
                 <input type="button" value="感謝您的幫助" id="input4"/>
            </div>
            <div class="connecting">Connecting...</div>
            <ul id="messageArea">
            </ul>
            <form id="messageForm" name="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="輸入訊息..."
                            autocomplete="off" class="form-control" />
                        <button type="submit" class="primary">送出</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script src = "/js/jquery-3.6.0.js"></script>
   <script> 
    $("#input").click(function(){
    $("#message").val("您好");
    })
    $("#input1").click(function(){
    $("#message").val("請問輔具要在哪裡訂購");
    })
     $("#input2").click(function(){
    $("#message").val("留言區要如何使用");
    })
     $("#input3").click(function(){
    $("#message").val("會員密碼忘記怎麼辦");
    })
     $("#input4").click(function(){
    $("#message").val("感謝您的幫助");
    })
    $("#input5").click(function(){
    $("#name").val("林家瑋");
    })
    
    </script>
    <script> 'use strict';
   
    var usernamePage = document.querySelector('#username-page');
    var chatPage = document.querySelector('#chat-page');
    var usernameForm = document.querySelector('#usernameForm');
    var messageForm = document.querySelector('#messageForm');
    var messageInput = document.querySelector('#message');
    var messageArea = document.querySelector('#messageArea');
    var connectingElement = document.querySelector('.connecting');
    var nameInput = document.querySelector('#name');
    var popup = document.querySelector('#hint');

    var stompClient = null;
    var username = null;

    /**
     * 頭像的顏色
     */
    var colors = [ '#2196F3', '#32c787', '#00bcd4','#4dbb00', '#ff5652', '#ffc107',
            '#ff85af', '#ff9800', '#39bbb0', '#b0c503' ];

    /**
     * 連線
     * @param event
     * @returns
     */
    function connect(event) {
        username = document.querySelector('#name').value.trim();

        if (username) {
            usernamePage.classList.add('hidden');
            chatPage.classList.remove('hidden');

            var socket = new SockJS('/chatroom');
            stompClient = Stomp.over(socket);

            stompClient.connect({}, onConnected, onError);
        } else {
            popHint();
        }
        event.preventDefault();
    }

    /**
     * 連線建立後要處理的邏輯
     * @returns
     */
    function onConnected() {
        // 訂閱/topic/public
        stompClient.subscribe('/topic/public', onMessageReceived); // 當後端送訊息至/topic/public時，會執行onMessageReceived()。

        // 發送訊息至/app/join，也就是送到ChatController.addUser()
        stompClient.send("/app/join", {}, JSON.stringify({
            sender : username,
            type : 'JOIN'
        }))

        connectingElement.classList.add('hidden');
    }

    function onError(error) {
        connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
        connectingElement.style.color = 'red';
    }

    /**
     * 彈出提示
     * @returns
     */
    function popHint() {
        popup.classList.toggle("show");
    }

    /**
     * 發送訊息
     * @param event 發送訊息事件
     * @returns
     */
    function sendMessage(event) {
        var messageContent = messageInput.value.trim();
        if (messageContent && stompClient) {
            var chatMessage = {
                sender : username,
                content : messageInput.value,
                type : 'CHAT'
            };
            // 發送訊息至/app/chat，也就是送到ChatController.sendMessage()
            stompClient.send("/app/chat", {}, JSON.stringify(chatMessage));
            messageInput.value = '';
        }
        event.preventDefault();
    }

    /**
     * 從後端接受訊息後要進行的處理
     * @param payload 後端送來的訊息
     * @returns
     */
    function onMessageReceived(payload) {
        var message = JSON.parse(payload.body);

        var messageElement = document.createElement('li');

        if (message.type === 'JOIN') {
            messageElement.classList.add('event-message');
            message.content = message.sender + ' 加入聊天室';
        } else if (message.type === 'LEAVE') {
            messageElement.classList.add('event-message');
            message.content = message.sender + ' 離開聊天室';
        } else {
            messageElement.classList.add('chat-message');

            var avatarElement = getAvatarElement(message.sender);
            messageElement.appendChild(avatarElement);

            var usernameElement = getUsernameElement(message.sender);
            messageElement.appendChild(usernameElement);
        }

        var textElement = document.createElement('p');
        var messageText = document.createTextNode(message.content);
        textElement.appendChild(messageText);

        messageElement.appendChild(textElement);

        messageArea.appendChild(messageElement);
        messageArea.scrollTop = messageArea.scrollHeight;
    }

    /**
     * 取得頭像元素
     * @param sender 訊息發送者名稱
     * @returns
     */
    function getAvatarElement(sender) {
        var avatarElement = document.createElement('i');
        var avatarText = document.createTextNode(sender[0]);
        avatarElement.appendChild(avatarText);
        avatarElement.style['background-color'] = getAvatarColor(sender);
        return avatarElement;
    }

    /**
     * 取得頭像顏色
     * @param sender 訊息發送者名稱
     * @returns
     */
    function getAvatarColor(sender) {
        var hash = 0;
        for (var i = 0; i < sender.length; i++) {
            hash = 31 * hash + sender.charCodeAt(i);
        }
        var index = Math.abs(hash % colors.length);
        return colors[index];
    }

    /**
     * 取得使用者名稱的元素
     * @param sender 使用者名稱
     * @returns
     */
    function getUsernameElement(sender) {
        var usernameElement = document.createElement('span');
        var usernameText = document.createTextNode(sender);
        usernameElement.appendChild(usernameText);
        return usernameElement;
    }

    /**
     * 移除彈出的提示
     * @param event
     * @returns
     */
    function removePopup (event) {
        popup.classList.remove("show");
    }

    nameInput.addEventListener('focus', removePopup, true)
    usernameForm.addEventListener('submit', connect, true)
    messageForm.addEventListener('submit', sendMessage, true)</script>
    
    
  
</body>
</html>