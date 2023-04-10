import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class MyAccountPageBody extends StatelessWidget {
  const MyAccountPageBody({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}