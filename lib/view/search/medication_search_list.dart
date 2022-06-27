import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/const/global_data.dart';
import '../../const/colors.dart';
import '../../model/medication_search_model.dart';
import '../../widget/custom_text.dart';



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
        Row(
          children: [
            CustomText(
              text:phrmacyModel.name!,
              size: 14,
              color: kPrimaryColor,
              weight: FontWeight.bold,
              padding:const EdgeInsets.all(15),
            ),
            const Spacer(),
            CustomText(
              text:phrmacyModel.quntity.toString(),
              size: 14,
              color: kPrimaryColor,
              weight: FontWeight.bold,
              padding:const EdgeInsets.all(15),
            ),
            const Spacer(),
            CustomText(
                text:phrmacyModel.mobile1!+"\n السعر:\t${phrmacyModel.price}",
              size: 15,
              color: kPrimaryColor,
              weight: FontWeight.bold,
              padding: const EdgeInsets.all(15),
            ),
            const Spacer(),

          ],
        ),
      ],
    );
  }
}
