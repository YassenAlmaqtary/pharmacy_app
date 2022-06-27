import 'package:flutter/material.dart';
import 'package:pharmacy/controller/medication_search_controller.dart';
import 'package:pharmacy/widget/custom_text.dart';
import '../../widget/search_field.dart';
import 'medication_search_list.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  final _controller = Get.find<MedicationSearchController>();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? name;
    return SingleChildScrollView(
      child: Column(

          children: [
        SearchField(
              change: (value) {
                name = value;
              },
              onPressed: () {
                if (name != null || name !="" ) _controller.getMedication(name??"");
              },
            ),
        SizedBox(
          width:400,
          height:Get.height*.6,
          child: _controller.obx(
            (data) => name!=null
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return MedicationSearchList(
                        medicationText:
                            _controller.getAllMedication[index].tradeName!,
                        pharmacys: _controller.getAllMedication[index].pharmacys!,
                      );
                    },
                    itemCount: _controller.getAllMedication.length,
                  )
                :   Center(child: CustomText(text: "لايوجد بيانات",align:TextAlign.center,)),
               onLoading: Center(child: CustomText(text: "لايوجد بيانات",align:TextAlign.center,)),
            onError:(error)=>Center(child: CustomText(text: "لايوجد بيانات",align:TextAlign.center,)),
            onEmpty: Center(child: CustomText(text: "لايوجد بيانات",align:TextAlign.center,)),
          ),
        ),
      ]),
    );

  }
}
