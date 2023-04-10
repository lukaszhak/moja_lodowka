import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/candy_add_page/candy_add_page.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/widgets/candy_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/widgets/candy_page_body.dart';

class CandyPage extends StatelessWidget {
  const CandyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CandyPageAppBar(),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CandyAddPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const CandyPageBody(),
    );
  }
}
