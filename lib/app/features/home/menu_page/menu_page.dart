import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app//features/home/noteview_page/viewnote_page.dart';
import 'package:moja_lodowka/app/features/home/category_page/category_page.dart';
import 'package:moja_lodowka/app/features/home/menu_page/cubit/menu_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/menu_page/repository/menu_documents_repository.dart';

class MenuPage extends StatelessWidget {
  MenuPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 108, 3, 247),
        title: const Text(
          'Przepisy kulinarne',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 108, 3, 247),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => BlocProvider(
              create: (context) => MenuPageCubit(MenuDocumentsRepository()),
              child: BlocBuilder<MenuPageCubit, MenuPageState>(
                builder: (context, state) {
                  return AlertDialog(
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 108, 3, 247),
                        ),
                        child: const Text('Cofnij'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<MenuPageCubit>()
                              .add(title: controller.text, content: '');
                          controller.clear();
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 108, 3, 247),
                        ),
                        child: const Text('Dodaj'),
                      ),
                    ],
                    title: const Text('Dodaj przepis'),
                    content: TextField(
                      controller: controller,
                      decoration:
                          const InputDecoration(hintText: 'Wpisz tutaj'),
                    ),
                  );
                },
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.4,
            fit: BoxFit.cover,
            image: AssetImage(
              'images/menu.jpg',
            ),
          ),
        ),
        child: BlocProvider(
          create: (context) => MenuPageCubit(MenuDocumentsRepository())..start(),
          child: BlocBuilder<MenuPageCubit, MenuPageState>(
            builder: (context, state) {
              final documentModels = state.documents;

              return ListView(
                children: [
                  const SizedBox(height: 10),
                  for (final documentModel in documentModels) ...[
                    Dismissible(
                      key: ValueKey(documentModel.id),
                      onDismissed: (_) => context
                          .read<MenuPageCubit>()
                          .delete(document: documentModel.id),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ViewNote(documentModel.title,
                              documentModel.content, documentModel.document),
                            ),
                          );
                        },
                        child: CategoryWidget(documentModel.title,
                          const Color.fromARGB(255, 108, 3, 247),
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
