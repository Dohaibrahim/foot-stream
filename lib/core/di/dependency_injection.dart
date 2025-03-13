import 'package:foot_stream/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:foot_stream/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
}
