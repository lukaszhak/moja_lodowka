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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 108, 3, 247),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('przepisy')
                  .doc()
                  .update({'content': widget.controller.text});
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) =>
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                foregroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.white)),
            child: const Text('Zapisz'),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: Builder(builder: (context) {
        if (currentIndex == 1) {
          return NoteEdit(widget.title, widget.content);
        }
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => NoteEdit(widget.title, widget.content)));
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Text(widget.content),
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Opis'),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edycja')
          ]),
    );
  }
}
