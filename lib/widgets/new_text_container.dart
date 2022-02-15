import 'package:flutter/material.dart';

class NewTextContainer extends StatelessWidget {
  const NewTextContainer({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(4.0),
      child: Text(
        'NEW',
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
