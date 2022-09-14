import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/features/add_page/add_page.dart';
import 'package:moja_lodowka/app/features/home/category_page/category_page.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/cubit/fridge_page_cubit.dart';

class FridgePage extends StatelessWidget {
  FridgePage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 28, 245),
        title: const Text(
          'Produkty Lodówkowe',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 3, 28, 245),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            fit: BoxFit.cover,
            image: AssetImage('images/frozen.jpg'),
          ),
        ),
        child: BlocProvider(
          create: (context) => FridgePageCubit()..start(),
          child: BlocBuilder<FridgePageCubit, FridgePageState>(
            builder: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                return const Center(child: Text('Wystąpił błąd'));
              }
              if (state.isLoading) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Color.fromARGB(255, 3, 28, 245),
                    ),
                    Text(
                      'Ładowanie, proszę czekać',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
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
                            .read<FridgePageCubit>()
                            .delete(document: document.id);
                      },
                      child: CategoryWidget(
                        document['title'],
                        const Color.fromARGB(255, 3, 28, 245),
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
