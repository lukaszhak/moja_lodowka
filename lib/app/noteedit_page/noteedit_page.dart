import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteEdit extends StatelessWidget {
  NoteEdit(
    this.title,
    this.content, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String content;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('przepisy').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final documents = snapshot.data!.docs;

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 250, 252, 250),
            body: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
