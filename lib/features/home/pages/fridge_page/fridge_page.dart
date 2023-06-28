import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/fridge_add_page/fridge_add_page.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/widgets/fridge_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/widgets/fridge_page_body.dart';
import 'package:provider/provider.dart';

class FridgePage extends StatefulWidget {
  const FridgePage({
    Key? key,
  }) : super(key: key);

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  int notificationId = UniqueKey().hashCode;

  void newId() {
    setState(() {
      notificationId++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FridgePageAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          AppRouter().navigateToPage(
            Provider<int>(
              create: (context) => notificationId,
              child: const FridgeAddPage(),
            ),
          );
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
