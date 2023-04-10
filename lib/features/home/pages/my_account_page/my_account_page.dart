import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/my_account_page/widgets/my_account_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/my_account_page/widgets/my_account_page_body.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAccountPageAppBar(),
      body: MyAccountPageBody(email: email),
    );
  }
}



