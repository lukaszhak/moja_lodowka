import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/custom_icons_icons.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/candy_page.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/drink_page.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/drug_page.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/expenses_page.dart';
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
                    color: Color.fromARGB(255, 0, 51, 54),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        '$email',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                HomePageListTile(
                  icon: CustomIcons.pills,
                  title: AppLocalizations.of(context)!.medications,
                  onTap: () {
                    AppRouter().navigateToPage(
                      const DrugPage(),
                    );
                  },
                ),
                HomePageListTile(
                  icon: Icons.local_bar,
                  title: AppLocalizations.of(context)!.drinks,
                  onTap: () {
                    AppRouter().navigateToPage(
                      const DrinkPage(),
                    );
                  },
                ),
                HomePageListTile(
                  icon: Icons.access_time,
                  title: AppLocalizations.of(context)!.longTerm,
                  onTap: () {
                    AppRouter().navigateToPage(
                      const LongDatePage(),
                    );
                  },
                ),
                HomePageListTile(
                  icon: Icons.kitchen,
                  title: AppLocalizations.of(context)!.fridge,
                  onTap: () {
                    AppRouter().navigateToPage(
                      const FridgePage(),
                    );
                  },
                ),
                HomePageListTile(
                  icon: CustomIcons.candyCane,
                  title: AppLocalizations.of(context)!.candys,
                  onTap: () {
                    AppRouter().navigateToPage(
                      const CandyPage(),
                    );
                  },
                ),
                HomePageListTile(
                  icon: Icons.view_list,
                  title: AppLocalizations.of(context)!.shoppingList,
                  onTap: () {
                    AppRouter().navigateToPage(
                      ShopListPage(),
                    );
                  },
                ),
                HomePageListTile(
                  icon: Icons.restaurant,
                  title: AppLocalizations.of(context)!.recipes,
                  onTap: () {
                    AppRouter().navigateToPage(
                      MenuPage(),
                    );
                  },
                ),
                HomePageListTile(
                    icon: Icons.sunny,
                    title: AppLocalizations.of(context)!.weatherCheck,
                    onTap: () {
                      AppRouter().navigateToPage(
                        const WeatherPage(),
                      );
                    }),
                HomePageListTile(
                    icon: Icons.account_balance_wallet,
                    title: AppLocalizations.of(context)!.expenses,
                    onTap: () {
                      AppRouter().navigateToPage(
                        const ExpensesPage(),
                      );
                    }),
                const Divider(
                  color: Colors.black,
                  thickness: 1.5,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    AppRouter().goBack();
                                  },
                                  child: Text(AppLocalizations.of(context)!.no),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<RootCubit>().signOut();
                                    AppRouter().goBack();
                                  },
                                  child:
                                      Text(AppLocalizations.of(context)!.yes),
                                ),
                              ],
                              title: Text(
                                  AppLocalizations.of(context)!.logOutInfo),
                            ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout,
                          color: Colors.black,
                          size: 35,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          AppLocalizations.of(context)!.logOut,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                )
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
