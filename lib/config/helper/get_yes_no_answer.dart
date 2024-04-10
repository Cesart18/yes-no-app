import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrasctructure/modell/her_reply.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final herReply = HerReply.fromJson(response.data);

    return Message(
        text: herReply.answer, fromWho: FromWho.she, imageUrl: herReply.image);
  }
}
