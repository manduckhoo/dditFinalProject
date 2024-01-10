<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
// var socket = null;
//  var ws = new WebSocket("ws://localhost/mem/main");
//  socket = ws;
 
 // websocket connection후 메시지보내기
//  ws.onopen = function() {
// 	 console.log("connection!!!!");
// 	 setTimeout(function() {
// 		 connect();
// 	 }, 2000);
	 
// 	 ws.onmessage = function(event) {
// 		 console.log(event.data + '\n');
// 	 };
//  };
 
 
 
//  ws.onclose = function() {
// 	console.log("connection closed!!!!!!"); 
//  };
 
//  ws.onerror = function() {
// 	 console.log("connection error!!!!!!"); 
//  };
 
//  $("btnSave").on("click", function(event) {
// 	event.preventDefault();
// 	if(socket.readyState != 1) return;
// 	let msg = $("input#msg").val();
// 	ws.send(msg);
//  });
</script>

<!-- websocket -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">

// var socket = null;
// $(document).ready(function() {
//    connectWs();
   
//    $('#btnSend').on("click", function(event) {
//       event.preventDefault();
//       if(socket.readyState != 1) return;
//       let msg = $('input#msg').val();
//       socket.send(msg);
//    });
// });

// function connectWs() {
//    console.log("소켓 연결");
   
//    var ws = new SockJS("http://localhost/echoHandler?faqNo=1");
//    socket = ws;
   
//    ws.open = function() {
//       console.log('Info: connection opened!!!');
//    };
   
//    ws.onmessage = function(event) {
//       console.log("onmessage" + event.data);
//       let $socketAlert = $('#socketAlert')
       
//       $socketAlert.html(event.data)
//       $socketAlert.css('display', 'block');
      
//       setTimeout(function() {
//          $socketAlert.css('display', 'none');
//       }, 5000);
//    };
//    ws.onclose = function(event) {
//       console.log('Info: connection closed!!!');
//    }
//    ws.onerror = function(err) {
//       console.log('Info: connection error!!!', err);
//    }
   
// }
</script>
    