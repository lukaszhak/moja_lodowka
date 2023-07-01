import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/cubit/fridge_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/fridge_add_page/fridge_add_page.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/widgets/fridge_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/widgets/fridge_page_body.dart';
import 'package:provider/provider.dart';

class FridgePage extends StatelessWidget {
  const FridgePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FridgePageCubit>(),
      child: BlocBuilder<FridgePageCubit, FridgePageState>(
        builder: (context, state) {
          final int notificationId = UniqueKey().hashCode;
          return Scaffold(
            appBar: const FridgePageAppBar(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              onPressed: () {
                context
                    .read<FridgePageCubit>()
                    .generateNotificationId(notificationId);
                AppRouter().navigateToPage(
                  Provider<int>(
                    create: (context) => notificationId,
                    child: const FridgeAddPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 250, 252, 250),
            body: const FridgePageBody(),
          );
        },
      ),
    );
  }
}
