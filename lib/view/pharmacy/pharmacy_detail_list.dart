import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/const/global_data.dart';
import '../../const/colors.dart';
import '../../model/pharmacy_detail_model.dart';
import '../../widget/custom_text.dart';
import 'package:get/get.dart';

class PharmacyDetailList extends StatelessWidget {
  PharmacyDetailModel pharmacyModel;

  PharmacyDetailList({required this.pharmacyModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal:1),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: GlobalData.url_image + pharmacyModel.photo!,
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
                    text: " اسم الصيدلية:"+pharmacyModel.name!,
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),

                  CustomText(
                    text: " العنوان:"+pharmacyModel.address!,
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text: "السعر:\t"+pharmacyModel.price.toString()+"\t ريال",
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text: " الموبايل:"+pharmacyModel.mobile!,
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text: " الهاتف:"+pharmacyModel.phone!,
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text:"تاريخ الانتاج: "+pharmacyModel.productionDate.toString(),
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text: " تاريخ الانتهاء:"+pharmacyModel.expiryDate!,
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text: " تفاصيل العنوان:"+pharmacyModel.adderssDetails!,
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
