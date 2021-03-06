var stompClient = null;
//var color = '';

function setConnected(isConnected) {
	console.log(isConnected);
    document.getElementById('connect').disabled = isConnected;
    document.getElementById('disconnect').disabled = !isConnected;
    document.getElementById('conversationDiv').style.visibility = isConnected ? 'visible' : 'hidden';
    document.getElementById('from').setAttribute('type', isConnected ? 'hidden' : 'text');
    document.getElementById('color').style.visibility = !isConnected ? 'visible' : 'hidden';
    document.getElementById('response').innerHTML = '';
}
$(document).ready(
function connect() {

//    var socket = new SockJS('/webchat/chat');
    var socket = new SockJS('/icook/forum/overview/chat');
    stompClient = Stomp.over(socket);
    var colorEl = document.getElementById("color");
//    color = colorEl.options[colorEl.selectedIndex].value;

    stompClient.connect({}, function(frame) {

//        setConnected(true);
        console.log('Connected: ' + frame);

        serviceMessage('joined');

        stompClient.subscribe('/forum/overview/topic/messages', function(messageOutput) {
            showMessageOutput(JSON.parse(messageOutput.body));
        });
    });
}
)
//function disconnect() {
//
//    if(stompClient != null) {
//        serviceMessage('leave');
//
//        stompClient.disconnect();
//    }
//
//    setConnected(false);
//    console.log("Disconnected");
//
//
//}

function sendMessage() {
	var from = document.getElementById('from').value;
    var text = document.getElementById('text').value;
    stompClient.send("/forum/overview/app/chat", {}, JSON.stringify({'from': from, 'text': text}));
    $("#text").val("");
}

function serviceMessage(hint) {
    var from = document.getElementById('from').value;
    from = (from.length > 0 && from != null) ? from : 'anonimus';
    stompClient.send("/forum/overview/app/chat", {}, JSON.stringify({
        'from': "service msg",
        'text': from + '|' + hint
//        'color': color
    }));
}

function showMessageOutput(messageOutput) {
    var response = document.getElementById('response');
    var p = document.createElement('p');
    p.style.wordWrap = 'break-word';
    if(messageOutput.from == document.getElementById('from').value){
    	p.style.textAlign="right";
    } else {
    	p.style.textAlign="left";
    }
    
    //製造回應元素
    

    if (messageOutput.from !== 'service msg') {
        p.appendChild(document.createTextNode(messageOutput.from + ": " + messageOutput.text + " (" + messageOutput.time + ")"));
//        username.appendChild(document.createTextNode(messageOutput.from));
//        time.appendChild(document.createTextNode(messageOutput.time));
//        divTB.appendChild(document.createTextNode(messageOutput.text));

    } else {

        var props = messageOutput.text.split('|');
        var name = props[0];
        var msg = props[1];
        var textMsg = '';

        switch (msg) {
            case 'leave':
                textMsg = name + " " + " leave the chat";
                p.appendChild(document.createTextNode(messageOutput.from + ": " + textMsg + " (" + messageOutput.time + ")"));
                break;
            case 'joined':
                textMsg = name + " " + " joined the chat";
                p.appendChild(document.createTextNode(messageOutput.from + ": " + textMsg + " (" + messageOutput.time + ")"));
                break;
        }
    }
    //塞入回應元素
    response.appendChild(p);
    
    
    if (messageOutput.users.length > 0) {
        var $ul = $('#user-list');
        $ul.empty();

        $.each(messageOutput.users, function (index, value) {
            $ul.append('<li>' + value.id + '</li>');
        });
    }
}