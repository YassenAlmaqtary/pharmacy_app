import 'package:get/get.dart';
import 'package:pharmacy/model/allter_native_detail_model.dart';
import '../Netowrk/network.dart';


class AllterNativeDetailController extends GetxController with StateMixin<List<AllterNativeDetailModel>> {

  late RxBool isLoad;
  late List<AllterNativeDetailModel>getAllterNative;

  @override
  void onInit() async {
    getAllterNative = List<AllterNativeDetailModel>.empty(growable: true);
    isLoad = false.obs;
  }

  getAllterNativeByPharmacyID(int id) async {
    getAllterNative = List<AllterNativeDetailModel>.empty(growable: true);
    isLoad.value = true;
    change(null, status: RxStatus.loading());
    await Network(url: 'allterNatives/allterNativeExsiteOFPharmacy?pharmacy_id=${id}')
        .getData(
        onSuccess: (data) {
          if (data['status'] && data['data'] != null) {
            var dataLat = data['data'] as List;
            getAllterNative.addAll(
                dataLat.map((e) => AllterNativeDetailModel.fromJson(e)));
            change(getAllterNative, status: RxStatus.success());
          }
          else {
            isLoad.value = false;
            change([], status: RxStatus.empty());
          }
        },
        onError: (error) {
          isLoad.value = false;
          change(getAllterNative, status: RxStatus.error());
        }, onRunTime: () {
      print("run time");
      isLoad.value = false;
    }, noInterNet: () {
      print("not-intrenet");
      isLoad.value = false;
    });
  }
}