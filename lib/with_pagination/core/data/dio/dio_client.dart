// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../utils/local_storage_manager.dart';
// import '../../utils/shared_pref_keys.dart';
//
// class DioClient {
//   final String baseUrl;
//   Dio? _dio;
//   final List<Interceptor>? interceptors;
//   final String? appVersion;
//   final String? platForm ;
//   DioClient(
//       this.baseUrl,
//       Dio dio,  {
//         this.appVersion,
//         this.platForm,
//         this.interceptors,
//       }) {
//     _dio = dio;
//     _dio!
//       ..options.baseUrl = baseUrl
//       ..options.connectTimeout = const Duration(seconds: 60)
//       ..options.receiveTimeout = const Duration(seconds: 60)
//       ..httpClientAdapter
//       ..options.headers = {
//         'Content-Type': 'application/json; charset=UTF-8',
//       };
//     _dio!.interceptors.clear();
//     dio.interceptors
//         .add(InterceptorsWrapper(onRequest: (options, handler) async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       dynamic isEn =
//           await LocalStorageManager.readData(SharedPrefKeys.isEn) ?? false;
//       options.headers.addAll({
//         'X-Requested-With': 'XMLHttpRequest',
//         'Authorization': "Bearer ${prefs.getString("token")}",
//         'Accept-Language': isEn ? "en" : "bn",
//         // 'X-App-Version': AppAssets.info.version,
//         'X-Platform': Platform.isAndroid ? "android" : "ios",
//       });
//       return handler.next(options);
//     }, onResponse: (response, handler) {
//       return handler.next(response);
//     }, onError: (DioException e, handler) {
//       return handler.next(e);
//     }));
//
//   }
//
//   Future<dynamic> get(
//       String uri, {
//         Map<String, dynamic>? queryParameters,
//         Options? options,
//         CancelToken? cancelToken,
//         ProgressCallback? onReceiveProgress,
//       }) async {
//     try {
//       var response = await _dio!.get(
//         uri,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response.data;
//     } on SocketException catch (e) {
//       throw SocketException(e.toString());
//     } on FormatException catch (_) {
//       throw const FormatException("Unable to process the data");
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<dynamic> post(
//       String uri, {
//         data,
//         Map<String, dynamic>? queryParameters,
//         Options? options,
//         CancelToken? cancelToken,
//         ProgressCallback? onSendProgress,
//         ProgressCallback? onReceiveProgress,
//       }) async {
//     try {
//       var response = await _dio!.post(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response.data;
//     } on FormatException catch (_) {
//       throw const FormatException("Unable to process the data");
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<dynamic> patch(
//       String uri, {
//         data,
//         Map<String, dynamic>? queryParameters,
//         Options? options,
//         CancelToken? cancelToken,
//         ProgressCallback? onSendProgress,
//         ProgressCallback? onReceiveProgress,
//       }) async {
//     try {
//       var response = await _dio!.patch(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response.data;
//     } on FormatException catch (_) {
//       throw const FormatException("Unable to process the data");
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<dynamic> delete(
//       String uri, {
//         data,
//         Map<String, dynamic>? queryParameters,
//         Options? options,
//         CancelToken? cancelToken,
//       }) async {
//     try {
//       var response = await _dio!.delete(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );
//       return response.data;
//     } on FormatException catch (_) {
//       throw const FormatException("Unable to process the data");
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
