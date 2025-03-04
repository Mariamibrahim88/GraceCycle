import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/dio_consumer.dart';
import 'package:grace_cycle/features/Authentication/data/repos/forget_pass_repo.dart';
import 'package:grace_cycle/features/Authentication/data/repos/register_repo.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/register_cubit/register_cubit.dart';
import 'package:grace_cycle/features/Authentication/data/repos/login_repo.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/login_cubit/login_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  //sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => RegisterRepo());
  sl.registerLazySingleton(() => ForgetPassRepo());
  //sl.registerSingleton(() => RegisterCubit(sl()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl<RegisterRepo>()));
  sl.registerLazySingleton(() => LoginRepo());
  //sl.registerSingleton<ApiService>(ApiService(Dio()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl<LoginRepo>()));
  sl.registerFactory<ForgetPassCubit>(
      () => ForgetPassCubit(sl<ForgetPassRepo>()));
}
