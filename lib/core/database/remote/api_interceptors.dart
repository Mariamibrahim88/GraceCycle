import 'package:dio/dio.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
// import 'package:grace_cycle/core/database/local/cache_helper.dart';
// import 'package:grace_cycle/core/database/remote/end_points.dart';
// import 'package:grace_cycle/core/service/service_locator.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.contentType] = ApiKeys.applicationJson;
    // options.headers[ApiKeys.token] =
    //     sl<CacheHelper>().getData(key: ApiKeys.token) != null
    //         ? 'FOODAPI ${sl<CacheHelper>().getData(key: ApiKeys.token)}'
    //         : null;

    super.onRequest(options, handler);
  }
}
