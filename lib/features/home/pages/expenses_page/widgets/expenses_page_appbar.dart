import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/data/remote_data_sources/expenses_remote_data_source/expenses_remote_data_source.dart';
import 'package:moja_lodowka/domain/repositories/expenses_documents_repository/expenses_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';

class ExpensesPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExpensesPageAppBar({
    super.key,
    required this.controller,
  });
  
  @override
  Size get preferredSize => const Size.fromHeight(50);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 0, 51, 54),
      title: const Text(
        'Moje wydatki',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => ExpensesPageCubit(
                    ExpensesDocumentsRepository(
                      ExpensesRemoteDataSource(),
                    ),
                  ),
                  child:
                      BlocBuilder<ExpensesPageCubit, ExpensesPageState>(
                    builder: (context, state) {
                      return AlertDialog(
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 51, 54),
                            ),
                            child: const Text('Cofnij'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ExpensesPageCubit>()
                                  .addDoc(controller.text);
                              controller.clear();
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 51, 54),
                            ),
                            child: const Text('Dodaj'),
                          )
                        ],
                        title: const Text('Dodaj kategorię'),
                        content: TextField(
                          autofocus: true,
                          textCapitalization:
                              TextCapitalization.sentences,
                          controller: controller,
                          decoration: const InputDecoration(
                              hintText: 'Wpisz kategorię'),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
