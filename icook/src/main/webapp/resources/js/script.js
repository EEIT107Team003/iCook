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
    var divTT= document.createElement('div');
    
    divTT.class= 'toast';
    divTT.id= 'divTT';
    divTT.style.textAlign= 'left';
    divTT.style.width= '250px';
    divTT.style.height= '85px';
    divTT.style.backgroundColor= '#02df82';
    divTT.style.margin= 'auto';

    var divTH = document.createElement('div');
    divTH.class= "toast-header";
    divTH.id= "divTH";
    
    var divImg = document.createElement('img');
    divImg.src= '...';
    divImg.class= 'rounded mr-2';
    divImg.alt= '...';

    var username = document.createElement('strong');
    username.style.margin= 'auto';
    username.text= 'username';

    var time = document.createElement('small');
    time.id= 'time'
    time.style.float = "right";
    

    var divTB = document.createElement('div');
    divTB.class= 'toast-body';
    divTB.text = 'message';
    divTB.id= 'divTB';
    
    var blank = document.createElement('br');

    if (messageOutput.from !== 'service msg') {
//        p.appendChild(document.createTextNode(messageOutput.from + ": " + messageOutput.text + " (" + messageOutput.time + ")"));
        username.appendChild(document.createTextNode(messageOutput.from));
        time.appendChild(document.createTextNode(messageOutput.time));
        divTB.appendChild(document.createTextNode(messageOutput.text));

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
//   $("#response").append(("<div class='toast' role='alert' aria-live='assertive' aria-atomic='true' data-autohide='false'><div class='toast-header'><img src='...' class='rounded mr-2' alt='...'><strong class='mr-auto'>Bootstrap</strong><small class='text-muted'>justnow</small></div><div class='toast-body'>See? Just like this.</div>"))
//    $("#response").append(("<div class='toast' role='alert' aria-live='assertive' aria-atomic='true' data-autohide='false'><div class='toast-header'><img src='...' class='rounded mr-2' alt='...'><strong class='mr-auto'>" + messageOutput.from +"</strong><small class='text-muted'>" + messageOutput.time + "</small></div><div class='toast-body'>" + messageOutput.text + "</div>"))
    response.appendChild(divTT);
    $("#divTT").attr('aria-live','assertive');
    $("#divTT").attr('aria-atomic','true');
    $("#divTT").attr('data-autohide','false');
    divTT.appendChild(divTH);
    divTH.appendChild(divImg);
    divTH.appendChild(username);
    $("#username").attr('class','mr-auto');
    divTH.appendChild(time);
    divTT.appendChild(divTB);
    response.appendChild(blank);
    
    
    if (messageOutput.users.length > 0) {
        var $ul = $('#user-list');
        $ul.empty();

        $.each(messageOutput.users, function (index, value) {
            $ul.append('<li>' + value.id + '</li>');
        });
    }
}