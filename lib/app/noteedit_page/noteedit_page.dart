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
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('przepisy').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final documents = snapshot.data!.docs;

          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(title),
              ),
              backgroundColor: const Color.fromARGB(255, 108, 3, 247),
              actions: [
                TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('przepisy')
                        .doc()
                        .update({'content': controller.text});
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.resolveWith((states) =>
                          const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white)),
                  child: const Text('Zapisz'),
                ),
              ],
            ),
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