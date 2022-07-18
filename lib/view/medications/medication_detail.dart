import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/medication_detail_controller.dart';
import 'package:pharmacy/view/medications/medication_detail_list.dart';
import '../../widget/custom_app_abar.dart';

class MedicationDetail extends StatelessWidget {
  MedicationDetail({Key? key}) : super(key: key);
  final _controller = Get.put(MedicationDetailController());

  @override
  Widget build(BuildContext context) {
    _controller.getpharmacyByPharmacyID(Get.arguments['pharmacy_id']);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(text: "الادوية"),
      ),
      body: _controller.obx(
        (data) => ListView.builder(
          itemBuilder: (context, index) {
            return MedicationDetailList(
              medicationModel: _controller.getAllmedication[index],
            );
          },
          itemCount: _controller.getAllmedication.length,
        ),
        onError: (error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
