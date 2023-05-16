import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/cubit/drug_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/widgets/drug_page_item.dart';

class DrugPageBody extends StatelessWidget {
  const DrugPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.4,
          fit: BoxFit.cover,
          image: AssetImage(
            'images/medicine.jpg',
          ),
        ),
      ),
      child: BlocProvider(
        create: (context) => getIt<DrugPageCubit>()..start(),
        child: BlocBuilder<DrugPageCubit, DrugPageState>(
          builder: (context, state) {
            final documentModels = state.documents;
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial State'),
                );
              case Status.loading:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: Color.fromARGB(255, 0, 37, 2),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        AppLocalizations.of(context)!.loading,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              case Status.success:
                if (state.documents.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.noMedications,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  );
                }
                return ListView(
                  children: [
                    const SizedBox(height: 10),
                    for (final documentModel in documentModels) ...[
                      Dismissible(
                          key: ValueKey(documentModel.id),
                          onDismissed: (_) {
                            context
                                .read<DrugPageCubit>()
                                .cancelNotification(documentModel.notificationId);
                            context
                                .read<DrugPageCubit>()
                                .delete(document: documentModel.id)
                                .whenComplete(
                                  () => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      backgroundColor:
                                          const Color.fromARGB(255, 0, 51, 54),
                                      content: Text(
                                          AppLocalizations.of(context)!
                                              .deleteInfo),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  ),
                                );
                          },
                          child: DrugPageItem(
                            documentModel: documentModel,
                          )),
                    ],
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
