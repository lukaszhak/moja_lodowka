import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/domain/models/menu_document_model/menu_document_model.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart';

class EditNote extends StatelessWidget {
  const EditNote({
    required this.onSave,
    required this.documentModel,
    Key? key,
  }) : super(key: key);
  final Function onSave;
  final MenuDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MenuPageCubit>(),
      child: BlocBuilder<MenuPageCubit, MenuPageState>(
        builder: (context, state) {
          final controller = TextEditingController(text: documentModel.content);
          return Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: controller,
                    autofocus: true,
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
                context.read<MenuPageCubit>().updateDoc(
                    content: controller.text,
                    document: documentModel.document!.id);
                onSave();
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
