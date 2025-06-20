import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grace_cycle/core/database/local/cache_helper.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/dio_consumer.dart';
import 'package:grace_cycle/features/Authentication/data/repos/forget_pass_repo.dart';
import 'package:grace_cycle/features/Authentication/data/repos/register_repo.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/register_cubit/register_cubit.dart';
import 'package:grace_cycle/features/Authentication/data/repos/login_repo.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:grace_cycle/features/cart/data/repos/cart_repo.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/details/data/repos/details_repo.dart';
import 'package:grace_cycle/features/details/presentation/manager/cubit/details_cubit.dart';
import 'package:grace_cycle/features/discover/data/repos/discover_repo.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/favorites/data/repos/fav_repo.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';
import 'package:grace_cycle/features/home/data/repos/home_repo.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => RegisterRepo());
  sl.registerLazySingleton(() => HomeRepo());
  sl.registerLazySingleton(() => ForgetPassRepo());
  sl.registerLazySingleton(() => FavRepo());
  sl.registerLazySingleton(() => DiscoverRepo());
  sl.registerLazySingleton(() => DetailsRepo());
  sl.registerLazySingleton(() => CartRepo());

  //sl.registerSingleton(() => RegisterCubit(sl()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl<RegisterRepo>()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl<HomeRepo>()));
  sl.registerFactory<GetFavCubit>(() => GetFavCubit(sl<FavRepo>()));
  sl.registerFactory<DiscoverCubit>(() => DiscoverCubit(sl<DiscoverRepo>()));
  sl.registerSingleton(() => DetailsCubit(sl<DetailsRepo>()));
  sl.registerLazySingleton(() => LoginRepo());
  //sl.registerSingleton<ApiService>(ApiService(Dio()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl<LoginRepo>()));
  sl.registerFactory<ForgetPassCubit>(
      () => ForgetPassCubit(sl<ForgetPassRepo>()));
  sl.registerFactory<CartCubit>(() =>CartCubit(sl<CartRepo>()));
}
