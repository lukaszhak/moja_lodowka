import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/features/home/root_page/root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isLogIn = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (isLogIn == true) {
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
                        'Jesteś zalogowany jako ${widget.user.email}',
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
                          FirebaseAuth.instance.signOut();
                          setState(() {
                            isLogIn = false;
                          });
                        },
                        child: const Text('Wyloguj'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return RootPage();
        },
      ),
    );
  }
}
