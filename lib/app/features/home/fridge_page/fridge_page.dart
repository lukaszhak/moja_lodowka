import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/features/home/category_page/category_page.dart';

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
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 3, 28, 245),
                        ),
                        child: const Text('Cofnij'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance.collection('lodowka').add(
                            {'title': controller.text},
                          );
                          controller.clear();
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 3, 28, 245),
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
                  ));
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('lodowka').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Wystąpił błąd'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text('Ładowanie, proszę czekać')
                ],
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
                          .collection('lodowka')
                          .doc(document.id)
                          .delete();
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
    );
  }
}
