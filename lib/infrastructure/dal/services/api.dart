import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_clean_architecture/infrastructure/dal/storage/storage.dart'
    as storage;
import '../../../config.dart';
import '../../../domain/constant.dart';
import '../daos/dao.dart';

class ApiRequest {
  final String? baseUrl = ConfigEnvironments.getEnvironments()['url'];

  final String url;
  final dynamic data;

  ApiRequest(this.url, this.data);

  Dio _dio() {
    var instance = Dio(BaseOptions(baseUrl: baseUrl.toString()));
    instance.interceptors.add(
      AwesomeDioInterceptor(
        logRequestTimeout: false,
        logRequestHeaders: true,
        logResponseHeaders: false,
        logger: debugPrint,
      ),
    );
    return instance;
  }

  Future<dynamic> get() async {
    Map<String, dynamic> headers = {};
    Options dioOptions = Options(headers: headers);
    String? token = storage.Storage.getValue(Constant.authToken);

    if (kDebugMode) {
      print("Login token $token");
    }
    if (token != null && token != '') {
      dioOptions = Options(headers: {
        'Authorization': 'Bearer $token',
      });
    }

    try {
      var response =
          await _dio().get(url, queryParameters: data, options: dioOptions);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: url),
          response: response,
          type: DioExceptionType.connectionError,
        );
      }
    } on DioException catch (err) {
      checkException(err);
      return err;
    } catch (err) {
      return err;
    }
  }

  Future<dynamic> post() async {
    Map<String, dynamic> headers = {};
    Options dioOptions = Options(headers: headers);
    String? token = storage.Storage.getValue(Constant.authToken);

    if (kDebugMode) {
      print("Login token $token");
    }
    if (token != null && token != '') {
      dioOptions = Options(headers: {
        'Authorization': 'Bearer $token',
      });
    }
    dioOptions.contentType = Headers.jsonContentType;
    try {
      var response = await _dio().post(url, data: data, options: dioOptions);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: url),
          response: response,
          type: DioExceptionType.connectionError,
        );
      }
    } on DioException catch (err) {
      checkException(err);
      return err;
    } catch (err) {
      return err;
    }
  }

  Future<dynamic> postWithToken(String? token) async {
    Map<String, dynamic> headers = {};
    Options dioOptions = Options(headers: headers);
    if (kDebugMode) {
      print("Login token $token");
    }
    if (token != null) {
      dioOptions = Options(headers: {
        'Authorization': 'Bearer $token',
      });
    }
    dioOptions.contentType = Headers.jsonContentType;
    try {
      var response = await _dio().post(url, data: data, options: dioOptions);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: url),
          response: response,
          type: DioExceptionType.connectionError,
        );
      }
    } on DioException catch (err) {
      checkException(err);
      return err;
    } catch (err) {
      return err;
    }
  }

  void checkException(DioException error) {
    ApiException exception = ApiException();
    List<String> errorMessage = exception.getExceptionMessage(error);

    if (kDebugMode) {
      print(error);
      print(errorMessage[0]);
      print(errorMessage[1]);
    }

    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      Dao.logout();
    }

    Fluttertoast.showToast(msg: "${errorMessage[0]}: ${errorMessage[1]}");
  }
}

class ApiException {
  List<String> getExceptionMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.badResponse:
        return [
          "Bad Response Error",
          "Check api url or parameters are invalid"
        ];
      case DioExceptionType.connectionError:
        return ["Connection Error", "Check network connectivity"];
      case DioExceptionType.connectionTimeout:
        return ["Connection Timeout", "Check network connectivity"];
      case DioExceptionType.cancel:
        return ["Request Cancelled", "Check api url or parameters are invalid"];
      case DioExceptionType.receiveTimeout:
        return [
          "Receive Timeout",
          "Check api url, network connectivity or parameters are invalid"
        ];
      default:
        return ["Network Error", "Check network connectivity"];
    }
  }
}
