import 'package:flutter/material.dart';

class ItemIcon extends StatelessWidget {
  const ItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 100,
        ),
        Text(
          'Hello World',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}

