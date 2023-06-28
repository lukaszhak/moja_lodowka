import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/candy_add_page/candy_add_page.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/widgets/candy_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/widgets/candy_page_body.dart';
import 'package:provider/provider.dart';

class CandyPage extends StatefulWidget {
  const CandyPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CandyPage> createState() => _CandyPageState();
}

class _CandyPageState extends State<CandyPage> {
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
        appBar: const CandyPageAppBar(),
        backgroundColor: const Color.fromARGB(255, 250, 252, 250),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 0, 51, 54),
          onPressed: () {
            AppRouter().navigateToPage(
              Provider<int>(
                create: (context) => notificationId,
                child: CandyAddPage(),
              ),
            );

            newId();
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: const CandyPageBody(),
      ),
    );
  }
}
