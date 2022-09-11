import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/features/home/candy_page/candy_page.dart';
import 'package:moja_lodowka/app/features/home/drink_page/drink_page.dart';
import 'package:moja_lodowka/app/features/home/drug_page/drug_page.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/fridge_page.dart';
import 'package:moja_lodowka/app/features/home/list_page/list_page.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/longdate_page.dart';
import 'package:moja_lodowka/app/features/home/menu_page/menu_page.dart';
import 'package:moja_lodowka/app/features/home/my_account_page/my_account_page.dart';
import 'package:moja_lodowka/custom_icons_icons.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Kontroluj Swoje Produkty!',
            style: TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => MyAccountPage(email: user.email)));
        },
        backgroundColor: const Color.fromARGB(255, 0, 54, 2),
        child: const Icon(Icons.person),
      ),
      backgroundColor: const Color.fromARGB(255, 154, 247, 157),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.4,
            fit: BoxFit.cover,
            image: AssetImage(
              'images/food.jpg',
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => FridgePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      primary: const Color.fromARGB(255, 252, 253, 252),
                    ),
                    child: const Icon(
                      Icons.kitchen,
                      size: 35,
                      color: Color.fromARGB(255, 3, 7, 248),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DrinkPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      primary: const Color.fromARGB(255, 250, 252, 250),
                    ),
                    child: const Icon(
                      Icons.local_bar,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CandyPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      CustomIcons.candy_cane,
                      color: Colors.red,
                      size: 35,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => LongdatePage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.access_time,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DrugPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      CustomIcons.pills,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => MenuPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.restaurant,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        primary: Colors.white),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ListPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.view_list,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
