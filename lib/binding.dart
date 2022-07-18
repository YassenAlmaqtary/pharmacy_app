import 'package:get/get.dart';
import 'package:pharmacy/controller/category_with_medication_controller.dart';
import 'package:pharmacy/controller/medication_search_controller.dart';
import 'package:pharmacy/controller/pharmacy_detail_controller.dart';

import 'controller/pharmacy_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>CategoryWithMedicationController());
    Get.lazyPut(()=>MedicationSearchController());
    Get.lazyPut(() => PharmacyController());
  }
}
