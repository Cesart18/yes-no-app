import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helper/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer();
  final scrollController = ScrollController();
  final List<Message> messages = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Hola Mundo', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    if (text.isEmpty) return;
    messages.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
