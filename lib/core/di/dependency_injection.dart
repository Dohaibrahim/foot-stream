import 'package:foot_stream/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:foot_stream/features/auth/domain/repo/auth_repo.dart';
import 'package:foot_stream/features/home/data/data_source/match_remote_data_souce.dart';
import 'package:foot_stream/features/home/domain/repo/match_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<MatchRemoteDataSouce>(MatchRemoteDataSouce());
  getIt.registerSingleton<MatchRepoImpl>(MatchRepoImpl());
}
