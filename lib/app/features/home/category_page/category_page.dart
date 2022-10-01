import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:moja_lodowka/app/cubit/root_repository/root_repository.dart';
import 'package:moja_lodowka/app/features/home/candy_page/candy_page.dart';
import 'package:moja_lodowka/app/features/home/drink_page/drink_page.dart';
import 'package:moja_lodowka/app/features/home/drug_page/drug_page.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/fridge_page.dart';
import 'package:moja_lodowka/app/features/home/list_page/list_page.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/longdate_page.dart';
import 'package:moja_lodowka/app/features/home/menu_page/menu_page.dart';
import 'package:moja_lodowka/app/features/home/my_account_page/my_account_page.dart';
import 'package:moja_lodowka/app/features/home/weather_page/weather_page.dart';
import 'package:moja_lodowka/custom_icons_icons.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Kontroluj Swoje Produkty!',
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => MyAccountPage(email: user.email)));
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
                          builder: (_) => const FridgePage(),
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
                          builder: (_) => const DrinkPage(),
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
                          builder: (_) => const CandyPage(),
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
                          builder: (_) => const LongdatePage(),
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
      drawer: _MyDrawer(
        email: user.email,
      ),
    );
  }
}

class _MyDrawer extends StatelessWidget {
  const _MyDrawer({
    required this.email,
    Key? key,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocProvider(
        create: (context) => RootCubit(RootRepository()),
        child: BlocBuilder<RootCubit, RootState>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jesteś zalogowany jako $email'),
                      InkWell(
                        onTap: () {
                          context.read<RootCubit>().signOut();
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.logout),
                            SizedBox(
                              width: 4,
                            ),
                            Text('Wyloguj')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      CustomIcons.pills,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Text('Leki'),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DrugPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      Icons.local_bar,
                      color: Color.fromARGB(255, 245, 112, 3),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Napoje'),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DrinkPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      Icons.access_time,
                      color: Color.fromARGB(255, 126, 68, 1),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Produkty długoterminowe'),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LongdatePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      Icons.kitchen,
                      color: Color.fromARGB(255, 3, 7, 248),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Produkty lodówkowe')
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FridgePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      CustomIcons.candy_cane,
                      color: Color.fromARGB(255, 245, 3, 3),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Słodycze'),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CandyPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      Icons.view_list,
                      color: Color.fromARGB(255, 1, 107, 17),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text('Lista zakupów'),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ListPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      Icons.restaurant,
                      color: Color.fromARGB(255, 108, 3, 247),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Przepisy kulinarne'),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MenuPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(
                    children: const [
                      Icon(
                        Icons.sunny,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Sprawdź pogodę'),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WeatherPage(),
                      ),
                    );
                  },
                )
              ],
            );
          },
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
