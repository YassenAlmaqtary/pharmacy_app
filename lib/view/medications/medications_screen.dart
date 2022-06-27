import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/category_with_medication_controller.dart';
import 'medication_list.dart';

class MedicationsScreen extends StatelessWidget {
  final _controller = Get.find<CategoryWithMedicationController>();

  MedicationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _controller.obx(
      (data) => ListView.builder(
        itemBuilder: (context, index) {
          return MedicationsList(categoryText:_controller.allCategoryWithMedication[index].name!,
          medications:_controller.allCategoryWithMedication[index].medications!,
          );
        },
        itemCount:_controller.allCategoryWithMedication.length,
      ),
      onError:(error)=>Center(child: Text(error.toString())),
    );
  }
}
