import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/drug_add_page/drug_add_page.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/widgets/drug_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/widgets/drug_page_body.dart';

class DrugPage extends StatelessWidget {
  const DrugPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DrugPageAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DrugAddPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: const DrugPageBody(),
    );
  }
}
