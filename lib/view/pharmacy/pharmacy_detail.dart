import 'package:flutter/material.dart';
import 'package:pharmacy/controller/pharmacy_detail_controller.dart';
import 'package:pharmacy/view/pharmacy/pharmacy_detail_list.dart';
import 'package:pharmacy/widget/custom_app_abar.dart';
import 'package:get/get.dart';
class PharmacyDetail extends StatelessWidget {
  PharmacyDetail({Key? key}) : super(key: key);
  final _controller=Get.put(PharmacyDetailController());

  @override
  Widget build(BuildContext context) {
    _controller.getpharmacyByMedcationID(Get.arguments['medication_id']);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(text: "الصيدلايات"),
      ),
      body:_controller.obx((data)=>ListView.builder(itemBuilder:(context,index){
        return   PharmacyDetailList(pharmacyModel:_controller.getAllPharmacy[index],);
      },
      itemCount:_controller.getAllPharmacy.length,
      ),
        onError:(error)=>Center(child: Text(error.toString())),
      ),

    );
  }
}
