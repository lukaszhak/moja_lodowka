import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  const EditNote(
    this.document,
    this.content, {
    required this.onSave,
    Key? key,
  }) : super(key: key);

  final QueryDocumentSnapshot document;
  final String content;
  final Function onSave;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller = TextEditingController(text: widget.content);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('przepisy').snapshots(),
      builder: (context, snapshot) {
        return Scaffold(
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: controller,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 108, 3, 247),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('przepisy')
                  .doc(widget.document.id)
                  .update({'content': controller.text});
              widget.onSave();
            },
            child: const Icon(
              Icons.done,
            ),
          ),
        );
      },
    );
  }
}
