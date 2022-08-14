import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteEditPage extends StatefulWidget {
  NoteEditPage({
    required this.docToEdit,
    Key? key,
  }) : super(key: key);

  final DocumentSnapshot docToEdit;

  @override
  State<NoteEditPage> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEditPage> {
  TextEditingController content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(),
          ],
        ),
      ),
    );
    ;
  }
}
