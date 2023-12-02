import 'dart:async';
import 'dart:math';

class MessageStream {
  final _controller = StreamController<String>();
  final _random = Random();

  Stream<String> get messageStream => _controller.stream;

  void startMessages() {
    const messages = [
      "Spider-Man: \nUn gran poder conlleva una gran responsabilidad.",
      "Batman: \nSoy Batman.",
      "Superman: \n¡Es un pájaro! ¡Es un avión! ¡No, es Superman!",
      "Wonder Woman: \nLuchar por la paz es la guerra más épica que cualquier guerrero puede librar.",
      "Iron Man (Tony Stark): \nSoy Iron Man."
    ];

    Timer.periodic(const Duration(seconds: 3), (timer) {
      final randomMessage = messages[_random.nextInt(messages.length)];
      _controller.sink.add(randomMessage);
    });
  }

  void dispose() {
    _controller.close();
  }
}
