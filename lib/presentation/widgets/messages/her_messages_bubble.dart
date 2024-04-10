import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(
          image: message.imageUrl!,
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;
  const _ImageBubble({required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        image,
        fit: BoxFit.cover,
        width: size.width * 0.7,
        height: 150,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return SizedBox(
              width: size.width * 0.7,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JumpingDots(
                    color: Colors.black,
                    radius: 6,
                    verticalOffset: 3,
                  ),
                  const Text('Mi amor esta enviando una imagen')
                ],
              ));
        },
      ),
    );
  }
}
