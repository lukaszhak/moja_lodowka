import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/main.dart';

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

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
            final user = snapshot.data;
            if (user == null) {
              return Scaffold(
                body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.4,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/food.jpg',
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isCreatingAccount == true
                              ? 'Zarejestruj się'
                              : 'Zaloguj się',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: widget.emailController,
                          decoration: const InputDecoration(hintText: 'E-mail'),
                        ),
                        TextField(
                          controller: widget.passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(hintText: 'Hasło'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(errorMessage),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 0, 80, 3)),
                          onPressed: () async {
                            if (isCreatingAccount == true) {
                              // rejestracja
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: widget.emailController.text,
                                        password:
                                            widget.passwordController.text);
                              } catch (error) {
                                setState(() {
                                  errorMessage = error.toString();
                                });
                              }
                            } else {
                              // logowanie
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: widget.emailController.text,
                                        password:
                                            widget.passwordController.text);
                              } catch (error) {
                                setState(() {
                                  errorMessage = error.toString();
                                });
                              }
                            }
                          },
                          child: Text(isCreatingAccount == true
                              ? 'Zarejestruj się'
                              : 'Zaloguj się'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (isCreatingAccount == false) ...[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isCreatingAccount = true;
                              });
                            },
                            child: const Text(
                              'Utwórz konto',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 0, 58, 2)),
                            ),
                          ),
                        ],
                        if (isCreatingAccount == true) ...[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isCreatingAccount = false;
                              });
                            },
                            child: const Text(
                              'Masz już konto?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 0, 58, 2)),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }
            return FirstPage(user: user);
          }),
    );
  }
}

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
            }));
  }
}
