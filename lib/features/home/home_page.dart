import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/domain/models/user_model/user_model.dart';
import 'package:moja_lodowka/features/home/pages/my_account_page/my_account_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moja_lodowka/features/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final UserModel? user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Image drugImage;
  late Image drinkImage;
  late Image longDateImage;
  late Image fridgeImage;
  late Image candyImage;
  late Image shopListImage;
  late Image recipesImage;
  late Image weatherImage;
  late Image expensesImage;

  @override
  void initState() {
    super.initState();
    drugImage = Image.asset('images/medicine.jpg');
    drinkImage = Image.asset('images/water.jpg');
    longDateImage = Image.asset('images/rice.jpg');
    fridgeImage = Image.asset('images/frozen.jpg');
    candyImage = Image.asset('images/candy.jpg');
    shopListImage = Image.asset('images/zakupy.jpg');
    recipesImage = Image.asset('images/menu.jpg');
    weatherImage = Image.asset('images/weather.jpg');
    expensesImage = Image.asset('images/dollar.jpg');
  }

  @override
  void didChangeDependencies() {
    precacheImage(drugImage.image, context);
    precacheImage(drinkImage.image, context);
    precacheImage(longDateImage.image, context);
    precacheImage(fridgeImage.image, context);
    precacheImage(candyImage.image, context);
    precacheImage(shopListImage.image, context);
    precacheImage(recipesImage.image, context);
    precacheImage(weatherImage.image, context);
    precacheImage(expensesImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          AppRouter().navigateToPage(
            MyAccountPage(email: widget.user?.email),
          );
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
        email: widget.user?.email,
      ),
    );
  }
}
