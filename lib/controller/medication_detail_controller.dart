import 'package:get/get.dart';
import 'package:pharmacy/model/medication_detail_model.dart';
import '../Netowrk/network.dart';


class MedicationDetailController extends GetxController with StateMixin<List<MedicationDetailModel>> {

  late RxBool isLoad;
  late List<MedicationDetailModel>getAllmedication;

  @override
  void onInit() async {
    getAllmedication = List<MedicationDetailModel>.empty(growable: true);
    isLoad = false.obs;
  }

  getpharmacyByPharmacyID(int id) async {
    getAllmedication = List<MedicationDetailModel>.empty(growable: true);
    isLoad.value = true;
    change(null, status: RxStatus.loading());
    await Network(url: 'pharmacys/medication-byOf-pharmacy?pharmacy_id=${id}')
        .getData(
        onSuccess: (data) {
          if (data['status'] && data['data'] != null) {
            var dataLat = data['data'] as List;
            getAllmedication.addAll(
                dataLat.map((e) => MedicationDetailModel.fromJson(e)));
            change(getAllmedication, status: RxStatus.success());
          }
          else {
            isLoad.value = false;
            change([], status: RxStatus.empty());
          }
        },
        onError: (error) {
          isLoad.value = false;
          change(getAllmedication, status: RxStatus.error());
        }, onRunTime: () {
      print("run time");
      isLoad.value = false;
    }, noInterNet: () {
      print("not-intrenet");
      isLoad.value = false;
    });
  }
}