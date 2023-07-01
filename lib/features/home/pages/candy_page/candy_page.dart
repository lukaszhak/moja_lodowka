import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/candy_add_page/candy_add_page.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/cubit/candy_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/widgets/candy_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/widgets/candy_page_body.dart';
import 'package:provider/provider.dart';

class CandyPage extends StatelessWidget {
  const CandyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CandyPageCubit>(),
      child: BlocBuilder<CandyPageCubit, CandyPageState>(
        builder: (context, state) {
          final int notificationId = UniqueKey().hashCode;
          return Scaffold(
            appBar: const CandyPageAppBar(),
            backgroundColor: const Color.fromARGB(255, 250, 252, 250),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              onPressed: () {
                context
                    .read<CandyPageCubit>()
                    .generateNotificationId(notificationId);
                AppRouter().navigateToPage(
                  Provider<int>(
                    create: (context) => notificationId,
                    child: CandyAddPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
            body: const CandyPageBody(),
          );
        },
      ),
    );
  }
}
