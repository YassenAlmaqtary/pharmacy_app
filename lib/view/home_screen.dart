import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/const/colors.dart';
import 'package:pharmacy/view/medications/medications_screen.dart';
import 'package:pharmacy/view/pharmacy/pharmacy_screen.dart';
import 'package:pharmacy/view/search/screen_search.dart';
import '../widget/custom_app_abar.dart';
import 'gaz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int current = 0;
  List<Widget> widgetItems = [
     MedicationsScreen(),
     PharmacyScreen(),
     SearchScreen(),
    //GazScreen(),
  ];
  List<String>titles=[
    "الادوية مع الاقسام",
    "الصيدلايات",
    "بحث",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppBar(text:titles[current]),
        ),
        body: widgetItems[current],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: CurvedNavigationBar(
            color: kPrimaryColor,
            backgroundColor: whiteColor,
            items: const <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: whiteColor,
              ),
              Icon(
                Icons.error,
                size: 30,
                color: whiteColor,
              ),
              Icon(
                Icons.search,
                size: 30,
                color: whiteColor,
              ),


            ],
            onTap: (index) {
              setState(() {
                current=index;
              });
            },
          ),
        ));
  }
}
