import 'package:flutter/material.dart';
import 'package:moja_lodowka/domain/models/menu_document_model/menu_document_model.dart';
import 'package:moja_lodowka/features/home/pages/noteedit_page/noteedit_page.dart';

class ViewNote extends StatefulWidget {
  const ViewNote( {
      required this.documentModel,
    Key? key,
  }) : super(key: key);

  final MenuDocumentModel documentModel;

  @override
  State<ViewNote> createState() => _NoteViewState();
}

class _NoteViewState extends State<ViewNote> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.documentModel.title),
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
      ),
      body: Builder(
        builder: (context) {
          if (currentIndex == 1) {
            return EditNote(documentModel: widget.documentModel,
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
                child: Text(widget.documentModel.content),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 30, 253, 1),
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(
            () {
              currentIndex = newIndex;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Opis'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.edit,
              ),
              label: 'Edycja'),
        ],
      ),
    );
  }
}
