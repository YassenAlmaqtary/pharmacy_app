import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/const/global_data.dart';
import 'package:pharmacy/route/roueing_page.dart';
import '../../const/colors.dart';
import '../../model/category_model.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import 'package:get/get.dart';
class MedicationsList extends StatelessWidget {

  List <Medications>medications;
  String categoryText;
   MedicationsList({required this.categoryText,required this.medications,Key? key}) : super(key: key);


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
            text:categoryText,
            size: 20,
            color: kPrimaryColor,
            weight: FontWeight.bold,
            padding: const EdgeInsets.all(8.0),
          ),
          Column(
           children:List.generate(medications.length, (index) => medicationDetails(medications[index])),
         ),
          const Divider(height:1,thickness:3),
        ],
      ),
    );
  }
    medicationDetails(Medications medication){
    return Column(
      children: [
        CachedNetworkImage(imageUrl:GlobalData.url_image+medication.photo!,
            width: 350, height: 150, fit: BoxFit.cover,
          progressIndicatorBuilder:(context, url, downloadProgress) =>
              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CustomText(
              text:medication.tradeName!,
              size: 20,
              color: kPrimaryColor,
              weight: FontWeight.bold,
              padding:const EdgeInsets.all(15),
            ),
            const Spacer(),
            CustomButton(
              width: 130,
              height: 40,
              text: "عرض الصيدلايات",
              textColor: whiteColor,
              buttonColor: kPrimaryColor,
              circularRadius: 10,
              onTap: () {
                Get.toNamed(ScreenName.pharmacyScreen,arguments:{'medication_id':medication.id});
              },
            ),
          ],
        ),
      ],
    );
  }
}
