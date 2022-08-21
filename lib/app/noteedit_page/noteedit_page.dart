import 'package:flutter/material.dart';

class NoteEdit extends StatefulWidget {
  NoteEdit(
    this.content, {
    Key? key,
  }) : super(key: key);
  final String content;
  @override
  State<NoteEdit> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: TextEditingController(text: widget.content)),
          ),
        ],
      ),
    );
  }
}
