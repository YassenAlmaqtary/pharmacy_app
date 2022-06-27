import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharmacy/route/roueing_page.dart';
import 'package:pharmacy/view/home_screen.dart';
import './view/splach_screen.dart';
import 'package:get/get.dart';

import 'binding.dart';
import 'controller/cheek_intrnet/intrnet_ceker.dart';
void main() async{
  await GetStorage.init();
  Get.put(GetXNetworkManager(),permanent:true );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      locale: Locale('ar'),
      theme: ThemeData(
        fontFamily: "Cairo"
      ),
      initialBinding:Binding(),
      initialRoute:ScreenName.splash,
      getPages: RoutingPage().getRout,
    );



  }
}
