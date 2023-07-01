import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/cubit/longdate_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/longdate_add_page/longdate_add_page.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/widgets/longdate_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/widgets/longdate_page_body.dart';
import 'package:provider/provider.dart';

class LongDatePage extends StatelessWidget {
  const LongDatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LongDatePageCubit>(),
      child: BlocBuilder<LongDatePageCubit, LongDatePageState>(
        builder: (context, state) {
          final int notificationId = UniqueKey().hashCode;
          return Scaffold(
            appBar: const LongDatePageAppBar(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              onPressed: () {
                context
                    .read<LongDatePageCubit>()
                    .generateNotificationId(notificationId);
                AppRouter().navigateToPage(
                  Provider<int>(
                    create: (context) => notificationId,
                    child: const LongDateAddPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 250, 252, 250),
            body: const LongPageBody(),
          );
        },
      ),
    );
  }
}
