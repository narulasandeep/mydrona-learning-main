import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dronalms/app/constants/environments.dart';
import 'package:dronalms/app/data/Services/Api_Provider/custom_exception.dart';
import 'package:dronalms/app/data/Services/storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class APIBaseService {
  final String _baseUrl = Environments.DEV;
  late Dio _dio;

  Map<String, dynamic> headers = {
    "content-type": "application/json",
    "Accept": "application/json",
  };

  APIBaseService() {
    Get.find<GetStorageService>().isLoggedIn
        ? headers.addAll({
            "Cookie": "token=${Get.find<GetStorageService>().token.toString()}"
          })
        : headers;
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: 20000,
        receiveTimeout: 20000,
        contentType: 'application/json',
        headers: headers,
        responseType: ResponseType.plain,
      ),
    );
  }

  //get method
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(endPoint, queryParameters: queryParameters);
      // print("----${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.data);
      }
    } on DioError catch (e) {
      print("----DioError----");
      dioErrorHandler(e);
    } on Exception catch (e) {
      throw FetchDataException("Error", e.toString());
    }
  }

  // post method
  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> requestedData,
  }) async {
    try {
      var response = await _dio.post(
        endPoint,
        data: jsonEncode(headers..addAll(requestedData)),
      );
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.data);
      }
    } on DioError catch (e) {
      dioErrorHandler(e);
    } on Exception catch (e) {
      throw FetchDataException("Error", e.toString());
    }
  }

  dynamic dioErrorHandler(DioError error) {
    if (error.type == DioErrorType.other) {
      throw FetchDataException("Connection Time Out", "No Internet Connection");
    } else if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      throw ApiNotRespondingException("Session Time Out", "Session has been expired");
    } else if (error.type == DioErrorType.response) {
      Map data = json.decode(error.response!.data);
      print("error.response!.data:$data");
      ErrorHandler errorHandler = ErrorHandler(
          errorMessage: data["message"],
          errorCode: error.response!.statusCode!,
          metadata: data["code"]);

      switch (errorHandler.errorCode) {
        case 400:
          throw BadRequestException(errorHandler.errorMessage, errorHandler.metadata);
        case 401:
          throw BadRequestException(errorHandler.errorMessage, errorHandler.metadata);
        case 410:
          throw BadRequestException(errorHandler.errorMessage, errorHandler.metadata);
        case 413:
          throw UnAuthorizedException(errorHandler.errorMessage, errorHandler.metadata);
        case 404:
          throw NotFoundDataException(errorHandler.errorMessage, errorHandler.metadata);
        case 500:
          throw InternalServerError(errorHandler.errorMessage, errorHandler.metadata);
        default:
          throw FetchDataException(errorHandler.errorMessage, errorHandler.metadata);
      }
    } else {
      throw FetchDataException("Error", "Something Went Wrong");
    }
  }
}

class ErrorHandler {
  String errorMessage;
  int errorCode;
  String metadata;

  ErrorHandler({required this.errorMessage, required this.errorCode, required this.metadata});
}
