import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/colors.dart';

class SearchField extends StatelessWidget {
  void Function(String?)?save ,change ;
  void Function()? onPressed;
  SearchField({Key? key, this.save,this.onPressed,this.change}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(16.0),
      child: TextFormField(
        onChanged:change,
        onSaved:save,
        decoration:  InputDecoration(
          border: InputBorder.none,
          focusedBorder:InputBorder.none,
          enabledBorder:InputBorder.none,
          hintText:"ابحث عن اسم الدواء",
          prefixIcon: IconButton(onPressed:onPressed, icon:const Icon(Icons.search,color:Colors.black,)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal:20,
            vertical:9,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
