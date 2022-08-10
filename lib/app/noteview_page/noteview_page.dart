import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/noteedit_page/noteedit_page.dart';
import 'package:moja_lodowka/main.dart';


class NoteView extends StatelessWidget {
  NoteView(
    this.title,
    this.content, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String content;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 108, 3, 247),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => NoteEdit(title, content)));
        },
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black),),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(content),
            ],
          ),
        ),
      ),
    );
  }
}