// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moja_lodowka/app/cubit/root_cubit.dart' as _i25;
import 'package:moja_lodowka/app/injection_container.dart' as _i31;
import 'package:moja_lodowka/data/remote_data_sources/candy_remote_data_source/candy_remote_data_source.dart'
    as _i3;
import 'package:moja_lodowka/data/remote_data_sources/drink_remote_data_source/drink_remote_data_source.dart'
    as _i4;
import 'package:moja_lodowka/data/remote_data_sources/drug_remote_data_source/drug_remote_data_source.dart'
    as _i5;
import 'package:moja_lodowka/data/remote_data_sources/fridge_remote_data_source/fridge_remote_data_source.dart'
    as _i6;
import 'package:moja_lodowka/data/remote_data_sources/longdate_remote_data_source/longdate_remote_data_source.dart'
    as _i7;
import 'package:moja_lodowka/data/remote_data_sources/menu_remote_data_source/menu_remote_data_source.dart'
    as _i8;
import 'package:moja_lodowka/data/remote_data_sources/root_remote_data_source/root_remote_data_source.dart'
    as _i9;
import 'package:moja_lodowka/data/remote_data_sources/shoplist_remote_data_source/shoplist_remote_data_source.dart'
    as _i11;
import 'package:moja_lodowka/data/remote_data_sources/weather_remote_data_source/weather_remote_data_source.dart'
    as _i28;
import 'package:moja_lodowka/domain/repositories/candy_documents_repository/candy_documents_repository.dart'
    as _i12;
import 'package:moja_lodowka/domain/repositories/drink_documents_repository/drink_documents_repository.dart'
    as _i15;
import 'package:moja_lodowka/domain/repositories/drug_documents_repository/drug_documents_repository.dart'
    as _i17;
import 'package:moja_lodowka/domain/repositories/fridge_documents_repository/fridge_documents_repository.dart'
    as _i19;
import 'package:moja_lodowka/domain/repositories/longdate_documents_repository/longdate_documents_repository.dart'
    as _i21;
import 'package:moja_lodowka/domain/repositories/menu_documents_repository/menu_documents_repository.dart'
    as _i23;
import 'package:moja_lodowka/domain/repositories/root_repository/root_repository.dart'
    as _i10;
import 'package:moja_lodowka/domain/repositories/shoplist_documents_repository/shoplist_documents_repository.dart'
    as _i26;
import 'package:moja_lodowka/domain/repositories/weather_repository/weather_repository.dart'
    as _i29;
import 'package:moja_lodowka/features/home/pages/candy_page/cubit/candy_page_cubit.dart'
    as _i13;
import 'package:moja_lodowka/features/home/pages/drink_page/cubit/drink_page_cubit.dart'
    as _i16;
import 'package:moja_lodowka/features/home/pages/drug_page/cubit/drug_page_cubit.dart'
    as _i18;
import 'package:moja_lodowka/features/home/pages/fridge_page/cubit/fridge_page_cubit.dart'
    as _i20;
import 'package:moja_lodowka/features/home/pages/longdate_page/cubit/longdate_page_cubit.dart'
    as _i22;
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart'
    as _i24;
import 'package:moja_lodowka/features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart'
    as _i27;
import 'package:moja_lodowka/features/home/pages/weather_page/cubit/weather_page_cubit.dart'
    as _i30; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
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
        () => _i10.RootRepository(gh<_i9.RootRemoteDataSource>()));
    gh.factory<_i11.ShopListRemoteDataSource>(
        () => _i11.ShopListRemoteDataSource());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i12.CandyDocumentsRepository>(
        () => _i12.CandyDocumentsRepository(gh<_i3.CandyRemoteDataSource>()));
    gh.factory<_i13.CandyPageCubit>(
        () => _i13.CandyPageCubit(gh<_i12.CandyDocumentsRepository>()));
    gh.lazySingleton<_i14.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i15.DrinkDocumentsRepository>(
        () => _i15.DrinkDocumentsRepository(gh<_i4.DrinkRemoteDataSource>()));
    gh.factory<_i16.DrinkPageCubit>(
        () => _i16.DrinkPageCubit(gh<_i15.DrinkDocumentsRepository>()));
    gh.factory<_i17.DrugDocumentsRepository>(
        () => _i17.DrugDocumentsRepository(gh<_i5.DrugRemoteDataSource>()));
    gh.factory<_i18.DrugPageCubit>(
        () => _i18.DrugPageCubit(gh<_i17.DrugDocumentsRepository>()));
    gh.factory<_i19.FridgeDocumentsRepository>(
        () => _i19.FridgeDocumentsRepository(gh<_i6.FridgeRemoteDataSource>()));
    gh.factory<_i20.FridgePageCubit>(
        () => _i20.FridgePageCubit(gh<_i19.FridgeDocumentsRepository>()));
    gh.factory<_i21.LongDateDocumentsRepository>(() =>
        _i21.LongDateDocumentsRepository(gh<_i7.LongDateRemoteDataSource>()));
    gh.factory<_i22.LongDatePageCubit>(
        () => _i22.LongDatePageCubit(gh<_i21.LongDateDocumentsRepository>()));
    gh.factory<_i23.MenuDocumentsRepository>(
        () => _i23.MenuDocumentsRepository(gh<_i8.MenuRemoteDataSource>()));
    gh.factory<_i24.MenuPageCubit>(
        () => _i24.MenuPageCubit(gh<_i23.MenuDocumentsRepository>()));
    gh.factory<_i25.RootCubit>(() => _i25.RootCubit(gh<_i10.RootRepository>()));
    gh.factory<_i26.ShopListDocumentsRepository>(() =>
        _i26.ShopListDocumentsRepository(gh<_i11.ShopListRemoteDataSource>()));
    gh.factory<_i27.ShopListPageCubit>(
        () => _i27.ShopListPageCubit(gh<_i26.ShopListDocumentsRepository>()));
    gh.factory<_i28.WeatherRemoteRetrofitDataSource>(
        () => _i28.WeatherRemoteRetrofitDataSource(gh<_i14.Dio>()));
    gh.factory<_i29.WeatherRepository>(() =>
        _i29.WeatherRepository(gh<_i28.WeatherRemoteRetrofitDataSource>()));
    gh.factory<_i30.WeatherPageCubit>(
        () => _i30.WeatherPageCubit(gh<_i29.WeatherRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i31.RegisterModule {}
