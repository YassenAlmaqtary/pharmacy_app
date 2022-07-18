import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/const/global_data.dart';
import 'package:pharmacy/model/medication_detail_model.dart';
import '../../const/colors.dart';
import '../../model/pharmacy_detail_model.dart';
import '../../widget/custom_text.dart';
import 'package:get/get.dart';

class MedicationDetailList extends StatelessWidget {
  MedicationDetailModel medicationModel;

  MedicationDetailList({required this.medicationModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal:1),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: GlobalData.url_image + medicationModel.photo!,
            width: 350,
            height: 150,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          const SizedBox(
            height:15,
          ),
          Card(
            margin:EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width:Get.width,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: " الاسم التجاري :"+medicationModel.name!,
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),

                  CustomText(
                    text: " الاسم العلمي:"+medicationModel.scientificName!,
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text: "السعر:\t"+medicationModel.price.toString()+"\t ريال",
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text: " الكمية:"+medicationModel.quntity.toString(),
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),

                  CustomText(
                    text:"تاريخ الانتاج: "+medicationModel.productionDate.toString(),
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text: " تاريخ الانتهاء:"+medicationModel.expiryDate!,
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
