import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/longdate_add_page/longdate_add_page.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/widgets/longdate_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/widgets/longdate_page_body.dart';

class LongDatePage extends StatelessWidget {
  const LongDatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LongDatePageAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LongDateAddPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: const LongPageBody(),
    );
  }
}

