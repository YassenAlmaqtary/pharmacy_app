import 'package:flutter/material.dart';
import 'package:pharmacy/controller/allter_netive_detaile_controller.dart';
import 'package:pharmacy/controller/pharmacy_detail_controller.dart';
import 'package:pharmacy/view/pharmacy/pharmacy_detail_list.dart';
import 'package:pharmacy/widget/custom_app_abar.dart';
import 'package:get/get.dart';

import 'allter_native_list.dart';
class AllterNativeDetail extends StatelessWidget {
  AllterNativeDetail({Key? key}) : super(key: key);
  final _controller=Get.put(AllterNativeDetailController());

  @override
  Widget build(BuildContext context) {
    _controller.getAllterNativeByPharmacyID(Get.arguments['pharmacy_id']);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(text: "الادوية البديلة"),
      ),
      body:_controller.obx((data)=>ListView.builder(itemBuilder:(context,index){
        return AlltterDetailList(allterNativeDetailModel:_controller.getAllterNative[index],);
      },
        itemCount:_controller.getAllterNative.length,
      ),
        onError:(error)=>Center(child: Text(error.toString())),
      ),

    );
  }
}
