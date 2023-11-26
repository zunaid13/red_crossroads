import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:my_project/model/messages_model.dart';
import 'package:my_project/model/user_model.dart';
import 'package:my_project/services/api.dart';
import 'package:my_project/services/messageService.dart';
import 'package:my_project/specificProfile.dart';

class ChatScreen extends StatefulWidget {
  final DetailArguments arguments;
  const ChatScreen({Key? key, required this.arguments}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String reciever;
  List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Access widget.user in the initState method

    reciever = widget.arguments.title;
    initializeChat();
  }

  Future<void> initializeChat() async {
    await Api.getAllMessages();
    _messages = await MessageService.obtainChat(reciever);
    setState(() {});
    for (int i = 0; i < _messages.length; i++) {
      print(i);
    }
  }

  void _handleSubmitted(String text) async {
    _textController.clear();
    if (text != '') {
      ChatMessage message = ChatMessage(
        text: text,
        // For demonstration purposes, assuming the message is sent by the user
        // Replace this with actual user information (username, avatar, etc.)
        sender: currentUser.username,
        // Adding timestamp for demonstration
        time: DateTime.now(),
        receiver: reciever,
      );
      setState(() {
        _messages.insert(0, message);
      });
      allMessages.insert(0, MessageService.chatToMessage(_messages[0]));
      await Api.addMessage(allMessages[0]);
      await initializeChat();
    }
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                initializeChat();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (_, int index) => _messages[index],
                ),
              ),
              Divider(height: 1.0),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String sender, receiver;
  final DateTime time;

  const ChatMessage({
    required this.text,
    required this.sender,
    required this.time,
    required this.receiver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: (sender == currentUser.username)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            sender, // Display sender's name
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: (sender == currentUser.username)
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: (sender == currentUser.username)
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: (sender == currentUser.username)
                            ? Colors.pink
                            : Color.fromARGB(255, 42, 40, 40),
                        borderRadius: BorderRadius.only(
                            topLeft: (sender == currentUser.username)
                                ? Radius.circular(20.0)
                                : Radius.circular(0.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                            topRight: (sender == currentUser.username)
                                ? Radius.circular(0.0)
                                : Radius.circular(20.0)),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.white, fontSize: 17.0),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      // Format the time to display just the hour and minute
                      '${time.hour}:${time.minute}',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5.0),
            ],
          ),
        ],
      ),
    );
  }
}
