import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/features/home/noteedit_page/noteedit_page.dart';

class ViewNote extends StatefulWidget {
  const ViewNote(
    this.document,
    this.title,
    this.content, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String content;
  final QueryDocumentSnapshot document;
  @override
  State<ViewNote> createState() => _NoteViewState();
}

class _NoteViewState extends State<ViewNote> {
  TextEditingController controller = TextEditingController();
  var currentIndex = 0;
  @override
  void initState() {
    controller = TextEditingController(text: widget.content);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 108, 3, 247),
      ),
      body: Builder(
        builder: (context) {
          if (currentIndex == 1) {
            return EditNote(
              widget.document,
              widget.content,
              onSave: () {
                setState(
                  () {
                    currentIndex = 0;
                  },
                );
              },
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
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(
            () {
              currentIndex = newIndex;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Opis'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edycja'),
        ],
      ),
    );
  }
}
