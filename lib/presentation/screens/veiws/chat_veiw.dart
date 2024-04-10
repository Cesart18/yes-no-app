import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/provider/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/messages/her_messages_bubble.dart';
import 'package:yes_no_app/presentation/widgets/messages/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/form_field.dart';

class ChatVeiw extends StatelessWidget {
  const ChatVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    final chatProviderRead = context.read<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = chatProvider.messages[index];
                  return (message.fromWho == FromWho.she)
                      ? HerMessageBubble(
                          message: message,
                        )
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            InputMessage(
              onvalue: (value) => chatProviderRead.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
