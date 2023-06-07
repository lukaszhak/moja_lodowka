import 'package:flutter/material.dart';

class ExpensesCategoryPage extends StatelessWidget {
  const ExpensesCategoryPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        title: Text(title),
        actions: [
          Center(
            child: Row(
              children: const [
                Text(
                  'SUMA:',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Text(
                    '2500 zł',
                    style: TextStyle(fontSize: 17),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
