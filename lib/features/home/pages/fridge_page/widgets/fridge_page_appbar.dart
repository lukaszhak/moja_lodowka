import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FridgePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FridgePageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 0, 51, 54),
      title: Text(
        AppLocalizations.of(context)!.fridge,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.description),
                    const Divider(
                      color: Colors.black,
                    )
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 13,
                          height: 13,
                          decoration: const BoxDecoration(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(AppLocalizations.of(context)!.productOutDate)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 13,
                          height: 13,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 0, 0)),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(AppLocalizations.of(context)!.fourDaysToOutDate)
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          icon: const Icon(Icons.info_outline),
        ),
      ],
    );
  }
}
