import 'package:flutter/material.dart';
import 'package:pharmacy/widget/custom_text.dart';

import '../const/colors.dart';

class CustomAppBar extends StatelessWidget {
  String text;
  FontWeight? weight;
  Color? textColor;
   CustomAppBar({Key? key,required this.text,this.weight,this.textColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation:0,
      backgroundColor: Colors.transparent,
      title:CustomText( text: text,color:textColor,weight:weight,),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          shape:BoxShape.rectangle,
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
          ),
        ),
      ),
    );
  }
}
