
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../const/global_data.dart';
import '../controller/cheek_intrnet/intrnet_ceker.dart';

class Network {
  final String url;
  Map dataSend;
  static const _map = {"": ""};
  final GetStorage _storage = GetStorage();
  final Dio _dio = Dio();
  final Duration _runTime = const Duration(seconds: 30);

  Network({required this.url, this.dataSend = _map});


  Future postData(

      {required Function(dynamic data) onSuccess,
        required Function(dynamic error) onError,
        required Function() onRunTime,
        Function()? noInterNet}) async {
    if (Get.find<GetXNetworkManager>()/*.isConnectionSuccessful.value==true*/.connectionType.value == 1) {
      try {
        print(dataSend);
        print(GlobalData.url + url);
        var response = await _dio
            .post(GlobalData.url + url,data:this.dataSend, options: Options(headers: _setHeaders()))
            .timeout(_runTime);

        if (response != null) {
          onSuccess(response.data);
        } else
          onRunTime();
      } on DioError catch (error) {
        if (error.response != null) {
          if (error.response!.data.toString() == '{"status": false,"errNum": "401","msg": "Unauthenticated user"}') {
            GlobalData.token = '';
            getToken(onSuccess: (data) {postData(onSuccess: onSuccess, onError: onError, onRunTime: onRunTime,noInterNet: noInterNet);}, onError: (error) => onError(error), onRunTime:onRunTime, noInterNet: noInterNet);
          } else {
            onError(error.response!.data ??
                "خطاء غير معروف"
            );
          }
        } else {
            "خطاء غير معروف";
        }
      }
    } else {
      if (noInterNet != null) noInterNet();
    }
  }



  Future putData(

      {required Function(dynamic data) onSuccess,
        required Function(dynamic error) onError,
        required Function() onRunTime,
        Function()? noInterNet}) async {
    if (Get.find<GetXNetworkManager>()/*.isConnectionSuccessful.value==true*/.connectionType.value == 1) {
      try {
        print(dataSend);
        print(GlobalData.url + url);
        var response = await _dio
            .put(GlobalData.url + url,data:this.dataSend, options: Options(headers: _setHeaders()))
            .timeout(_runTime);

        if (response != null) {
          onSuccess(response.data);
        } else
          onRunTime();
      } on DioError catch (error) {
        if (error.response != null) {
          if (error.response!.data.toString() == '{"status": false,"errNum": "401","msg": "Unauthenticated user"}') {
            GlobalData.token = '';
            getToken(onSuccess: (data) {postData(onSuccess: onSuccess, onError: onError, onRunTime: onRunTime,noInterNet: noInterNet);}, onError: (error) => onError(error), onRunTime:onRunTime, noInterNet: noInterNet);
          } else {
            onError(error.response!.data ??
                "خطاء غير معروف"
            );
          }
        } else {
            "خطاء غير معروف";
        }
      }
    } else {
      if (noInterNet != null) noInterNet();
    }
  }



  Future getData(
      {required Function(dynamic data) onSuccess,
        required Function(dynamic error) onError,
        required Function() onRunTime,
        Function()? noInterNet}) async {
    if (Get.find<GetXNetworkManager>()/*.isConnectionSuccessful.value==true*/.connectionType.value == 1) {
      try {
        var response = await _dio
            .get(GlobalData.url + url, options: Options(headers: _setHeaders()))
            .timeout(_runTime);
        if (response != null) {
          onSuccess(response.data);
        } else
          onRunTime();
      } on DioError catch (error) {
        if (error.response != null) {
          if (error.response!.data.toString() == '{"status": false,"errNum": "401","msg": "Unauthenticated user"}') {
            GlobalData.token = '';
            getToken(
                onSuccess: (data){postData(onSuccess: onSuccess, onError: onError, onRunTime: onRunTime);}, onError:onError, onRunTime:onRunTime);
          } else {
            onError(error.response!.data ??
                "خطاء غير معروف"
            );
          }
        } else {
            "خطاء غير معروف";
        }
      }
    } else {

      if (noInterNet != null) noInterNet();
    }
  }

  getToken({
    String? email,
    String? password,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    required Function() onRunTime,
    Function()? noInterNet,
  }) async {
    if (Get.find<GetXNetworkManager>()/*.isConnectionSuccessful.value==true*/.connectionType.value == 1) {
      try {
        var response = await _dio
            .post(GlobalData.url + 'login',
            data: {
              'email':
              email ?? "${_storage.read(GlobalData.userEmailKey)}",
              'password':
              password ?? "${_storage.read(GlobalData.userPassKey)}",

            },
            options: Options(headers:_setHeaders()))
            .timeout(_runTime);
        // ignore: unnecessary_null_comparison
        if (response != null) {
          if(response.data['status']) {
            GlobalData.token = response.data['user']["api_token"].toString();
            print(GlobalData.token);
            onSuccess(response.data);
          }
          else{
            onError(response.data['msg']);
          }
        } else {
          onRunTime();
        }
      } on DioError catch (error) {
        if (error.response != null) {
          print(error);
          onError(error.response!.data["error_description"] ??
              "خطاء غير معروف"
          );
        } else {

          "خطاء غير معروف";
        }
      }
    } else {
      if (noInterNet != null) noInterNet();
    }
  }



  Map<String, String> _setHeaders() => {
    'auth-token': GlobalData.token.toString(),
    'lan':'ar',
    'Authorization': 'Bearer ${GlobalData.token.toString()}'
  };
}
