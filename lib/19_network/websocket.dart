import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

void main() async {
  final wsUrl = Uri.parse('wss://fstream.binance.com/ws/bnbusdt@aggTrade');
  final channel = WebSocketChannel.connect(wsUrl);

  await channel.ready;

  channel.stream.listen((message) {
    // channel.sink.add('received!');   // 연결한 곳에 메시지 전송
    print(message);
  });

  // 연결 해제
  // channel.sink.close(status.goingAway);
}
