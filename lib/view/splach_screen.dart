import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharmacy/view/home_screen.dart';
import '../const/colors.dart';



class SplachScreen extends StatefulWidget {
   const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds:10),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
        color:whiteColor,
         child:Center(
           child:Image.asset('assets/images/log.jpg'),
         )
    );
  }
}
