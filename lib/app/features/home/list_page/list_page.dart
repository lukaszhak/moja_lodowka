import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/features/home/category_page/category_page.dart';
import 'package:moja_lodowka/app/features/home/list_page/cubit/list_page_cubit.dart';

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
        backgroundColor: const Color.fromARGB(255, 1, 107, 17),
        title: const Text(
          'Lista zakupów',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 1, 107, 17),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) => ListPageCubit(),
                child: BlocBuilder<ListPageCubit, ListPageState>(
                  builder: (context, state) {
                    return AlertDialog(
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 1, 107, 17),
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
                            primary: const Color.fromARGB(255, 1, 107, 17),
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
          create: (context) => ListPageCubit()..start(),
          child: BlocBuilder<ListPageCubit, ListPageState>(
            builder: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                return const Center(child: Text('Wystąpił błąd'));
              }
              if (state.isLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Color.fromARGB(255, 1, 107, 17),
                      ),
                      Text(
                        'Ładowanie, proszę czekać',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              }

              final documents = state.documents;

              return ListView(
                children: [
                  const SizedBox(height: 10),
                  for (final document in documents) ...[
                    Dismissible(
                      key: ValueKey(document.id),
                      onDismissed: (_) {
                        context
                            .read<ListPageCubit>()
                            .delete(document: document.id);
                      },
                      child: CategoryWidget(
                        document['title'],
                        const Color.fromARGB(255, 1, 107, 17),
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
