import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:moja_lodowka/features/login/login_page/login_page.dart';

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
                                primary: const Color.fromARGB(255, 0, 51, 54)),
                            child: const Text('Nie'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<RootCubit>()
                                  .deleteAccount()
                                  .whenComplete(() => Navigator.of(context)
                                      .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RootPage()),
                                          (Route<dynamic> route) => false));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 0, 51, 54)),
                            child: const Text('Tak'),
                          ),
                        ],
                        title: const Text('Czy napewno chcesz usunąć konto?'),
                      ));
            },
            icon: const Icon(Icons.delete),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        toolbarHeight: 50,
        title: const Text(
          'Moje Konto',
          style: TextStyle(fontSize: 23),
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
                    primary: const Color.fromARGB(255, 0, 51, 54)),
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
