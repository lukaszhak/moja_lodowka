// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote_data_sources/candy_remote_data_source/candy_remote_data_source.dart'
    as _i3;
import '../data/remote_data_sources/drink_remote_data_source/drink_remote_data_source.dart'
    as _i4;
import '../data/remote_data_sources/drug_remote_data_source/drug_remote_data_source.dart'
    as _i5;
import '../data/remote_data_sources/fridge_remote_data_source/fridge_remote_data_source.dart'
    as _i6;
import '../data/remote_data_sources/longdate_remote_data_source/longdate_remote_data_source.dart'
    as _i7;
import '../data/remote_data_sources/menu_remote_data_source/menu_remote_data_source.dart'
    as _i8;
import '../data/remote_data_sources/root_remote_data_source/root_remote_data_source.dart'
    as _i9;
import '../data/remote_data_sources/shoplist_remote_data_source/shoplist_remote_data_source.dart'
    as _i11;
import '../data/remote_data_sources/weather_remote_data_source/weather_remote_data_source.dart'
    as _i28;
import '../domain/repositories/candy_documents_repository/candy_documents_repository.dart'
    as _i12;
import '../domain/repositories/drink_documents_repository/drink_documents_repository.dart'
    as _i15;
import '../domain/repositories/drug_documents_repository/drug_documents_repository.dart'
    as _i17;
import '../domain/repositories/fridge_documents_repository/fridge_documents_repository.dart'
    as _i19;
import '../domain/repositories/longdate_documents_repository/longdate_documents_repository.dart'
    as _i21;
import '../domain/repositories/menu_documents_repository/menu_documents_repository.dart'
    as _i23;
import '../domain/repositories/root_repository/root_repository.dart' as _i10;
import '../domain/repositories/shoplist_documents_repository/shoplist_documents_repository.dart'
    as _i26;
import '../domain/repositories/weather_repository/weather_repository.dart'
    as _i29;
import '../features/home/pages/candy_page/cubit/candy_page_cubit.dart' as _i13;
import '../features/home/pages/drink_page/cubit/drink_page_cubit.dart' as _i16;
import '../features/home/pages/drug_page/cubit/drug_page_cubit.dart' as _i18;
import '../features/home/pages/fridge_page/cubit/fridge_page_cubit.dart'
    as _i20;
import '../features/home/pages/longdate_page/cubit/longdate_page_cubit.dart'
    as _i22;
import '../features/home/pages/menu_page/cubit/menu_page_cubit.dart' as _i24;
import '../features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart'
    as _i27;
import '../features/home/pages/weather_page/cubit/weather_page_cubit.dart'
    as _i30;
import 'cubit/root_cubit.dart' as _i25;
import 'injection_container.dart'
    as _i31; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.CandyRemoteDataSource>(() => _i3.CandyRemoteDataSource());
  gh.factory<_i4.DrinkRemoteDataSource>(() => _i4.DrinkRemoteDataSource());
  gh.factory<_i5.DrugRemoteDataSource>(() => _i5.DrugRemoteDataSource());
  gh.factory<_i6.FridgeRemoteDataSource>(() => _i6.FridgeRemoteDataSource());
  gh.factory<_i7.LongDateRemoteDataSource>(
      () => _i7.LongDateRemoteDataSource());
  gh.factory<_i8.MenuRemoteDataSource>(() => _i8.MenuRemoteDataSource());
  gh.factory<_i9.RootRemoteDataSource>(() => _i9.RootRemoteDataSource());
  gh.factory<_i10.RootRepository>(
      () => _i10.RootRepository(get<_i9.RootRemoteDataSource>()));
  gh.factory<_i11.ShopListRemoteDataSource>(
      () => _i11.ShopListRemoteDataSource());
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i12.CandyDocumentsRepository>(
      () => _i12.CandyDocumentsRepository(get<_i3.CandyRemoteDataSource>()));
  gh.factory<_i13.CandyPageCubit>(
      () => _i13.CandyPageCubit(get<_i12.CandyDocumentsRepository>()));
  gh.lazySingleton<_i14.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i15.DrinkDocumentsRepository>(
      () => _i15.DrinkDocumentsRepository(get<_i4.DrinkRemoteDataSource>()));
  gh.factory<_i16.DrinkPageCubit>(
      () => _i16.DrinkPageCubit(get<_i15.DrinkDocumentsRepository>()));
  gh.factory<_i17.DrugDocumentsRepository>(
      () => _i17.DrugDocumentsRepository(get<_i5.DrugRemoteDataSource>()));
  gh.factory<_i18.DrugPageCubit>(
      () => _i18.DrugPageCubit(get<_i17.DrugDocumentsRepository>()));
  gh.factory<_i19.FridgeDocumentsRepository>(
      () => _i19.FridgeDocumentsRepository(get<_i6.FridgeRemoteDataSource>()));
  gh.factory<_i20.FridgePageCubit>(
      () => _i20.FridgePageCubit(get<_i19.FridgeDocumentsRepository>()));
  gh.factory<_i21.LongDateDocumentsRepository>(() =>
      _i21.LongDateDocumentsRepository(get<_i7.LongDateRemoteDataSource>()));
  gh.factory<_i22.LongDatePageCubit>(
      () => _i22.LongDatePageCubit(get<_i21.LongDateDocumentsRepository>()));
  gh.factory<_i23.MenuDocumentsRepository>(
      () => _i23.MenuDocumentsRepository(get<_i8.MenuRemoteDataSource>()));
  gh.factory<_i24.MenuPageCubit>(
      () => _i24.MenuPageCubit(get<_i23.MenuDocumentsRepository>()));
  gh.factory<_i25.RootCubit>(() => _i25.RootCubit(get<_i10.RootRepository>()));
  gh.factory<_i26.ShopListDocumentsRepository>(() =>
      _i26.ShopListDocumentsRepository(get<_i11.ShopListRemoteDataSource>()));
  gh.factory<_i27.ShopListPageCubit>(
      () => _i27.ShopListPageCubit(get<_i26.ShopListDocumentsRepository>()));
  gh.factory<_i28.WeatherRemoteRetrofitDataSource>(
      () => _i28.WeatherRemoteRetrofitDataSource(get<_i14.Dio>()));
  gh.factory<_i29.WeatherRepository>(() =>
      _i29.WeatherRepository(get<_i28.WeatherRemoteRetrofitDataSource>()));
  gh.factory<_i30.WeatherPageCubit>(
      () => _i30.WeatherPageCubit(get<_i29.WeatherRepository>()));
  return get;
}

class _$RegisterModule extends _i31.RegisterModule {}
