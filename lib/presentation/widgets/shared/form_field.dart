import 'package:flutter/material.dart';


class InputMessage extends StatelessWidget {
  final ValueChanged<String> onvalue;
  const InputMessage({super.key, required this.onvalue});

  @override
  Widget build(BuildContext context) {

    
    final focusnode = FocusNode();
    final textController = TextEditingController();
    final decoration = InputDecoration(
      hintText: 'End your message with "?" ',
        suffixIcon: IconButton(onPressed: () {
          final textvalue = textController.value.text;
          onvalue(textvalue);
          textController.clear();
          focusnode.requestFocus();
        }, icon: const Icon(Icons.send)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ));
    return TextFormField(
      onTapOutside: (event) {
        focusnode.unfocus();
      },
      focusNode: focusnode,
      controller: textController,
      decoration: decoration,
    onFieldSubmitted: (value) {
      onvalue(value);
      textController.clear();
      focusnode.requestFocus();
    },);
  }
}
