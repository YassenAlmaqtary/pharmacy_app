 import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

 import 'package:connectivity_plus/connectivity_plus.dart';
 import 'package:flutter/services.dart';
 import 'package:get/get.dart';
 class GetXNetworkManager extends GetxService
 {
   //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
   late RxInt connectionType;
   //Instance of Flutter Connectivity
   final Connectivity connectivity = Connectivity();
   //Stream to keep listening to network change state
   late StreamSubscription _streamSubscription ;
   @override
   void onInit()async {
     connectionType=0.obs;
    GetConnectionType();
     _streamSubscription = connectivity.onConnectivityChanged.listen(_updateState);

   }
   // a method to get which connection result, if you we connected to internet or no if yes then which network
   Future<void>GetConnectionType() async{
     var connectivityResult;
     try{
       connectivityResult = await (connectivity.checkConnectivity());
     }on PlatformException catch(e){
       print(e);
     }
     return _updateState(connectivityResult);
   }
   // state update, of network, if you are connected to WIFI connectionType will get set to 1,
   // and update the state to the consumer of that variable.
   _updateState(ConnectivityResult result)
   {
     switch(result)
     {
      case ConnectivityResult.wifi:
         connectionType.value=1;
         print("wifi entent");
         break;
       case ConnectivityResult.mobile:
         connectionType.value=1;
         print("mobile entent");
         break;

      case ConnectivityResult.none:
         connectionType.value=0;
         break;
    default:
      connectionType.value=1;
      Get.snackbar('Network Error', 'Failed to get Network Status');
      break;
     }
   }
   @override
   void onClose() {
     //stop listening to network state when app is closed
     _streamSubscription.cancel();

  }
 }



 // class GetXNetworkManager extends GetxService{
 //
 //   late RxBool isConnectionSuccessful;
 //   @override
 //  void onInit()async {
 //     isConnectionSuccessful=false.obs;
 //     await _tryConnection();
 //    // TODO: implement onInit
 //    super.onInit();
 //  }
 //
 //   Future<void> _tryConnection() async {
 //     try {
 //       final response = await InternetAddress.lookup('https://www.google.com/');
 //
 //         isConnectionSuccessful.value = response.isNotEmpty;
 //
 //
 //     } on SocketException catch (e) {
 //       print(e);
 //         isConnectionSuccessful.value = false;
 //     }
 //   }
 // }

















