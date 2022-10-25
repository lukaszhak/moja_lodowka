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
                                        child: Text(AppLocalizations.of(context)!.no),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          context.read<RootCubit>().signOut();
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 0, 51, 54)),
                                        child:  Text(AppLocalizations.of(context)!.yes),
                                      ),
                                    ],
                                    title:  Text(
                                        AppLocalizations.of(context)!.logOutInfo),
                                  ));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              AppLocalizations.of(context)!.logOut,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                _HomePageListTile(
                  icon: CustomIcons.pills,
                  title: AppLocalizations.of(context)!.medicines,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const DrugPage(),
                      ),
                    );
                  },
                ),
                _HomePageListTile(
                  icon: Icons.local_bar,
                  title: AppLocalizations.of(context)!.drinks,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const DrinkPage(),
                      ),
                    );
                  },
                ),
                _HomePageListTile(
                  icon: Icons.access_time,
                  title: AppLocalizations.of(context)!.longTerm,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const LongDatePage(),
                      ),
                    );
                  },
                ),
                _HomePageListTile(
                  icon: Icons.kitchen,
                  title: AppLocalizations.of(context)!.fridge,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const FridgePage(),
                      ),
                    );
                  },
                ),
                _HomePageListTile(
                  icon: CustomIcons.candyCane,
                  title: AppLocalizations.of(context)!.candys,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CandyPage(),
                      ),
                    );
                  },
                ),
                _HomePageListTile(
                  icon: Icons.view_list,
                  title: AppLocalizations.of(context)!.shopList,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ShopListPage(),
                      ),
                    );
                  },
                ),
                _HomePageListTile(
                  icon: Icons.restaurant,
                  title: AppLocalizations.of(context)!.recipes,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MenuPage(),
                      ),
                    );
                  },
                ),
                _HomePageListTile(
                    icon: Icons.sunny,
                    title: AppLocalizations.of(context)!.weatherCheck,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const WeatherPage(),
                        ),
                      );
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}

class _HomePageListTile extends StatelessWidget {
  const _HomePageListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(children: [
          Icon(
            icon,
            color: Colors.black,
            size: 35,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ]),
        onTap: onTap);
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
