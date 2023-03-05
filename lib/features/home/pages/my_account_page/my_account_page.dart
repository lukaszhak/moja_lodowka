import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
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
                              const Color.fromARGB(255, 0, 51, 54)),
                      child: Text(AppLocalizations.of(context)!.no),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<RootCubit>().deleteAccount().whenComplete(
                            () => Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const RootPage()),
                                (Route<dynamic> route) => false));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 51, 54)),
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
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        toolbarHeight: 50,
        title: Text(
          AppLocalizations.of(context)!.myAccount,
          style: const TextStyle(fontSize: 23),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.4,
                fit: BoxFit.cover,
                image: AssetImage('images/openfridge.jpg'))),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(35.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 135,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/tiger.jpg'),
                    radius: 130,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                AppLocalizations.of(context)!.loggedInAs,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '$email',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 51, 54)),
                onPressed: () {
                  context.read<RootCubit>().signOut();
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.logOut),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
