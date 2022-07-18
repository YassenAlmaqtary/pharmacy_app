import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/const/global_data.dart';
import '../../const/colors.dart';
import '../../model/medication_search_model.dart';
import '../../widget/custom_text.dart';
import 'package:get/get.dart';


class MedicationSearchList extends StatelessWidget {

  List <Pharmacys>pharmacys;
  String medicationText;
  MedicationSearchList({required this.medicationText,required this.pharmacys,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      //color:Colors.blue,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical:4, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text:medicationText,
            size: 20,
            color: kPrimaryColor,
            weight: FontWeight.bold,
            padding: const EdgeInsets.all(8.0),
          ),
          Column(
           children:List.generate(pharmacys.length, (index) => PharmacyDetails(pharmacys[index])),
         ),
          const Divider(height:1,thickness:3),
        ],
      ),
    );
  }
    PharmacyDetails(Pharmacys phrmacyModel){
    return Column(
      children: [
        CachedNetworkImage(imageUrl:GlobalData.url_image+phrmacyModel.photo!,
            width: 350, height: 150, fit: BoxFit.cover,
          progressIndicatorBuilder:(context, url, downloadProgress) =>
              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        const SizedBox(
          height: 15,
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
                  text: " اسم الصيدلية:"+phrmacyModel.name!,
                  size: 15,
                  color: kPrimaryColor,
                  weight: FontWeight.bold,
                  padding: const EdgeInsets.all(8),
                ),

                CustomText(
                  text: " العنوان:"+phrmacyModel.address!,
                  size: 15,
                  color: kPrimaryColor,
                  weight: FontWeight.bold,
                  padding: const EdgeInsets.all(8),
                ),
                CustomText(
                  text: " الموبايل:"+phrmacyModel.mobile1!,
                  size: 15,
                  color: kPrimaryColor,
                  weight: FontWeight.bold,
                  padding: const EdgeInsets.all(8),
                ),
                CustomText(
                  text: " الهاتف:"+phrmacyModel.mobile2!,
                  size: 15,
                  color: kPrimaryColor,
                  weight: FontWeight.bold,
                  padding: const EdgeInsets.all(8),
                ),
                CustomText(
                  text:"تاريخ الانتاج: "+phrmacyModel.productionDate.toString(),
                  size: 15,
                  color: kPrimaryColor,
                  weight: FontWeight.bold,
                  padding: const EdgeInsets.all(8),
                ),
                CustomText(
                  text: " تاريخ الانتهاء:"+phrmacyModel.expiryDate!,
                  size: 15,
                  color: kPrimaryColor,
                  weight: FontWeight.bold,
                  padding: const EdgeInsets.all(8),
                ),
                CustomText(
                  text: " تفاصيل العنوان:"+phrmacyModel.adderss_details!,
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
    );
  }
}
