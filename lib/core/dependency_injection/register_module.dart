import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// [RegisterModule] is used to register modules(for third party dependencies)
@module
abstract class RegisterModule {
  /// register [InternetConnectionChecker] package for checkning
  ///  internet connection
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
}
