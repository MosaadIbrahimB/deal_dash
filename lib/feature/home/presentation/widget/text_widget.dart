import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;

  const TextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
