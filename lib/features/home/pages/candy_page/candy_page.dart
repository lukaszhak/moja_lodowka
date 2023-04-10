import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/candy_add_page/candy_add_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/widgets/candy_page_body.dart';

class CandyPage extends StatelessWidget {
  const CandyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        toolbarHeight: 50,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.candys,
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
                            decoration:
                                const BoxDecoration(color: Colors.black),
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
                          Text(AppLocalizations.of(context)!.weekToOutDate)
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
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CandyAddPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const CandyPageBody(),
    );
  }
}



