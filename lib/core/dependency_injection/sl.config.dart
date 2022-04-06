// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import '../../features/transaction/data/datasources/transaction_remote_datasource.dart'
    as _i9;
import '../../features/transaction/data/repositories/transaction_repository_impl.dart'
    as _i11;
import '../../features/transaction/domain/usecases/get_transaction_usecase.dart'
    as _i12;
import '../../features/transaction/presentation/providers/transaction_provider.dart'
    as _i7;
import '../../features/transaction/transaction.dart' as _i8;
import '../core.dart' as _i10;
import '../network/network_info.dart' as _i6;
import '../utils/app_loading_pop_up.dart' as _i3;
import 'register_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppLoadingPopup>(() => _i3.AppLoadingPopup());
  gh.factory<_i4.Dio>(() => registerModule.dio);
  gh.factory<_i5.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  gh.lazySingleton<_i7.TransactionProvider>(() => _i7.TransactionProvider(
      getTransactionsUsecase: get<_i8.GetTransactionsUsecase>()));
  gh.lazySingleton<_i9.TransactionRemoteDataSource>(() =>
      _i9.TransactionRemoteDataSourceImpl(
          networkInfo: get<_i10.NetworkInfo>(), dio: get<_i4.Dio>()));
  gh.lazySingleton<_i8.TransactionRepository>(() =>
      _i11.TransactionRepositoryImpl(get<_i8.TransactionRemoteDataSource>()));
  gh.lazySingleton<_i12.GetTransactionsUsecase>(
      () => _i12.GetTransactionsUsecase(get<_i8.TransactionRepository>()));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
