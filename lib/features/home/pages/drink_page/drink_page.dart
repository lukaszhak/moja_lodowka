import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/cubit/drink_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/drink_add_page/drink_add_page.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/widgets/drink_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/widgets/drink_page_body.dart';
import 'package:provider/provider.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DrinkPageCubit>(),
      child: BlocBuilder<DrinkPageCubit, DrinkPageState>(
        builder: (context, state) {
          final int notificationId = UniqueKey().hashCode;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: const DrinkPageAppBar(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              onPressed: () {
                context
                    .read<DrinkPageCubit>()
                    .generateNotificationId(notificationId);
                AppRouter().navigateToPage(
                  Provider<int>(
                    create: (context) => notificationId,
                    child: const DrinkAddPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
            body: const DrinkPageBody(),
          );
        },
      ),
    );
  }
}
