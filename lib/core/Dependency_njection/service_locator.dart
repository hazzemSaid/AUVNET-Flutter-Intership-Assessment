import 'package:get_it/get_it.dart';
import 'package:ecommerce/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/viewmodel/bloc/Auth_bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator(Box authBox) async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  sl.registerLazySingleton<AuthRemoteDataSourceImpl>(
    () => AuthRemoteDataSourceImpl(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSourceImpl>(
    () => AuthLocalDataSourceImpl(authBox),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSourceImpl: sl(),
      localDataSourceImpl: sl(),
    ),
  );

  sl.registerFactory(() => AuthBloc(sl()));
}
