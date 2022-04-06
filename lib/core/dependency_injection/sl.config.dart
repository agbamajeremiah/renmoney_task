// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;

import '../../features/transaction/data/datasources/transaction_remote_datasource.dart'
    as _i5;
import '../core.dart' as _i6;
import '../network/network_info.dart' as _i4;
import 'register_module.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i4.NetworkInfo>(
      () => _i4.NetworkInfoImpl(get<_i3.InternetConnectionChecker>()));
  gh.lazySingleton<_i5.TransactionRemoteDataSource>(() =>
      _i5.TransactionRemoteDataSourceImpl(
          networkInfo: get<_i6.NetworkInfo>(), dio: get<_i7.Dio>()));
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
