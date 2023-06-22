import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginPageBody extends StatelessWidget {
 LoginPageBody({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        return Container(
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
                  state.isCreatingAccount == true
                      ? AppLocalizations.of(context)!.register
                      : AppLocalizations.of(context)!.logIn,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: state.obscureText,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.password,
                      suffixIcon: IconButton(
                        color: Colors.black,
                        icon: Icon(state.obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          context
                              .read<RootCubit>()
                              .obscureText(state.obscureText);
                        },
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  state.errorMessage,
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
                      backgroundColor: const Color.fromARGB(255, 0, 51, 54)),
                  onPressed: () async {
                    if (state.isCreatingAccount == true) {
                      // rejestracja
                      try {
                        await context.read<RootCubit>().createAccount(
                            email: emailController.text,
                            password: passwordController.text);
                      } on FirebaseAuthException catch (error) {
                        context
                            .read<RootCubit>()
                            .showErrorMessage('Error: ${error.message!}');
                      }
                    } else {
                      // logowanie
                      try {
                        await context.read<RootCubit>().logIn(
                            email: emailController.text,
                            password: passwordController.text);
                      } on FirebaseAuthException catch (error) {
                        context
                            .read<RootCubit>()
                            .showErrorMessage('Error: ${error.message!}');
                      }
                    }
                  },
                  child: Text(state.isCreatingAccount == true
                      ? AppLocalizations.of(context)!.register
                      : AppLocalizations.of(context)!.logIn),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (state.isCreatingAccount == false) ...[
                  TextButton(
                    onPressed: () {
                      context
                          .read<RootCubit>()
                          .isCreatingAccount(state.isCreatingAccount);
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
                if (state.isCreatingAccount == true) ...[
                  TextButton(
                    onPressed: () {
                      context
                          .read<RootCubit>()
                          .isCreatingAccount(state.isCreatingAccount);
                    },
                    child: Text(
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
        );
      },
    );
  }
}