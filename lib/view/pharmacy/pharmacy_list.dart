import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/const/global_data.dart';
import '../../const/colors.dart';
import '../../model/pharmacy_model.dart';
import '../../widget/custom_text.dart';

class PharmacyList extends StatelessWidget {
  PharmacyModel pharmacyModel;

  PharmacyList({required this.pharmacyModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
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
            height: 15,
          ),
          Row(
            children: [
              CustomText(
                text: pharmacyModel.name!,
                size: 15,
                color: kPrimaryColor,
                weight: FontWeight.bold,
                padding: const EdgeInsets.all(15),
              ),
              const Spacer(),
              CustomText(
                text:pharmacyModel.quntity.toString()+" حبة",
                size: 15,
                color: kPrimaryColor,
                weight: FontWeight.bold,
                padding: const EdgeInsets.all(15),
              ),
              const Spacer(),
              CustomText(
                text:pharmacyModel.mobile!+"\n السعر:\t${pharmacyModel.price}",
                size: 15,
                color: kPrimaryColor,
                weight: FontWeight.bold,
                padding: const EdgeInsets.all(15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
