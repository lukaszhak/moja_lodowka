import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app//features/home/noteview_page/viewnote_page.dart';
import 'package:moja_lodowka/app/core/enums.dart';
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
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        title: const Text(
          'Przepisy kulinarne',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
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
                          primary: const Color.fromARGB(255, 0, 51, 54),
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
                          primary: const Color.fromARGB(255, 0, 51, 54),
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
          create: (context) =>
              MenuPageCubit(MenuDocumentsRepository())..start(),
          child: BlocBuilder<MenuPageCubit, MenuPageState>(
            builder: (context, state) {
              final documentModels = state.documents;
              switch (state.status) {
                case Status.initial:
                  return const Center(
                    child: Text('Initial State'),
                  );
                  case Status.loading:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          color: Color.fromARGB(255, 0, 37, 2),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Ładowanie dokumentów',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                  case Status.success:
                  if (state.documents.isEmpty) {
                    return const Center(
                      child: Text(
                        'Brak przepisów do wyświetlenia',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    );
                  }
                  return ListView(
                children: [
                  const SizedBox(height: 10),
                  for (final documentModel in documentModels) ...[
                    Dismissible(
                      key: ValueKey(documentModel.id),
                      onDismissed: (_) => context
                          .read<MenuPageCubit>()
                          .delete(document: documentModel.id).whenComplete(() => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      backgroundColor:
                                          Color.fromARGB(255, 0, 51, 54),
                                      content: Text('Pomyślnie usunięto'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  ),),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ViewNote(
                                  documentModel.title,
                                  documentModel.content,
                                  documentModel.document),
                            ),
                          );
                        },
                        child: CategoryWidget(
                          documentModel.title,
                          const Color.fromARGB(255, 0, 51, 54),
                        ),
                      ),
                    ),
                  ],
                ],
              );
              case Status.error:
              return Center(
                    child: Text(
                      state.errorMessage!,
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
              }

              
            },
          ),
        ),
      ),
    );
  }
}
