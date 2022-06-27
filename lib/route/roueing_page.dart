import 'package:get/get.dart';
import 'package:pharmacy/view/home_screen.dart';
import 'package:pharmacy/view/medications/medications_screen.dart';
import 'package:pharmacy/view/pharmacy/pharmacy_screen.dart';

import '../view/search/screen_search.dart';
import '../view/splach_screen.dart';


class ScreenName{
  static const String splash = "/";
  static const String home = "/home";
  static const String pharmacyScreen = "/PharmacyScreen";
  static const String medicationScreen = "/medicationScreen";
  static const String searchScreen = "/searchScreen";

}

class RoutingPage{
  final List<GetPage> _setPAges = [
    GetPage(name: ScreenName.splash, page: () => const SplachScreen()),
    GetPage(name: ScreenName.home, page: () => const HomeScreen()),
    GetPage(name: ScreenName.pharmacyScreen, page: () =>  PharmacyScreen()),
    GetPage(name: ScreenName.medicationScreen, page: () =>  MedicationsScreen()),
    GetPage(name: ScreenName.searchScreen, page: () =>  SearchScreen()),
];

  get getRout => _setPAges;
}

