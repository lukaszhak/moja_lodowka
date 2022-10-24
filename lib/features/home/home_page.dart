import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/custom_icons_icons.dart';
import 'package:moja_lodowka/domain/models/user_model/user_model.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/candy_page.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/drink_page.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/drug_page.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/fridge_page.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/longdate_page.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/menu_page.dart';
import 'package:moja_lodowka/features/home/pages/my_account_page/my_account_page.dart';
import 'package:moja_lodowka/features/home/pages/weather_page/weather_page.dart';
import 'pages/shoplist_page/shoplist_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
      drawer: _MyDrawer(
        email: user?.email,
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
        create: (context) => getIt<RootCubit>(),
        child: BlocBuilder<RootCubit, RootState>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 51, 54)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 1,
                      ),
                      Text(
                        '$email',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 0, 51, 54)),
                                        child: const Text('Nie'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          context.read<RootCubit>().signOut();
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 0, 51, 54)),
                                        child: const Text('Tak'),
                                      ),
                                    ],
                                    title: const Text(
                                        'Czy napewno chcesz się wylogować?'),
                                  ));
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Wyloguj',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
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
                      size: 35,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      'Leki',
                      style: TextStyle(fontSize: 18),
                    ),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DrugPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      Icons.local_bar,
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Napoje',
                      style: TextStyle(fontSize: 18),
                    ),
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
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Produkty długoterminowe',
                      style: TextStyle(fontSize: 18),
                    ),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LongDatePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      Icons.kitchen,
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Produkty lodówkowe',
                      style: TextStyle(fontSize: 18),
                    )
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
                      CustomIcons.candyCane,
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Słodycze',
                      style: TextStyle(fontSize: 18),
                    ),
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
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Lista zakupów',
                      style: TextStyle(fontSize: 18),
                    ),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShopListPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Row(children: const [
                    Icon(
                      Icons.restaurant,
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Przepisy kulinarne',
                      style: TextStyle(fontSize: 18),
                    ),
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
                        size: 35,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Sprawdź pogodę',
                        style: TextStyle(fontSize: 18),
                      ),
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
