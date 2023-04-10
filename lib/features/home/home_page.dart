import 'package:flutter/material.dart';
import 'package:moja_lodowka/domain/models/user_model/user_model.dart';
import 'package:moja_lodowka/features/home/pages/my_account_page/my_account_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moja_lodowka/features/home/widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        title: Text(
          AppLocalizations.of(context)!.controlYourProducts,
          style: const TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => MyAccountPage(email: user?.email)));
        },
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        child: const Icon(Icons.person),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.4,
            fit: BoxFit.cover,
            image: AssetImage(
              'images/openfridge.jpg',
            ),
          ),
        ),
      ),
      drawer: HomePageDrawer(
        email: user?.email,
      ),
    );
  }
}



class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
    this.title,
    this.color, {
    Key? key,
  }) : super(key: key);

  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(15),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
