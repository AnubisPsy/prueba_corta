import 'package:flutter/material.dart';
import 'widgets/message_stream.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Message Stream',
      home: MessageScreen(),
    );
  }
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _messageStream = MessageStream();

  @override
  void initState() {
    super.initState();
    _messageStream.startMessages();
  }

  @override
  void dispose() {
    _messageStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message Stream"),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: _messageStream.messageStream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      snapshot.data!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
