import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/widgets/menu_page_body.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/widgets/menu_page_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuPage extends StatelessWidget {
  MenuPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        title: Text(
          AppLocalizations.of(context)!.recipes,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: MenuPageButton(controller: controller),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: const MenuPageBody(),
    );
  }
}



