// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moja_lodowka/app/cubit/root_cubit.dart' as _i28;
import 'package:moja_lodowka/app/injection_container.dart' as _i34;
import 'package:moja_lodowka/data/remote_data_sources/candy_remote_data_source/candy_remote_data_source.dart'
    as _i3;
import 'package:moja_lodowka/data/remote_data_sources/drink_remote_data_source/drink_remote_data_source.dart'
    as _i4;
import 'package:moja_lodowka/data/remote_data_sources/drug_remote_data_source/drug_remote_data_source.dart'
    as _i5;
import 'package:moja_lodowka/data/remote_data_sources/expenses_remote_data_source/expenses_remote_data_source.dart'
    as _i6;
import 'package:moja_lodowka/data/remote_data_sources/fridge_remote_data_source/fridge_remote_data_source.dart'
    as _i7;
import 'package:moja_lodowka/data/remote_data_sources/longdate_remote_data_source/longdate_remote_data_source.dart'
    as _i8;
import 'package:moja_lodowka/data/remote_data_sources/menu_remote_data_source/menu_remote_data_source.dart'
    as _i9;
import 'package:moja_lodowka/data/remote_data_sources/root_remote_data_source/root_remote_data_source.dart'
    as _i10;
import 'package:moja_lodowka/data/remote_data_sources/shoplist_remote_data_source/shoplist_remote_data_source.dart'
    as _i12;
import 'package:moja_lodowka/data/remote_data_sources/weather_remote_data_source/weather_remote_data_source.dart'
    as _i31;
import 'package:moja_lodowka/domain/repositories/candy_documents_repository/candy_documents_repository.dart'
    as _i13;
import 'package:moja_lodowka/domain/repositories/drink_documents_repository/drink_documents_repository.dart'
    as _i16;
import 'package:moja_lodowka/domain/repositories/drug_documents_repository/drug_documents_repository.dart'
    as _i18;
import 'package:moja_lodowka/domain/repositories/expenses_documents_repository/expenses_documents_repository.dart'
    as _i20;
import 'package:moja_lodowka/domain/repositories/fridge_documents_repository/fridge_documents_repository.dart'
    as _i22;
import 'package:moja_lodowka/domain/repositories/longdate_documents_repository/longdate_documents_repository.dart'
    as _i24;
import 'package:moja_lodowka/domain/repositories/menu_documents_repository/menu_documents_repository.dart'
    as _i26;
import 'package:moja_lodowka/domain/repositories/root_repository/root_repository.dart'
    as _i11;
import 'package:moja_lodowka/domain/repositories/shoplist_documents_repository/shoplist_documents_repository.dart'
    as _i29;
import 'package:moja_lodowka/domain/repositories/weather_repository/weather_repository.dart'
    as _i32;
import 'package:moja_lodowka/features/home/pages/candy_page/cubit/candy_page_cubit.dart'
    as _i14;
import 'package:moja_lodowka/features/home/pages/drink_page/cubit/drink_page_cubit.dart'
    as _i17;
import 'package:moja_lodowka/features/home/pages/drug_page/cubit/drug_page_cubit.dart'
    as _i19;
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart'
    as _i21;
import 'package:moja_lodowka/features/home/pages/fridge_page/cubit/fridge_page_cubit.dart'
    as _i23;
import 'package:moja_lodowka/features/home/pages/longdate_page/cubit/longdate_page_cubit.dart'
    as _i25;
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart'
    as _i27;
import 'package:moja_lodowka/features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart'
    as _i30;
import 'package:moja_lodowka/features/home/pages/weather_page/cubit/weather_page_cubit.dart'
    as _i33; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i6.ExpensesRemoteDataSource>(
        () => _i6.ExpensesRemoteDataSource());
    gh.factory<_i7.FridgeRemoteDataSource>(() => _i7.FridgeRemoteDataSource());
    gh.factory<_i8.LongDateRemoteDataSource>(
        () => _i8.LongDateRemoteDataSource());
    gh.factory<_i9.MenuRemoteDataSource>(() => _i9.MenuRemoteDataSource());
    gh.factory<_i10.RootRemoteDataSource>(() => _i10.RootRemoteDataSource());
    gh.factory<_i11.RootRepository>(
        () => _i11.RootRepository(gh<_i10.RootRemoteDataSource>()));
    gh.factory<_i12.ShopListRemoteDataSource>(
        () => _i12.ShopListRemoteDataSource());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i13.CandyDocumentsRepository>(
        () => _i13.CandyDocumentsRepository(gh<_i3.CandyRemoteDataSource>()));
    gh.factory<_i14.CandyPageCubit>(
        () => _i14.CandyPageCubit(gh<_i13.CandyDocumentsRepository>()));
    gh.lazySingleton<_i15.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i16.DrinkDocumentsRepository>(
        () => _i16.DrinkDocumentsRepository(gh<_i4.DrinkRemoteDataSource>()));
    gh.factory<_i17.DrinkPageCubit>(
        () => _i17.DrinkPageCubit(gh<_i16.DrinkDocumentsRepository>()));
    gh.factory<_i18.DrugDocumentsRepository>(
        () => _i18.DrugDocumentsRepository(gh<_i5.DrugRemoteDataSource>()));
    gh.factory<_i19.DrugPageCubit>(
        () => _i19.DrugPageCubit(gh<_i18.DrugDocumentsRepository>()));
    gh.factory<_i20.ExpensesDocumentsRepository>(() =>
        _i20.ExpensesDocumentsRepository(gh<_i6.ExpensesRemoteDataSource>()));
    gh.factory<_i21.ExpensesPageCubit>(
        () => _i21.ExpensesPageCubit(gh<_i20.ExpensesDocumentsRepository>()));
    gh.factory<_i22.FridgeDocumentsRepository>(
        () => _i22.FridgeDocumentsRepository(gh<_i7.FridgeRemoteDataSource>()));
    gh.factory<_i23.FridgePageCubit>(
        () => _i23.FridgePageCubit(gh<_i22.FridgeDocumentsRepository>()));
    gh.factory<_i24.LongDateDocumentsRepository>(() =>
        _i24.LongDateDocumentsRepository(gh<_i8.LongDateRemoteDataSource>()));
    gh.factory<_i25.LongDatePageCubit>(
        () => _i25.LongDatePageCubit(gh<_i24.LongDateDocumentsRepository>()));
    gh.factory<_i26.MenuDocumentsRepository>(
        () => _i26.MenuDocumentsRepository(gh<_i9.MenuRemoteDataSource>()));
    gh.factory<_i27.MenuPageCubit>(
        () => _i27.MenuPageCubit(gh<_i26.MenuDocumentsRepository>()));
    gh.factory<_i28.RootCubit>(() => _i28.RootCubit(gh<_i11.RootRepository>()));
    gh.factory<_i29.ShopListDocumentsRepository>(() =>
        _i29.ShopListDocumentsRepository(gh<_i12.ShopListRemoteDataSource>()));
    gh.factory<_i30.ShopListPageCubit>(
        () => _i30.ShopListPageCubit(gh<_i29.ShopListDocumentsRepository>()));
    gh.factory<_i31.WeatherRemoteRetrofitDataSource>(
        () => _i31.WeatherRemoteRetrofitDataSource(gh<_i15.Dio>()));
    gh.factory<_i32.WeatherRepository>(() =>
        _i32.WeatherRepository(gh<_i31.WeatherRemoteRetrofitDataSource>()));
    gh.factory<_i33.WeatherPageCubit>(
        () => _i33.WeatherPageCubit(gh<_i32.WeatherRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i34.RegisterModule {}
