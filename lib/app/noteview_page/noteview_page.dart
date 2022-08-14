import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/noteedit_page/noteedit_page.dart';

class NoteView extends StatefulWidget {
  NoteView(
    this.title,
    this.content, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String content;
  final controller = TextEditingController();

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  var currentIndex = 0;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 108, 3, 247),
        actions: [
          Visibility(
            visible: visible,
            child: TextButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('przepisy')
                    .doc()
                    .update({'content': widget.controller.text});
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
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('przepisy').snapshots(),
          builder: (context, snapshot) {
            final documents = snapshot.data?.docs;

            return Builder(builder: (context) {
              if (currentIndex == 1) {
                return NoteEdit(widget.content);
              }
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(widget.content),
                  ),
                ],
              );
            });
          }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
              if (currentIndex == 0) visible = false;
              if (currentIndex == 1) visible = true;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Opis'),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edycja')
          ]),
    );
  }
}
