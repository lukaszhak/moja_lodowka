import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/data/remote_data_sources/menu_remote_data_source/menu_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/menu_document_model/menu_document_model.dart';
import 'package:moja_lodowka/domain/repositories/menu_documents_repository/menu_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart';

class EditNote extends StatefulWidget {
  const EditNote({
    required this.onSave,
    required this.documentModel,
    Key? key,
  }) : super(key: key);
  final Function onSave;
  final MenuDocumentModel documentModel;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller = TextEditingController(text: widget.documentModel.content);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MenuPageCubit(MenuDocumentsRepository(MenuRemoteDataSource()))
            ..start(),
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
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              onPressed: () {
                context.read<MenuPageCubit>().update(
                    content: controller.text,
                    document: widget.documentModel.document.id);
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
