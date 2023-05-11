import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/drink_add_page/drink_add_page.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/widgets/drink_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/widgets/drink_page_body.dart';
import 'package:provider/provider.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  int notificationId = UniqueKey().hashCode;

  void newId() {
    setState(() {
      notificationId++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<int>(
      create: (context) => notificationId,
      child: Scaffold(
        appBar: const DrinkPageAppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 0, 51, 54),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Provider<int>(
                  create: (context) => notificationId,
                  child: const DrinkAddPage(),
                ),
              ),
            );
            newId();
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: const DrinkPageBody(),
      ),
    );
  }
}
