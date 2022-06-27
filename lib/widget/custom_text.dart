import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
   String text;
   Color? color;
   double? size;
   TextAlign? align;
   FontWeight?weight;
    EdgeInsetsGeometry ?padding;
   CustomText({Key? key, required this.text,this.color,this.size,this.align,this.weight,
   this.padding,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding??EdgeInsets.zero,
      child: Text(
        text,
         style: TextStyle(
           color:color,
           fontSize:size,
           fontWeight:weight,
         ),
        textAlign:align,

      ),
    );
  }
}
