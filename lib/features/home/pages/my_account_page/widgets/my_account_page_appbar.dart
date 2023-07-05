import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAccountPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAccountPageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
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
                      context.read<RootCubit>().deleteAccount().whenComplete(
                            () => AppRouter().navigateAndRemoveAllRoutes(
                              const RootPage(),
                            ),
                          );
                    },
                    child: Text(AppLocalizations.of(context)!.yes),
                  ),
                ],
                title: Text(AppLocalizations.of(context)!.deleteAccount),
              ),
            );
          },
          icon: const Icon(Icons.delete),
        ),
      ],
      title: Text(
        AppLocalizations.of(context)!.myAccount,
        style: const TextStyle(fontSize: 23),
      ),
    );
  }
}
