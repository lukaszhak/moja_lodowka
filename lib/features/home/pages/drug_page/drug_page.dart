import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/cubit/drug_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/drug_add_page/drug_add_page.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/widgets/drug_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/widgets/drug_page_body.dart';
import 'package:provider/provider.dart';

class DrugPage extends StatelessWidget {
  const DrugPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DrugPageCubit>(),
      child: BlocBuilder<DrugPageCubit, DrugPageState>(
        builder: (context, state) {
          final int notificationId = UniqueKey().hashCode;
          return Scaffold(
            appBar: const DrugPageAppBar(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              onPressed: () {
                context.read<DrugPageCubit>().generateNotificationId(notificationId);
                AppRouter().navigateToPage(
                  Provider<int>(
                    create: (context) => notificationId,
                    child: const DrugAddPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 250, 252, 250),
            body: const DrugPageBody(),
          );
        },
      ),
    );
  }
}
