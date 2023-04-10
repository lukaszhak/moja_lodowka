import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/fridge_add_page/fridge_add_page.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/widgets/fridge_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/widgets/fridge_page_body.dart';

class FridgePage extends StatelessWidget {
  const FridgePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FridgePageAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FridgeAddPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: const FridgePageBody(),
    );
  }
}

