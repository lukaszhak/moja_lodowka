import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/custom_icons_icons.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/candy_page.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/drink_page.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/drug_page.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/fridge_page.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/longdate_page.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/menu_page.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/shoplist_page.dart';
import 'package:moja_lodowka/features/home/pages/weather_page/weather_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
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
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 0, 51, 54)),
                                        child: Text(
                                            AppLocalizations.of(context)!.no),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          context.read<RootCubit>().signOut();
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 0, 51, 54)),
                                        child: Text(
                                            AppLocalizations.of(context)!.yes),
                                      ),
                                    ],
                                    title: Text(AppLocalizations.of(context)!
                                        .logOutInfo),
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
                HomePageListTile(
                  icon: CustomIcons.pills,
                  title: AppLocalizations.of(context)!.medications,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const DrugPage(),
                      ),
                    );
                  },
                ),
                HomePageListTile(
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
                HomePageListTile(
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
                HomePageListTile(
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
                HomePageListTile(
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
                HomePageListTile(
                  icon: Icons.view_list,
                  title: AppLocalizations.of(context)!.shoppingList,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ShopListPage(),
                      ),
                    );
                  },
                ),
                HomePageListTile(
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
                HomePageListTile(
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

class HomePageListTile extends StatelessWidget {
  const HomePageListTile({
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
