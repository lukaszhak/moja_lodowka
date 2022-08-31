import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 154, 247, 157),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.4,
                fit: BoxFit.cover,
                image: AssetImage('images/food.jpg'))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Jesteś zalogowany jako $email',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 63, 2)),
                onPressed: () {
                  context.read<RootCubit>().signOut();
                  Navigator.of(context).pop();
                },
                child: const Text('Wyloguj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
