import 'package:flutter/material.dart';
import 'package:pharmacy/controller/pharmacy_controller.dart';
import 'package:pharmacy/view/pharmacy/pharmacy_list.dart';
import 'package:pharmacy/widget/custom_app_abar.dart';
import 'package:get/get.dart';
class PharmacyScreen extends StatelessWidget {
   PharmacyScreen({Key? key}) : super(key: key);
  final _controller=Get.put(PharmacyController(id:Get.arguments['medication_id']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(text: "الصيدلايات"),
      ),
      body:_controller.obx((data)=>ListView.builder(itemBuilder:(context,index){
        return   PharmacyList(pharmacyModel:_controller.getAllPharmacy[index],);
      },
      itemCount:_controller.getAllPharmacy.length,
      ),
        onError:(error)=>Center(child: Text(error.toString())),
      ),

    );
  }
}
