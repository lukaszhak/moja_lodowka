// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteView extends StatefulWidget {
  const NoteView(
    this.document,
    this.title,
    this.content, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String content;
  final QueryDocumentSnapshot document;
  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  TextEditingController controller = TextEditingController();
  var currentIndex = 0;
  bool visible = false;
  @override
  void initState() {
    controller = TextEditingController(text: widget.content);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('przepisy')
            .snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
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
                          .doc(widget.document.id)
                          .update(
                        {'content': controller.text},
                      ).whenComplete(() => currentIndex = 0);
                      setState(() {
                        visible = false;
                      });
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
            body: Builder(builder: (context) {
              if (currentIndex == 1) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: controller),
                    )
                  ]),
                );
              }
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(widget.content),
                  ),
                ],
              );
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
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: 'Opis'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.edit), label: 'Edycja')
                ]),
          );
        });
  }
}
