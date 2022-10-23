import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:moja_lodowka/data/remote_data_sources/candy_remote_data_source/candy_remote_data_source.dart';
import 'package:moja_lodowka/data/remote_data_sources/drink_remote_data_source/drink_remote_data_source.dart';
import 'package:moja_lodowka/data/remote_data_sources/drug_remote_data_source/drug_remote_data_source.dart';
import 'package:moja_lodowka/data/remote_data_sources/fridge_remote_data_source/fridge_remote_data_source.dart';
import 'package:moja_lodowka/data/remote_data_sources/longdate_remote_data_source/longdate_remote_data_source.dart';
import 'package:moja_lodowka/data/remote_data_sources/menu_remote_data_source/menu_remote_data_source.dart';
import 'package:moja_lodowka/data/remote_data_sources/root_remote_data_source/root_remote_data_source.dart';
import 'package:moja_lodowka/data/remote_data_sources/shoplist_remote_data_source/shoplist_remote_data_source.dart';
import 'package:moja_lodowka/data/remote_data_sources/weather_remote_data_source/weather_remote_data_source.dart';
import 'package:moja_lodowka/domain/repositories/candy_documents_repository/candy_documents_repository.dart';
import 'package:moja_lodowka/domain/repositories/drink_documents_repository/drink_documents_repository.dart';
import 'package:moja_lodowka/domain/repositories/drug_documents_repository/drug_documents_repository.dart';
import 'package:moja_lodowka/domain/repositories/fridge_documents_repository/fridge_documents_repository.dart';
import 'package:moja_lodowka/domain/repositories/longdate_documents_repository/longdate_documents_repository.dart';
import 'package:moja_lodowka/domain/repositories/menu_documents_repository/menu_documents_repository.dart';
import 'package:moja_lodowka/domain/repositories/root_repository/root_repository.dart';
import 'package:moja_lodowka/domain/repositories/shoplist_documents_repository/shoplist_documents_repository.dart';
import 'package:moja_lodowka/domain/repositories/weather_repository/weather_repository.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/cubit/candy_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/cubit/drink_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/cubit/drug_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/cubit/fridge_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/cubit/longdate_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/weather_page/cubit/weather_page_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Bloc
  getIt.registerFactory(() => RootCubit(getIt()));
  getIt.registerFactory(() => CandyPageCubit(getIt()));
  getIt.registerFactory(() => DrinkPageCubit(getIt()));
  getIt.registerFactory(() => DrugPageCubit(getIt()));
  getIt.registerFactory(() => FridgePageCubit(getIt()));
  getIt.registerFactory(() => LongDatePageCubit(getIt()));
  getIt.registerFactory(() => MenuPageCubit(getIt()));
  getIt.registerFactory(() => ShopListPageCubit(getIt()));
  getIt.registerFactory(() => WeatherPageCubit(getIt()));
  // Repositories
  getIt.registerFactory(() => RootRepository(getIt()));
  getIt.registerFactory(() => CandyDocumentsRepository(getIt()));
  getIt.registerFactory(() => DrinkDocumentsRepository(getIt()));
  getIt.registerFactory(() => DrugDocumentsRepository(getIt()));
  getIt.registerFactory(() => FridgeDocumentsRepository(getIt()));
  getIt.registerFactory(() => LongDateDocumentsRepository(getIt()));
  getIt.registerFactory(() => MenuDocumentsRepository(getIt()));
  getIt.registerFactory(() => ShopListDocumentsRepository(getIt()));
  getIt.registerFactory(() => WeatherRepository(getIt()));
  // Data Sources
  getIt.registerFactory(() => RootRemoteDataSource());
  getIt.registerFactory(() => CandyRemoteDataSource());
  getIt.registerFactory(() => DrinkRemoteDataSource());
  getIt.registerFactory(() => DrugRemoteDataSource());
  getIt.registerFactory(() => FridgeRemoteDataSource());
  getIt.registerFactory(() => LongDateRemoteDataSource());
  getIt.registerFactory(() => MenuRemoteDataSource());
  getIt.registerFactory(() => ShopListRemoteDataSource());
  getIt.registerFactory(() => WeatherRemoteRetrofitDataSource(Dio()));
}
