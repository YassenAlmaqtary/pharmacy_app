import 'package:get/get.dart';
import '../Netowrk/network.dart';
import '../model/pharmacy_detail_model.dart';
import 'cheek_intrnet/intrnet_ceker.dart';

class PharmacyDetailController extends GetxController with StateMixin<List<PharmacyDetailModel>>{

  late RxBool isLoad;
  late List<PharmacyDetailModel>getAllPharmacy;
  @override
  void onInit()async{
    getAllPharmacy=List<PharmacyDetailModel>.empty(growable: true);
    isLoad=false.obs;
  }
  getpharmacyByMedcationID(int id) async{
    getAllPharmacy=List<PharmacyDetailModel>.empty(growable: true);
    isLoad.value = true;
    change(null, status: RxStatus.loading());
    await Network(url:'medications/pharmacy-byOf-medication?medication_id=${id}' ).getData(
        onSuccess: (data){

          if(data['status']&&data['data']!=null){
            var dataLat=data['data'] as List;
            getAllPharmacy.addAll(dataLat.map((e) => PharmacyDetailModel.fromJson(e)));
            change(getAllPharmacy,status:RxStatus.success());
          }
          else{
            isLoad.value=false;
            change([],status:RxStatus.empty());
          }
        },
        onError:(error){
          isLoad.value=false;
          change(getAllPharmacy,status:RxStatus.error());
        }, onRunTime:(){
      print("run time");
      isLoad.value=false;
    },noInterNet:(){
      print("not-intrenet");
      isLoad.value=false;
    });
  }

}