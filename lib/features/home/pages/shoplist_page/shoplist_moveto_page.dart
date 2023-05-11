import 'package:flutter/material.dart';

class ShopListMoveToPage extends StatelessWidget {
  const ShopListMoveToPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        title: const Text('Przenieś do'),
      ),
    );
  }
}
