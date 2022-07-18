import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/view/pharmacy/pharmacy_list.dart';
import '../../controller/pharmacy_controller.dart';
import '../../widget/checkNetAndProgressFotFetchData.dart';



class PharmacyScreen extends StatelessWidget {

  final _controller=Get.find<PharmacyController>();

  @override
  Widget build(BuildContext context) {
    return _controller.obx((data)=>
        RefreshIndicator(
          onRefresh:_controller.getRefeashpharmacy,
          child: ListView.builder(itemBuilder:(context,index){
          return   PharmacyList(pharmacyModel:_controller.getAllPharmacy[index],);
      },
          itemCount:_controller.getAllPharmacy.length,
      ),
        ),
        onLoading:const CheckNetAndProgressFotFetchData(),
        onError:(error)=>Center(child: Text(error.toString())),
      );


  }
}

