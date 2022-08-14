import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/main.dart';

class DrinkPage extends StatelessWidget {
  DrinkPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 112, 3),
        title: const Text('Napoje'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 245, 112, 3),
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
                    primary: const Color.fromARGB(255, 245, 112, 3),
                  ),
                  child: const Text('Cofnij'),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('napoje').add(
                      {'title': controller.text},
                    );
                    controller.clear();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 245, 112, 3),
                  ),
                  child: const Text('Dodaj'),
                ),
              ],
              title: const Text('Dodaj produkt'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Wpisz tutaj'),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            fit: BoxFit.cover,
            image: AssetImage(
              'images/water.jpg',
            ),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('napoje').snapshots(),
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
                for (final document in documents) ...[
                  Dismissible(
                    key: ValueKey(document.id),
                    onDismissed: (_) {
                      FirebaseFirestore.instance
                          .collection('napoje')
                          .doc(document.id)
                          .delete();
                    },
                    child: CategoryWidget(
                      document['title'],
                      const Color.fromARGB(255, 245, 112, 3),
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
