import 'package:get/get.dart';
import 'package:pharmacy/view/allter_native/allter_natve_detail.dart';
import 'package:pharmacy/view/home_screen.dart';
import 'package:pharmacy/view/medications/medication_detail.dart';
import 'package:pharmacy/view/medications/medications_screen.dart';
import 'package:pharmacy/view/pharmacy/pharmacy_detail.dart';
import 'package:pharmacy/view/pharmacy/pharmacy_screen.dart';

import '../view/search/screen_search.dart';
import '../view/splach_screen.dart';


class ScreenName{
  static const String splash = "/";
  static const String home = "/home";
  static const String pharmacyDetail = "/PharmacyDetail";
  static const String pharmacyScreen = "/pharmacyScreen";
  static const String medicationDetail = "/medicationDetail";
  static const String medicationScreen = "/medicationScreen";
  static const String searchScreen = "/searchScreen";
  static const String allterNativeDetail = "/allterNativeDetail";


}

class RoutingPage{
  final List<GetPage> _setPAges = [
    GetPage(name: ScreenName.splash, page: () => const SplachScreen()),
    GetPage(name: ScreenName.home, page: () => const HomeScreen()),
    GetPage(name: ScreenName.pharmacyDetail, page: () =>  PharmacyDetail()),
    GetPage(name: ScreenName.pharmacyScreen, page: () =>  PharmacyScreen()),
    GetPage(name: ScreenName.medicationDetail, page: () => MedicationDetail()),
    GetPage(name: ScreenName.medicationScreen, page: () =>  MedicationsScreen()),
    GetPage(name: ScreenName.searchScreen, page: () =>  SearchScreen()),
    GetPage(name: ScreenName.allterNativeDetail, page: () => AllterNativeDetail()),

];

  get getRout => _setPAges;
}

