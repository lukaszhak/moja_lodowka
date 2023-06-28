import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/shoplist_moveto_page.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/widgets/shoplist_page_item.dart';

class ShopListPageBody extends StatelessWidget {
  const ShopListPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.6,
          fit: BoxFit.cover,
          image: AssetImage('images/zakupy.jpg'),
        ),
      ),
      child: BlocProvider(
        create: (context) => getIt<ShopListPageCubit>()..start(),
        child: BlocBuilder<ShopListPageCubit, ShopListPageState>(
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
                      AppLocalizations.of(context)!.emptyShopList,
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
                            AppRouter().navigateToPage(
                              ShopListMoveToPage(documentModel: documentModel),
                            );
                          },
                          child:
                              ShoppingListItem(documentModel: documentModel)),
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
