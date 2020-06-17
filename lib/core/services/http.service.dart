import 'package:dio/dio.dart';
import 'package:quranapp/core/environment.dart';
import 'package:quranapp/core/interceptors/logger.interceptor.dart';

BaseOptions options = BaseOptions(
  baseUrl: environement['apiUrl'],
  receiveTimeout: 300000,
  connectTimeout: 100000,
);

Dio dio = new Dio(options);

void setupInterceptors() {
  // Interceptors
  dio.interceptors.add(LoggerInterceptor());
}
