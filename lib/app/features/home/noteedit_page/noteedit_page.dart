import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/features/home/menu_page/cubit/menu_page_cubit.dart';

class EditNote extends StatefulWidget {
  const EditNote(
    this.content, {
    required this.onSave,
    Key? key,
    required this.document,
  }) : super(key: key);
  final String content;
  final Function onSave;
  final QueryDocumentSnapshot document;

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
    return BlocProvider(
      create: (context) => MenuPageCubit()..start(),
      child: BlocBuilder<MenuPageCubit, MenuPageState>(
        builder: (context, state) {
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
                context.read<MenuPageCubit>().update(
                    content: controller.text, document: widget.document.id);
                widget.onSave();
              },
              child: const Icon(
                Icons.done,
              ),
            ),
          );
        },
      ),
    );
  }
}
