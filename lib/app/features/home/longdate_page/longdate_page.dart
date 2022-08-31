import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/features/home/category_page/category_page.dart';

class LongdatePage extends StatelessWidget {
  LongdatePage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 126, 68, 1),
        title: const Text(
          'Produkty długoterminowe',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 126, 68, 1),
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
                    primary: const Color.fromARGB(255, 126, 68, 1),
                  ),
                  child: const Text('Cofnij'),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('data').add(
                      {'title': controller.text},
                    );
                    controller.clear();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 126, 68, 1),
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
              'images/rice.jpg',
            ),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('data').snapshots(),
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
                          .collection('data')
                          .doc(document.id)
                          .delete();
                    },
                    child: CategoryWidget(
                      document['title'],
                      const Color.fromARGB(255, 126, 68, 1),
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
