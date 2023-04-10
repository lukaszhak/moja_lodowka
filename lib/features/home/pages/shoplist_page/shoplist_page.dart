import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/widgets/shoplist_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/widgets/shoplist_page_body.dart';

class ShopListPage extends StatelessWidget {
  ShopListPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopListPageAppBar(controller: controller),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: const ShopListPageBody(),
    );
  }
}






