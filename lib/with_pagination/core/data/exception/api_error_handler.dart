// import 'package:dio/dio.dart';
//
// import '../model/error_response.dart';
//
// class ApiErrorHandler {
//   static dynamic getMessage(error) {
//     dynamic errorDescription = "";
//     if (error is Exception) {
//       try {
//         if (error is DioException) {
//           switch (error.type) {
//             case DioExceptionType.cancel:
//               errorDescription = "Request to API server was cancelled";
//               break;
//             case DioExceptionType.connectionTimeout:
//               errorDescription = "Connection timeout with API server";
//               break;
//             case DioExceptionType.unknown:
//               errorDescription =
//                   "Connection to API server failed due to internet connection";
//               break;
//             case DioExceptionType.receiveTimeout:
//               errorDescription =
//                   "Receive timeout in connection with API server";
//               break;
//             case DioExceptionType.badResponse:
//               switch (error.response?.statusCode) {
//                 case 400:
//                   errorDescription = "আপনার পর্যাপ্ত কোয়ান্টিটি নেই";
//                   break;
//                 case 401:
//                   errorDescription =
//                       "400 Bad Request: Something went wrong, please try again later.";
//                   break;
//                 case 422:
//                   ErrorResponse errorResponse =
//                       ErrorResponse.fromJson(error.response?.data);
//                   errorDescription = error.response?.data
//                       .toString()
//                       .replaceAll(RegExp(r'[{}]'), '');
//                   break;
//                 case 404:
//                 case 500:
//                 case 503:
//                   errorDescription = error.response?.statusMessage;
//                   break;
//                 default:
//                   ErrorResponse errorResponse =
//                       ErrorResponse.fromJson(error.response?.data);
//                   if (errorResponse.errors!.isNotEmpty) {
//                     errorDescription = errorResponse;
//                   } else {
//                     errorDescription =
//                         "Failed to load data - status code: ${error.response?.statusCode}";
//                   }
//               }
//               break;
//             case DioExceptionType.sendTimeout:
//               errorDescription = "Send timeout with server";
//               break;
//             case DioExceptionType.badCertificate:
//               // TODO: Handle this case.
//               break;
//             case DioExceptionType.connectionError:
//
//               break;
//           }
//         } else {
//           errorDescription = "Unexpected error occured";
//         }
//       } on FormatException catch (e) {
//         errorDescription = e.toString();
//       }
//     } else {
//       errorDescription = "is not a subtype of exception";
//     }
//     return errorDescription;
//   }
// }
