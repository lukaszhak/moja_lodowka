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
      appBar: AppBar(
        backgroundColor: Colors.green,
        toolbarHeight: 50,
        title: const Text(
          'Moje Konto',
          style: TextStyle(fontSize: 23),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 154, 247, 157),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.4,
                fit: BoxFit.cover,
                image: AssetImage('images/food.jpg'))),
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
              const Text(
                'Jesteś zalogowany jako',
                style: TextStyle(
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
                    primary: const Color.fromARGB(255, 0, 63, 2)),
                onPressed: () {
                  context.read<RootCubit>().signOut();
                  Navigator.of(context).pop();
                },
                child: const Text('Wyloguj się'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
