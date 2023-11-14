import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rescue/constants/app_colors.dart';
import 'package:rescue/screens/llm/palm_service.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _textController = TextEditingController();
  bool isLoading = false;
  final List<ChatMessage> _messages = [];
  String output = '';

  void _handleSubmitted(String text) {
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    if (kDebugMode) {
      print('stsrted');
    }

    _handleBotResponse();
  }

  void _handleBotResponse() async {
    setState(() {
      isLoading = true;
    });
    print({'text': _textController.text});
    output = await makeApiRequest(_textController.text);
    print(output);

    ChatMessage message = ChatMessage(
      text: output,
      isUserMessage: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _textController.clear();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBot'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 5.0,
                    ),
                    child: LinearProgressIndicator(),
                  )
                : _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isUserMessage
              ? Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: const CircleAvatar(
                    child: Icon(Icons.rocket),
                  ),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isUserMessage ? 'You' : 'ChatBot',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color:
                        isUserMessage ? AppColor.isabelline : AppColor.teaGreen,
                  ),
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
