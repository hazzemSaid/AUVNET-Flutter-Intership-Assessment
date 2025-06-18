import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/viewmodel/bloc/Auth_bloc/auth_bloc.dart';
import 'package:ecommerce/features/home/data/datasources/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/repository/home_repository_impl.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:ecommerce/features/home/domain/usecases/get_restaurants.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator(Box authBox) async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

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

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceFirebaseImpl(sl()),
  );
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerLazySingleton(() => Getrestaurants(sl()));
  sl.registerFactory(() => HomeBloc(sl()));
}
