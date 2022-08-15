import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteEdit extends StatefulWidget {
  const NoteEdit(
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
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('przepisy').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final documents = snapshot.data?.docs;

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 250, 252, 250),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                      controller: TextEditingController(text: widget.content)),
                ),
              ],
            ),
          );
        });
  }
}
