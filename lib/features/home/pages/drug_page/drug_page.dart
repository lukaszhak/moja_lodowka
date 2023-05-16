import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/drug_add_page/drug_add_page.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/widgets/drug_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/widgets/drug_page_body.dart';
import 'package:provider/provider.dart';

class DrugPage extends StatefulWidget {
  const DrugPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DrugPage> createState() => _DrugPageState();
}

class _DrugPageState extends State<DrugPage> {
  int notificationId = UniqueKey().hashCode;

  void newId() {
    setState(() {
      notificationId++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DrugPageAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Provider<int>(
                create: (context) => notificationId,
                child: const DrugAddPage(),
              ),
            ),
          );
          newId();
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
