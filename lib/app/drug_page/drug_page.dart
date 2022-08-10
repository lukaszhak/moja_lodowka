import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/main.dart';



class DrugPage extends StatelessWidget {
  DrugPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Leki'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
                    primary: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: const Text('Cofnij'),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('leki').add(
                      {'title': controller.text},
                    );
                    controller.clear();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 0, 0),
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
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.4,
            fit: BoxFit.cover,
            image: AssetImage(
              'images/medicine.jpg',
            ),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('leki').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Wystąpił błąd');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Ładowanie, proszę czekać');
            }

            final documents = snapshot.data!.docs;

            return ListView(
              children: [
                for (final document in documents) ...[
                  Dismissible(
                    key: ValueKey(document.id),
                    onDismissed: (_) => FirebaseFirestore.instance
                        .collection('leki')
                        .doc(document.id)
                        .delete(),
                    child: CategoryWidget(
                      document['title'],
                      const Color.fromARGB(255, 0, 0, 0),
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