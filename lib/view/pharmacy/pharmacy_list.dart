import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/const/global_data.dart';
import '../../const/colors.dart';
import '../../model/pharmacy_model.dart';
import '../../route/roueing_page.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import 'package:get/get.dart';

class PharmacyList extends StatelessWidget {
  PharmacyModel pharmacyModel;

  PharmacyList({required this.pharmacyModel, Key? key}) : super(key: key);

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
                    text: " الموبايل:"+pharmacyModel.mobile1!,
                    size: 15,
                    color: kPrimaryColor,
                    weight: FontWeight.bold,
                    padding: const EdgeInsets.all(8),
                  ),
                  CustomText(
                    text: " الهاتف:"+pharmacyModel.mobile2!,
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
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          width: 130,
                          height: 40,
                          text: " الادوية الرئيسية ",
                          textColor: whiteColor,
                          buttonColor: kPrimaryColor,
                          circularRadius: 10,
                          onTap: () {
                            Get.toNamed(ScreenName.medicationDetail,arguments:{'pharmacy_id':pharmacyModel.id});
                          }
                      ),

                      CustomButton(
                          width: 130,
                          height: 40,
                          text: " الادويةالبديلة ",
                          textColor: whiteColor,
                          buttonColor: kPrimaryColor,
                          circularRadius: 10,
                          onTap: () {
                            Get.toNamed(ScreenName.allterNativeDetail,arguments:{'pharmacy_id':pharmacyModel.id});
                          }
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
