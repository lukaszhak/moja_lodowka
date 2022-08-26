import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/noteview_page/noteview_page.dart';
import 'package:moja_lodowka/app/noteview_page/viewnote_page.dart';
import 'package:moja_lodowka/main.dart';

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
            builder: (context) => AlertDialog(
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
                    FirebaseFirestore.instance.collection('przepisy').add(
                      {
                        'title': controller.text,
                        'content': '',
                      },
                    );
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
              'images/menu.jpg',
            ),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('przepisy').snapshots(),
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
                    onDismissed: (_) => FirebaseFirestore.instance
                        .collection('przepisy')
                        .doc(document.id)
                        .delete(),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ViewNote(
                              document,
                              document['title'],
                              document['content'],
                            ),
                          ),
                        );
                      },
                      child: CategoryWidget(
                        document['title'],
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
    );
  }
}
