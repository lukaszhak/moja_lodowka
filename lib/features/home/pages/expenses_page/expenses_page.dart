import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('expenses')
            .orderBy('title')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Brak elementów'));
          }
          final documents = snapshot.data!.docs;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              title: const Text(
                'Moje wydatki',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: GridView.builder(
              itemCount: documents.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 175,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                final data = documents[index].data();
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: ExpensesPageItem(
                    title: data['title'],
                  ),
                );
              },
            ),
          );
        });
  }
}

class ExpensesPageItem extends StatelessWidget {
  const ExpensesPageItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 51, 54),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
