import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/features/home/home_page.dart';
import 'package:moja_lodowka/app/features/home/pages/list_page/cubit/list_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/pages/list_page/data_source/list_remote_data_source.dart';
import 'package:moja_lodowka/app/features/home/pages/list_page/repository/list_documents_repository.dart';
class ListPage extends StatelessWidget {
  ListPage({
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
          'Lista zakupów',
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
            builder: (context) {
              return BlocProvider(
                create: (context) => ListPageCubit(ListDocumentsRepository(ListRemoteDataSource())),
                child: BlocBuilder<ListPageCubit, ListPageState>(
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
                                .read<ListPageCubit>()
                                .add(title: controller.text);
                            controller.clear();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 0, 51, 54),
                          ),
                          child: const Text('Dodaj'),
                        ),
                      ],
                      title: const Text('Dodaj produkt'),
                      content: TextField(
                        controller: controller,
                        decoration:
                            const InputDecoration(hintText: 'Wpisz tutaj'),
                      ),
                    );
                  },
                ),
              );
            },
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
            opacity: 0.6,
            fit: BoxFit.cover,
            image: AssetImage('images/zakupy.jpg'),
          ),
        ),
        child: BlocProvider(
          create: (context) =>
              ListPageCubit(ListDocumentsRepository(ListRemoteDataSource()))..start(),
          child: BlocBuilder<ListPageCubit, ListPageState>(
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
                          'Trwa ładowanie',
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
                        'Lista zakupów jest pusta',
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
                          onDismissed: (_) {
                            context
                                .read<ListPageCubit>()
                                .delete(document: documentModel.id)
                                .whenComplete(
                                  () => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      backgroundColor:
                                          Color.fromARGB(255, 0, 51, 54),
                                      content: Text('Pomyślnie usunięto'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  ),
                                );
                          },
                          child: CategoryWidget(
                            documentModel.title,
                            const Color.fromARGB(255, 0, 51, 54),
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
