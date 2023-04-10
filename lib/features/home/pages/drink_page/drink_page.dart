import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/drink_add_page/drink_add_page.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/widgets/drink_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/widgets/drink_page_body.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DrinkPageAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DrinkAddPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const DrinkPageBody(),
    );
  }
}


