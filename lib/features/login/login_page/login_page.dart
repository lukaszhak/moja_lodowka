import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.4,
            fit: BoxFit.cover,
            image: AssetImage(
              'images/openfridge.jpg',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isCreatingAccount == true ? AppLocalizations.of(context)!.register : AppLocalizations.of(context)!.logIn,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                decoration: InputDecoration(hintText: AppLocalizations.of(context)!.password),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Color.fromARGB(255, 150, 10, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 51, 54)),
                onPressed: () async {
                  if (isCreatingAccount == true) {
                    // rejestracja
                    try {
                      await context.read<RootCubit>().createAccount(
                          email: widget.emailController.text,
                          password: widget.passwordController.text);
                    } on FirebaseAuthException catch (error) {
                      setState(() {
                        errorMessage = 'Error: ${error.message}';
                      });
                    }
                  } else {
                    // logowanie
                    try {
                      await context.read<RootCubit>().logIn(
                          email: widget.emailController.text,
                          password: widget.passwordController.text);
                    } on FirebaseAuthException catch (error) {
                      setState(() {
                        errorMessage = 'Error: ${error.message}';
                      });
                    }
                  }
                },
                child: Text(isCreatingAccount == true
                    ? AppLocalizations.of(context)!.register
                    : AppLocalizations.of(context)!.logIn),
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
                  child: Text(
                    AppLocalizations.of(context)!.makeAnAccount,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 51, 54)),
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
                  child:  Text(
                    AppLocalizations.of(context)!.alreadyHaveAnAccount,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 51, 54)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
