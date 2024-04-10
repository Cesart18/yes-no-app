import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/veiws/chat_veiw.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding:  EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://images.ecestaticos.com/krUnZU_tvCc1G_aBFBYHLjoG3eA=/52x0:2240x1641/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F683%2F683%2F977%2F683683977e4177c3e8a76d95ed9298d2.jpg'),
          ),
        ),
        title: const Text('Mi amor♥️'),
        centerTitle: false,
      ),
      body: const ChatVeiw()
    );
  }
}