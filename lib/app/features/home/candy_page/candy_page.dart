import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/features/home/candy_page/cubit/candy_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/category_page/category_page.dart';

class CandyPage extends StatelessWidget {
  CandyPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 245, 3, 3),
        title: const Text(
          'Słodycze',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 245, 3, 3),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 245, 3, 3),
                  ),
                  child: const Text('Cofnij'),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('slodycze').add(
                      {'title': controller.text},
                    );
                    controller.clear();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 245, 3, 3),
                  ),
                  child: const Text('Dodaj'),
                ),
              ],
              title: const Text('Dodaj produkt'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Wpisz tutaj',
                ),
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
              'images/candy.jpg',
            ),
          ),
        ),
        child: BlocProvider(
          create: (context) => CandyPageCubit()..start(),
          child: BlocBuilder<CandyPageCubit, CandyPageState>(
            builder: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                return Center(
                  child: Text(
                    'Wystąpił błąd: ${state.errorMessage}',
                  ),
                );
              }
              if (state.isLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Color.fromARGB(255, 245, 3, 3),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Ładowanie, proszę czekać',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                        FirebaseFirestore.instance
                            .collection('slodycze')
                            .doc(document.id)
                            .delete();
                      },
                      child: CategoryWidget(
                        document['title'],
                        const Color.fromARGB(255, 245, 3, 3),
                      ),
                    ),
                  ],
                ],
              );
              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('slodycze')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Wystąpił błąd'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          Text('Ładowanie, proszę czekać')
                        ],
                      ),
                    );
                  }

                  final documents = snapshot.data!.docs;

                  return ListView(
                    children: [
                      const SizedBox(height: 10),
                      for (final document in documents) ...[
                        Dismissible(
                          key: ValueKey(document.id),
                          onDismissed: (_) {
                            FirebaseFirestore.instance
                                .collection('slodycze')
                                .doc(document.id)
                                .delete();
                          },
                          child: CategoryWidget(
                            document['title'],
                            const Color.fromARGB(255, 245, 3, 3),
                          ),
                        ),
                      ],
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
